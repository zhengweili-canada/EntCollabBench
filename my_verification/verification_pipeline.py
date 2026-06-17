"""
my_verification/verification_pipeline.py

Stage 2 — Pre-Delegation Check        (P3: Verified Execution)
Stage 3 — Capability-Scoped Access    (P2: Capability Scoping)  ← NEW v4
Stage 5 — Post-Generation Audit       (P5: Data Isolation)

Single source of truth for all verification logic.
Imported by agent.py; controlled via VERIFICATION_MODE env var:

    VERIFICATION_MODE=baseline        -> no intervention          (Phase 1)
    VERIFICATION_MODE=stage2          -> Stage 2 only             (Phase 2)
    VERIFICATION_MODE=stage2_stage5   -> Stage 2 + Stage 5        (Phase 3)
    VERIFICATION_MODE=stage5_only     -> Stage 5 only             (Phase 4)
    VERIFICATION_MODE=stage3_stage5   -> Stage 3 + Stage 5        (Phase 5) NEW
    VERIFICATION_MODE=stage3_only     -> Stage 3 only             (Phase 6) NEW

Changelog v4 (2026-06-15):
  Stage 3 (NEW): Capability-Scoped Access added.
    - Intercepts each tool call BEFORE it executes
    - Checks whether the calling agent is authorized to access the MCP server
    - Blocks unauthorized tool calls and returns an error instructing the agent
      to delegate instead
    - Authorized server map derived empirically from >20% usage threshold
      across 160 workflow tasks
    - Active when VERIFICATION_MODE is 'stage3_stage5' or 'stage3_only'
    - Tool name format: mcp_{server}_{action} — server extracted from prefix

  Stage 5: Bug fix from v3 retained — agent_name (not target_agent) used
    in ZERO_TRACE_AGENTS check.

Changelog v3 (2026-06-11):
  Stage 5: Critical bug fix — Check 1 (zero-trace) was checking
    target_agent (the NEXT agent) instead of agent_name (the CURRENT agent).
    This meant KB specialist and it_service_desk_l1 zero-trace failures were
    never caught. Fixed to use agent_name. Recovered 27 additional KB failures.

Changelog v2 (2026-06-07):
  Stage 2: Removed mandatory regex pattern checks. Keyword-only check.
  Stage 5: Skip-phrase list trimmed. Zero-trace check restricted to
    knowledge_base_specialist and it_service_desk_l1 only.
"""

import logging
import os
import re
from typing import Dict, List, Optional, Tuple

logger = logging.getLogger(__name__)

# ── Mode ──────────────────────────────────────────────────────────────────────

VERIFICATION_MODE: str = os.getenv("VERIFICATION_MODE", "baseline").strip().lower()

# ── Stage 2 configuration ─────────────────────────────────────────────────────

AGENT_RULES: Dict[str, Dict] = {
    "knowledge_base_specialist": {
        "keywords": ["knowledge", "article", "kb"],
        "description": "Must reference a knowledge article",
    },
    "it_service_desk_l1": {
        "keywords": ["incident", "service desk", "ticket", "inc"],
        "description": "Must reference an incident or service ticket",
    },
    "it_change_engineer": {
        "keywords": ["change", "change request", "chg"],
        "description": "Must reference a change request",
    },
    "hr_service_specialist": {
        "keywords": ["hr", "onboard", "employee", "case", "hire"],
        "description": "Must reference an HR case or employee action",
    },
    "customer_support_specialist": {
        "keywords": ["customer", "support", "case", "escalat"],
        "description": "Must reference a customer support case",
    },
    "collaboration_ops_specialist": {
        "keywords": ["email", "calendar", "teams", "channel", "collaborat", "meeting"],
        "description": "Must reference a collaboration action",
    },
    "developer_engineer": {
        "keywords": ["code", "repo", "git", "commit", "pull request", "branch", "file"],
        "description": "Must reference a code or repository action",
    },
    "qa_test_engineer": {
        "keywords": ["test", "qa", "quality", "bug", "defect", "review", "branch"],
        "description": "Must reference a test or quality action",
    },
    "finance_approval_specialist": {
        "keywords": ["finance", "budget", "approval", "cost", "expense"],
        "description": "Must reference a finance approval",
    },
    "legal_approval_specialist": {
        "keywords": ["legal", "contract", "compliance", "approval", "policy"],
        "description": "Must reference a legal or compliance matter",
    },
    "procurement_approval_specialist": {
        "keywords": ["procurement", "vendor", "purchase", "approval", "order"],
        "description": "Must reference a procurement matter",
    },
}

