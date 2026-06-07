"""
my_verification/verification_pipeline.py

Stage 2 — Pre-Delegation Check
Stage 5 — Post-Generation Audit

Single source of truth for all verification logic.
Imported by agent.py; controlled via VERIFICATION_MODE env var:

    VERIFICATION_MODE=baseline        -> no intervention   (Phase 1)
    VERIFICATION_MODE=stage2          -> Stage 2 only      (Phase 2)
    VERIFICATION_MODE=stage2_stage5   -> Stage 2 + Stage 5 (Phase 3)

Note: ENTCOLLABBENCH delegation messages are plain natural-language strings,
not structured JSON dicts. All checks operate on the raw text.
"""

import json
import logging
import os
import re
from typing import Dict, List, Optional, Tuple

logger = logging.getLogger(__name__)

# ── Mode ──────────────────────────────────────────────────────────────────────

VERIFICATION_MODE: str = os.getenv("VERIFICATION_MODE", "baseline").strip().lower()

# ── Stage 2 configuration ─────────────────────────────────────────────────────
#
# For each target agent we define:
#   "keywords"  — at least one must appear in the task_description text
#   "patterns"  — optional regex patterns; if listed, at least one must match
#
# All matching is case-insensitive on the raw task_description string.

AGENT_RULES: Dict[str, Dict] = {
    "knowledge_base_specialist": {
        "keywords": ["knowledge", "article", "kb_", "kb "],
        "patterns": [r"kb[_\-]?\d+", r"article\s+(id\s*)?\d+"],
        "description": "Must reference a knowledge article (e.g. KB_002, article ID)",
    },
    "it_service_desk_l1": {
        "keywords": ["incident", "inc_", "inc ", "service desk", "ticket"],
        "patterns": [r"inc[_\-]?\d+"],
        "description": "Must reference an incident (e.g. INC_057)",
    },
    "it_change_engineer": {
        "keywords": ["change", "chg_", "chg ", "change request"],
        "patterns": [r"ch[gn][_\-]?\d+"],
        "description": "Must reference a change request",
    },
    "hr_service_specialist": {
        "keywords": ["hr", "onboard", "employee", "case", "hire"],
        "patterns": [],
        "description": "Must reference an HR case or employee action",
    },
    "customer_support_specialist": {
        "keywords": ["customer", "support", "case", "escalat"],
        "patterns": [],
        "description": "Must reference a customer support case",
    },
    "collaboration_ops_specialist": {
        "keywords": ["email", "calendar", "teams", "channel", "collaborat", "meeting"],
        "patterns": [],
        "description": "Must reference a collaboration action (email/calendar/teams)",
    },
    "developer_engineer": {
        "keywords": ["code", "repo", "git", "commit", "pull request", "branch"],
        "patterns": [],
        "description": "Must reference a code or repository action",
    },
    "qa_test_engineer": {
        "keywords": ["test", "qa", "quality", "bug", "defect"],
        "patterns": [],
        "description": "Must reference a test or quality action",
    },
    "finance_approval_specialist": {
        "keywords": ["finance", "budget", "approval", "cost", "expense"],
        "patterns": [],
        "description": "Must reference a finance approval",
    },
    "legal_approval_specialist": {
        "keywords": ["legal", "contract", "compliance", "approval", "policy"],
        "patterns": [],
        "description": "Must reference a legal or compliance matter",
    },
    "procurement_approval_specialist": {
        "keywords": ["procurement", "vendor", "purchase", "approval", "order"],
        "patterns": [],
        "description": "Must reference a procurement matter",
    },
}

# ── Stage 5 configuration ─────────────────────────────────────────────────────

SKIP_PHRASES: List[str] = [
    "no update needed",
    "no changes needed",
    "no changes required",
    "already up to date",
    "already done",
    "already completed",
    "article is correct",
    "article is already",
    "already published",
    "verified article",
    "state is published",
    "nothing to do",
    "no action required",
    "no action needed",
    "no further action",
    "task is complete",
    "already exists",
]

# Agents where 0 tool calls is always suspicious (silent reasoning failure)
ZERO_TRACE_AGENTS: List[str] = [
    "knowledge_base_specialist",
    "it_service_desk_l1",
    "it_change_engineer",
    "hr_service_specialist",
]


# ── Stage 2 ───────────────────────────────────────────────────────────────────

