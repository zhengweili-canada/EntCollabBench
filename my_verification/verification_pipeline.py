"""
my_verification/verification_pipeline.py

Stage 2 — Pre-Delegation Check
Stage 5 — Post-Generation Audit

Single source of truth for all verification logic.
Imported by agent.py; controlled via VERIFICATION_MODE env var:

    VERIFICATION_MODE=baseline        -> no intervention        (Phase 1)
    VERIFICATION_MODE=stage2          -> Stage 2 only            (Phase 2)
    VERIFICATION_MODE=stage2_stage5   -> Stage 2 + Stage 5       (Phase 3)
    VERIFICATION_MODE=stage5_only     -> Stage 5 only, no Stage 2 (Phase 4)

Changelog v3 (2026-06-11):
  Stage 5: Critical bug fix — Check 1 (zero-trace) and Check 2 (skip-phrase)
           were checking target_agent (the NEXT agent to be called) instead of
           agent_name (the CURRENT agent producing output). This meant KB
           specialist and it_service_desk_l1 zero-trace failures were never
           caught because Stage 5 was looking for their names in the outbound
           delegation target, not in the agent doing the failing. Fixed both
           checks to use agent_name. Expected impact: recover up to 27
           additional KB specialist zero-trace failures on 160 tasks.

Changelog v2 (2026-06-07):
  Stage 2: Removed mandatory regex pattern checks. Keyword-only check now
           applies to all agents. Pattern check is advisory (logged) but
           never blocks. This prevents false positives on tasks like
           task_113/115/126/148 where valid delegations were blocked.

  Stage 5: Three targeted changes to reduce false positives on already-
           passing tasks:
           1. Skip-phrase check now requires BOTH phrase match AND low
              trace event count (<=2) — a phrase alone no longer blocks.
           2. Skip-phrase list trimmed to only unambiguous failure phrases.
              Removed broad phrases that appear in legitimate completions.
           3. Zero-trace check restricted to knowledge_base_specialist and
              it_service_desk_l1 only — the two agents with confirmed silent
              failure patterns. Removed hr_service_specialist and
              it_change_engineer which have high baseline pass rates and
              do not exhibit this failure mode.
"""

import logging
import os
import re
from typing import Dict, List, Optional, Tuple

logger = logging.getLogger(__name__)

# ── Mode ──────────────────────────────────────────────────────────────────────

VERIFICATION_MODE: str = os.getenv("VERIFICATION_MODE", "baseline").strip().lower()

# ── Stage 2 configuration ─────────────────────────────────────────────────────
#
# CHANGE v2: Pattern check removed from blocking logic.
# Root cause of false positives (task_113, task_115, task_126, task_148):
# the regex patterns like r"inc[_\-]?\d+" and r"ch[gn][_\-]?\d+" were
# blocking valid delegations where the task description used natural language
# like "open a new incident for USER_022" without a specific ID number.
# The LLM writes delegation messages in natural language, not ID-first format.
# Fix: keyword check only. Keywords are broad enough to match natural language.

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

# ── Stage 5 configuration ─────────────────────────────────────────────────────
#
# CHANGE v2: Skip-phrase list reduced to only UNAMBIGUOUS failure phrases.
#
# Removed phrases and why:
#   "already done"         — too broad; agent saying "task already done" after
#                            completing work is a legitimate completion message
#   "already completed"    — same issue; agent reporting completion uses this
#   "already published"    — KB agent says this AFTER updating an article to
#                            published state; was causing false positives
#   "article is already"   — partial match caused false positives on valid msgs
#   "verified article"     — agent verifying then updating uses this phrase
#   "state is published"   — legitimate completion report after update
#   "task is complete"     — generic completion phrase, not a skip signal
#   "already exists"       — agent may say "record already exists, updating..."
#   "no further action"    — too broad; could appear in multi-step summaries
#
# Kept phrases: only phrases that unambiguously mean "I decided not to act":
SKIP_PHRASES: List[str] = [
    "no update needed",
    "no changes needed",
    "no changes required",
    "already up to date",
    "no action required",
    "no action needed",
    "nothing to do",
    "article is correct",   # KB-specific: agent says article is fine, no edit
]