# ── Stage 3 configuration ─────────────────────────────────────────────────────
#
# Authorized MCP servers per agent role.
# Derived empirically: servers used in >20% of 160 baseline workflow tasks
# are considered primary role tools. Servers used in <15% are boundary crossings.
#
# Tool name format in ENTCOLLABBENCH: mcp_{server}_{action}
# Examples:
#   mcp_email_send_message        -> server = "email"
#   mcp_itsm_create_incident      -> server = "itsm"
#   mcp_hr_update_case            -> server = "hr"
#   mcp_calendar_create_event     -> server = "calendar"
#   mcp_gitea_create_file         -> server = "gitea"
#
# Special tool names that are always allowed (schema/meta tools):
#   mcp_*_list_tools, mcp_*_get_tool_schema
#   ask_*_by_http (delegation tools — handled by Stage 2, not Stage 3)

AUTHORIZED_SERVERS: Dict[str, set] = {
    "collaboration_ops_specialist": {"email", "calendar", "teams", "drive"},
    "customer_support_specialist":  {"csm"},
    "developer_engineer":           {"gitea"},
    "hr_service_specialist":        {"hr"},
    "it_change_engineer":           {"itsm"},
    "it_service_desk_l1":           {"itsm"},
    "knowledge_base_specialist":    {"csm", "itsm", "hr"},
    "qa_test_engineer":             {"gitea"},
    # Approval agents (future work — approval task track)
    "finance_approval_specialist":  {"finance"},
    "legal_approval_specialist":    {"legal"},
    "procurement_approval_specialist": {"procurement"},
}

# Tool name prefix pattern: mcp_{server}_{action}
_MCP_TOOL_PREFIX = re.compile(r"^mcp_([a-z0-9]+)_(.+)$")

# Schema/meta tools that are always allowed regardless of server
_ALWAYS_ALLOWED_ACTIONS = {"list_tools", "get_tool_schema"}

# Delegation tools — handled by Stage 2, not Stage 3
_DELEGATION_TOOL_PREFIX = "ask_"


def _extract_server_from_tool_name(tool_name: str) -> Optional[str]:
    """
    Extract the MCP server name from a tool name.
    Format: mcp_{server}_{action}
    Returns None if the tool name does not follow this pattern
    (e.g. delegation tools, workspace tools).
    """
    if not tool_name or tool_name.startswith(_DELEGATION_TOOL_PREFIX):
        return None
    m = _MCP_TOOL_PREFIX.match(tool_name)
    if not m:
        return None
    return m.group(1)


# ── Stage 5 configuration ─────────────────────────────────────────────────────

SKIP_PHRASES: List[str] = [
    "no update needed",
    "no changes needed",
    "no changes required",
    "already up to date",
    "no action required",
    "no action needed",
    "nothing to do",
    "article is correct",
]

ZERO_TRACE_AGENTS: List[str] = [
    "knowledge_base_specialist",
    "it_service_desk_l1",
]

SKIP_PHRASE_MAX_TRACE_FOR_BLOCK: int = 0


# ── Stage 2 ───────────────────────────────────────────────────────────────────

def validate_delegation(
    target_agent: str,
    task_description: str,
    from_agent: str = "",
) -> Tuple[bool, str, List[str]]:
    """Validate a plain-text delegation message before it is sent."""
    rules = AGENT_RULES.get(target_agent)
    if not rules:
        logger.info(
            "[stage2] stage2_passed (no rule) from=%s to=%s",
            from_agent, target_agent,
        )
        return True, "OK", []

    text = task_description.lower()
    keywords = rules.get("keywords", [])

    if keywords and not any(kw in text for kw in keywords):
        missing = [f"none of required keywords {keywords}"]
        reason = (
            f"[Stage2 BLOCKED] Delegation to {target_agent} from {from_agent} "
            f"failed validation. Missing: {missing}. "
            f"Rule: {rules.get('description', '')}"
        )
        logger.warning(
            "[stage2] stage2_blocked from=%s to=%s missing=%s",
            from_agent, target_agent, missing,
        )
        return False, reason, missing

    logger.info("[stage2] stage2_passed from=%s to=%s", from_agent, target_agent)
    return True, "OK", []


def check_stage2(
    task_description: str,
    target_agent: str,
    from_agent: str,
) -> Optional[str]:
    """
    Entry point called by agent.py Stage 2 hook.
    Returns error string if blocked, else None.
    Active when VERIFICATION_MODE is 'stage2' or 'stage2_stage5'.
    """
    if VERIFICATION_MODE not in ("stage2", "stage2_stage5"):
        return None

    is_valid, reason, missing = validate_delegation(
        target_agent=target_agent,
        task_description=task_description,
        from_agent=from_agent,
    )
    metrics.record(target_agent=target_agent, is_valid=is_valid)

    if not is_valid:
        return (
            f"Error: delegation to '{target_agent}' blocked by Stage 2 "
            f"pre-delegation check. {reason} "
            "Please add the missing information and retry."
        )
    return None