def validate_delegation(
    target_agent: str,
    task_description: str,
    from_agent: str = "",
) -> Tuple[bool, str, List[str]]:
    """
    Validate a plain-text delegation message before it is sent.

    Args:
        target_agent:     name of the agent being delegated to
        task_description: the raw string passed to the delegation tool
        from_agent:       name of the sending agent (for logging)

    Returns:
        (is_valid, reason, missing_items)
    """
    rules = AGENT_RULES.get(target_agent)
    if not rules:
        # No rule defined for this agent — pass through
        logger.info(
            "[stage2] stage2_passed (no rule) from=%s to=%s",
            from_agent, target_agent,
        )
        return True, "OK", []

    text = task_description.lower()
    missing: List[str] = []

    # Keyword check: at least one keyword must appear
    keywords = rules.get("keywords", [])
    if keywords and not any(kw in text for kw in keywords):
        missing.append(f"none of required keywords {keywords}")

    # Pattern check: if patterns defined, at least one must match
    patterns = rules.get("patterns", [])
    if patterns and not any(re.search(p, text, re.IGNORECASE) for p in patterns):
        missing.append(f"none of required patterns {patterns}")

    if missing:
        reason = (
            f"[Stage2 BLOCKED] Delegation to {target_agent} from {from_agent} "
            f"failed validation. Issues: {missing}. "
            f"Rule: {rules.get('description', '')}"
        )
        logger.warning("[stage2] stage2_blocked from=%s to=%s missing=%s", from_agent, target_agent, missing)
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
    Returns an error string to return to the LLM if blocked, else None.
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


# ── Stage 5 ───────────────────────────────────────────────────────────────────

def check_stage5(
    result: str,
    agent_name: str,
    target_agent: str,
    trace_event_count: int,
) -> Optional[str]:
    """
    Entry point called by agent.py Stage 5 hook.
    Returns an error string to return to the LLM if a silent skip is
    detected, else None.
    Active when VERIFICATION_MODE is 'stage2_stage5'.
    """
    if VERIFICATION_MODE != "stage2_stage5":
        return None

    result_lower = result.lower()

    # Check 1: zero tool calls for agents where that is always suspicious
    if target_agent in ZERO_TRACE_AGENTS and trace_event_count == 0:
        logger.warning(
            "[stage5] stage5_blocked (0 trace events) agent=%s target=%s",
            agent_name, target_agent,
        )
        stage5_metrics.record(target_agent=target_agent, blocked=True, reason="zero_trace")
        return (
            f"Error: '{target_agent}' completed with 0 tool calls. "
            "The agent may have incorrectly decided no action was needed. "
            "Please retry and ensure the required updates are actually applied."
        )

    # Check 2: skip-phrase detection
    for phrase in SKIP_PHRASES:
        if phrase in result_lower:
            logger.warning(
                "[stage5] stage5_blocked (skip phrase=%r) agent=%s target=%s",
                phrase, agent_name, target_agent,
            )
            stage5_metrics.record(target_agent=target_agent, blocked=True, reason=f"skip_phrase:{phrase}")
            return (
                f"Error: '{target_agent}' appears to have skipped required work "
                f"(response contained '{phrase}'). "
                "Please retry and ensure all required tool calls are executed."
            )

    logger.info("[stage5] stage5_passed agent=%s target=%s", agent_name, target_agent)
    stage5_metrics.record(target_agent=target_agent, blocked=False, reason="")
    return None


# ── Metrics ───────────────────────────────────────────────────────────────────

class Stage2Metrics:
    """Track Stage 2 intervention statistics across all delegations."""

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


class Stage5Metrics:
    """Track Stage 5 intervention statistics."""

    def __init__(self):
        self.total_audits = 0
        self.blocked = 0
        self.passed = 0
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
            "block_rate": (
                self.blocked / self.total_audits
                if self.total_audits > 0 else 0.0
            ),
            "blocked_by_agent": self.blocked_by_agent,
            "block_reasons": self.block_reasons,
        }


# Module-level singletons — accumulate stats for the container's lifetime
metrics = Stage2Metrics()
stage5_metrics = Stage5Metrics()


def get_metrics_summary() -> dict:
    """Return combined Stage 2 + Stage 5 metrics. Useful for logging at shutdown."""
    return {
        "verification_mode": VERIFICATION_MODE,
        "stage2": metrics.summary(),
        "stage5": stage5_metrics.summary(),
    }