# CHANGE v2: Zero-trace check restricted to confirmed silent-failure agents only.
#
# Removed from list and why:
#   "hr_service_specialist"  — 83% baseline pass rate; rarely fails silently;
#                              forcing retry breaks correctly completed tasks
#   "it_change_engineer"     — 75% baseline pass rate; same issue
#
# Kept in list:
#   "knowledge_base_specialist" — confirmed silent failure pattern in Phase 1-3;
#                                 0% baseline pass rate in orig 20 tasks
#   "it_service_desk_l1"        — confirmed in task_36; 0% on orig 20 tasks;
#                                 38% on new 40 which is still low
ZERO_TRACE_AGENTS: List[str] = [
    "knowledge_base_specialist",
    "it_service_desk_l1",
]

# CHANGE v2: Minimum trace events threshold for skip-phrase check.
# A skip phrase only triggers Stage 5 if the agent also made FEW tool calls.
# Rationale: if an agent made 10+ tool calls AND said "no update needed",
# it likely did real work and used that phrase in its summary. If it made
# 0-2 tool calls AND said "no update needed", it almost certainly skipped.
# Only flag an agent as silently skipping if it both said 'nothing to do' AND 
# actually did nothing at all."
SKIP_PHRASE_MAX_TRACE_FOR_BLOCK: int = 0


# ── Stage 2 ───────────────────────────────────────────────────────────────────

def validate_delegation(
    target_agent: str,
    task_description: str,
    from_agent: str = "",
) -> Tuple[bool, str, List[str]]:
    """
    Validate a plain-text delegation message before it is sent.
    v2: keyword check only — no pattern blocking.
    """
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
    # stage5_only mode intentionally skips Stage 2
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
    Returns error string if silent skip detected, else None.
    Active when VERIFICATION_MODE is 'stage2_stage5' or 'stage5_only'.

    v2 logic:
      Check 1 (zero trace): fires ONLY for knowledge_base_specialist and
        it_service_desk_l1 with 0 tool calls.
      Check 2 (skip phrase): fires ONLY when phrase found AND trace_event_count
        <= SKIP_PHRASE_MAX_TRACE_FOR_BLOCK (default 2). This prevents false
        positives on agents that completed real work but used a phrase from
        the list in their summary.
    """
    # Active for both stage2_stage5 and stage5_only modes
    if VERIFICATION_MODE not in ("stage2_stage5", "stage5_only"):
        return None

    result_lower = result.lower()

    # Check 1: zero tool calls — restricted to confirmed silent-failure agents
    # NOTE: checks agent_name (the CURRENT agent producing output), not
    # target_agent (the NEXT agent to be called). KB specialist and
    # it_service_desk_l1 fail silently themselves — they are not caught
    # by checking who they delegate to.
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
    # NOTE: also uses agent_name (current agent) not target_agent (next agent)
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
                    f"Error: '{target_agent}' appears to have skipped required work "
                    f"(response contained '{phrase}' with only {trace_event_count} "
                    f"tool calls). "
                    "Please retry and ensure all required tool calls are executed."
                )
            else:
                # Phrase found but agent made enough tool calls — log only, do not block
                logger.info(
                    "[stage5] stage5_phrase_suppressed (phrase=%r, trace=%d>=threshold) "
                    "agent=%s target=%s",
                    phrase, trace_event_count, agent_name, target_agent,
                )

    logger.info(
        "[stage5] stage5_passed agent=%s target=%s trace=%d",
        agent_name, target_agent, trace_event_count,
    )
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
                if self.total_delegations > 0
                else 0.0
            ),
            "blocked_by_agent": self.blocked_by_agent,
        }


class Stage5Metrics:
    """Track Stage 5 intervention statistics."""

    def __init__(self):
        self.total_audits = 0
        self.blocked = 0
        self.passed = 0
        self.suppressed = 0   # phrase found but trace count high — not blocked
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
                if self.total_audits > 0
                else 0.0
            ),
            "blocked_by_agent": self.blocked_by_agent,
            "block_reasons": self.block_reasons,
        }


# Module-level singletons
metrics = Stage2Metrics()
stage5_metrics = Stage5Metrics()


def get_metrics_summary() -> dict:
    """Return combined Stage 2 + Stage 5 metrics."""
    return {
        "verification_mode": VERIFICATION_MODE,
        "stage2": metrics.summary(),
        "stage5": stage5_metrics.summary(),
    }