# ── Stage 3 ───────────────────────────────────────────────────────────────────

def check_stage3(
    agent_name: str,
    tool_name: str,
) -> Optional[str]:
    """
    Stage 3 — Capability-Scoped Access (P2: Capability Scoping)

    Called BEFORE each MCP tool call executes (hook in agent.py
    _record_message_step, after tool_name is extracted).

    Checks whether the calling agent is authorized to access the MCP server
    implied by the tool name. If not authorized, blocks the call and instructs
    the agent to delegate to the appropriate agent instead.

    Returns error string if blocked, else None.
    Active when VERIFICATION_MODE is 'stage3_stage5' or 'stage3_only'.

    Design decisions:
    - Schema/meta tools (list_tools, get_tool_schema) are always allowed —
      agents need these to discover available tools regardless of role.
    - Delegation tools (ask_*_by_http) are not intercepted here — handled
      by Stage 2 pre-delegation check.
    - Unknown agents (not in AUTHORIZED_SERVERS) are allowed through —
      fail-open to avoid breaking approval track agents not yet configured.
    - Unknown tool name formats (non-mcp_ prefix) are allowed through.
    """
    if VERIFICATION_MODE not in ("stage3_stage5", "stage3_only"):
        return None

    # Extract server from tool name
    server = _extract_server_from_tool_name(tool_name)
    if server is None:
        # Not an MCP tool (delegation tool, workspace tool, etc.) — allow
        return None

    # Schema/meta tools always allowed
    action = tool_name[len(f"mcp_{server}_"):]
    if action in _ALWAYS_ALLOWED_ACTIONS:
        return None

    # Check authorization
    authorized = AUTHORIZED_SERVERS.get(agent_name)
    if authorized is None:
        # Agent not in map — fail open, allow through
        logger.info(
            "[stage3] stage3_unknown_agent agent=%s tool=%s — allowing through",
            agent_name, tool_name,
        )
        return None

    if server in authorized:
        logger.info(
            "[stage3] stage3_passed agent=%s tool=%s server=%s",
            agent_name, tool_name, server,
        )
        stage3_metrics.record(agent_name=agent_name, blocked=False, server=server)
        return None

    # Blocked — unauthorized server access
    logger.warning(
        "[stage3] stage3_blocked agent=%s tool=%s server=%s authorized=%s",
        agent_name, tool_name, server, sorted(authorized),
    )
    stage3_metrics.record(agent_name=agent_name, blocked=True, server=server)

    # Find which agent should handle this server
    delegatee = _find_authorized_agent(server)
    delegation_hint = (
        f" Please delegate this task to '{delegatee}' instead."
        if delegatee
        else " Please delegate this task to the agent responsible for this service."
    )

    return (
        f"Error: '{agent_name}' is not authorized to access the '{server}' "
        f"service (tool: '{tool_name}'). "
        f"Authorized services for this role: {sorted(authorized)}."
        + delegation_hint
    )


def _find_authorized_agent(server: str) -> Optional[str]:
    """Find which agent is primarily responsible for a given server."""
    for agent, servers in AUTHORIZED_SERVERS.items():
        if server in servers:
            return agent
    return None


# ── Stage 5 ───────────────────────────────────────────────────────────────────

def check_stage5(
    result: str,
    agent_name: str,
    target_agent: str,
    trace_event_count: int,
) -> Optional[str]:
    """
    Entry point called by agent.py Stage 5 hook.
    Returns error string if silent skip detected, else None.
    Active when VERIFICATION_MODE is 'stage2_stage5' or 'stage5_only'
    or 'stage3_stage5'.

    v3 fix: uses agent_name (not target_agent) in ZERO_TRACE_AGENTS check.
    """
    if VERIFICATION_MODE not in ("stage2_stage5", "stage5_only", "stage3_stage5"):
        return None

    result_lower = result.lower()

    # Check 1: zero tool calls — restricted to confirmed silent-failure agents
    # v3 fix: agent_name (current agent) not target_agent (next agent)
    if agent_name in ZERO_TRACE_AGENTS and trace_event_count == 0:
        logger.warning(
            "[stage5] stage5_blocked (0 trace events) agent=%s target=%s",
            agent_name, target_agent,
        )
        stage5_metrics.record(
            target_agent=agent_name, blocked=True, reason="zero_trace"
        )
        return (
            f"Error: '{agent_name}' completed with 0 tool calls. "
            "The agent may have incorrectly decided no action was needed. "
            "Please retry and ensure the required updates are actually applied."
        )

    # Check 2: skip-phrase detection — ONLY fires if trace count is also low
    for phrase in SKIP_PHRASES:
        if phrase in result_lower:
            if trace_event_count <= SKIP_PHRASE_MAX_TRACE_FOR_BLOCK:
                logger.warning(
                    "[stage5] stage5_blocked (phrase=%r, trace=%d) agent=%s target=%s",
                    phrase, trace_event_count, agent_name, target_agent,
                )
                stage5_metrics.record(
                    target_agent=agent_name,
                    blocked=True,
                    reason=f"skip_phrase:{phrase}",
                )
                return (
                    f"Error: '{agent_name}' appears to have skipped required work "
                    f"(response contained '{phrase}' with only {trace_event_count} "
                    f"tool calls). "
                    "Please retry and ensure all required tool calls are executed."
                )
            else:
                logger.info(
                    "[stage5] stage5_phrase_suppressed (phrase=%r, trace=%d>=threshold) "
                    "agent=%s target=%s",
                    phrase, trace_event_count, agent_name, target_agent,
                )

    logger.info(
        "[stage5] stage5_passed agent=%s target=%s trace=%d",
        agent_name, target_agent, trace_event_count,
    )
    stage5_metrics.record(target_agent=agent_name, blocked=False, reason="")
    return None


# ── Metrics ───────────────────────────────────────────────────────────────────

class Stage2Metrics:
    def __init__(self):
        self.total_delegations = 0
        self.blocked = 0
        self.passed = 0
        self.blocked_by_agent: Dict[str, int] = {}

    def record(self, target_agent: str, is_valid: bool) -> None:
        self.total_delegations += 1
        if is_valid:
            self.passed += 1
        else:
            self.blocked += 1
            self.blocked_by_agent[target_agent] = (
                self.blocked_by_agent.get(target_agent, 0) + 1
            )

    def summary(self) -> dict:
        return {
            "total_delegations": self.total_delegations,
            "passed": self.passed,
            "blocked": self.blocked,
            "block_rate": (
                self.blocked / self.total_delegations
                if self.total_delegations > 0 else 0.0
            ),
            "blocked_by_agent": self.blocked_by_agent,
        }


class Stage3Metrics:
    def __init__(self):
        self.total_checks = 0
        self.blocked = 0
        self.passed = 0
        self.blocked_by_agent: Dict[str, int] = {}
        self.blocked_by_server: Dict[str, int] = {}

    def record(self, agent_name: str, blocked: bool, server: str) -> None:
        self.total_checks += 1
        if blocked:
            self.blocked += 1
            self.blocked_by_agent[agent_name] = (
                self.blocked_by_agent.get(agent_name, 0) + 1
            )
            self.blocked_by_server[server] = (
                self.blocked_by_server.get(server, 0) + 1
            )
        else:
            self.passed += 1

    def summary(self) -> dict:
        return {
            "total_checks": self.total_checks,
            "passed": self.passed,
            "blocked": self.blocked,
            "block_rate": (
                self.blocked / self.total_checks
                if self.total_checks > 0 else 0.0
            ),
            "blocked_by_agent": self.blocked_by_agent,
            "blocked_by_server": self.blocked_by_server,
        }


class Stage5Metrics:
    def __init__(self):
        self.total_audits = 0
        self.blocked = 0
        self.passed = 0
        self.suppressed = 0
        self.blocked_by_agent: Dict[str, int] = {}
        self.block_reasons: Dict[str, int] = {}

    def record(self, target_agent: str, blocked: bool, reason: str) -> None:
        self.total_audits += 1
        if blocked:
            self.blocked += 1
            self.blocked_by_agent[target_agent] = (
                self.blocked_by_agent.get(target_agent, 0) + 1
            )
            self.block_reasons[reason] = self.block_reasons.get(reason, 0) + 1
        else:
            self.passed += 1

    def summary(self) -> dict:
        return {
            "total_audits": self.total_audits,
            "passed": self.passed,
            "blocked": self.blocked,
            "suppressed": self.suppressed,
            "block_rate": (
                self.blocked / self.total_audits
                if self.total_audits > 0 else 0.0
            ),
            "blocked_by_agent": self.blocked_by_agent,
            "block_reasons": self.block_reasons,
        }


# Module-level singletons
metrics = Stage2Metrics()
stage3_metrics = Stage3Metrics()
stage5_metrics = Stage5Metrics()


def get_metrics_summary() -> dict:
    """Return combined Stage 2 + Stage 3 + Stage 5 metrics."""
    return {
        "verification_mode": VERIFICATION_MODE,
        "stage2": metrics.summary(),
        "stage3": stage3_metrics.summary(),
        "stage5": stage5_metrics.summary(),
    }