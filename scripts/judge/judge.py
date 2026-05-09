#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import re
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Set, Tuple
from urllib import request as urlrequest


TRACE_DROP_KEYS = {
    "usage_metadata",
    "response_metadata",
    "additional_kwargs",
    "token_usage",
    "raw_response",
    "response_headers",
    "headers",
    "prompt_tokens",
    "completion_tokens",
    "total_tokens",
}

MCP_TOOL_PATTERNS = [
    re.compile(r"^mcp_([a-z0-9]+)_"),
    re.compile(r"^mcp\.([a-z0-9]+)\."),
]

APPROVAL_EVAL_AGENTS = (
    "procurement_approval_specialist",
    "legal_approval_specialist",
    "finance_approval_specialist",
)


def _extract_json_object(text: str) -> Optional[Dict[str, Any]]:
    text = (text or "").strip()
    decoder = json.JSONDecoder()
    for i, ch in enumerate(text):
        if ch != "{":
            continue
        try:
            obj, _ = decoder.raw_decode(text[i:])
            if isinstance(obj, dict):
                return obj
        except Exception:
            continue
    return None


def _to_bool(value: Any, default: bool = False) -> bool:
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return bool(value)
    if isinstance(value, str):
        v = value.strip().lower()
        if v in {"true", "yes", "y", "pass", "passed", "ok", "success"}:
            return True
        if v in {"false", "no", "n", "fail", "failed", "error"}:
            return False
    return default


def _safe_int(value: Any, default: int = 0) -> int:
    try:
        return int(value)
    except Exception:
        return default


def _truncate_str(s: str, max_chars: int) -> str:
    if len(s) <= max_chars:
        return s
    if max_chars <= 32:
        return s[:max_chars]
    keep_head = int(max_chars * 0.7)
    keep_tail = max_chars - keep_head - 15
    return f"{s[:keep_head]} ...<truncated>... {s[-keep_tail:]}"


def _clean_and_truncate(
    value: Any,
    *,
    max_depth: int = 8,
    max_str_len: int = 600,
    max_list_len: int = 120,
    max_dict_keys: int = 120,
    _depth: int = 0,
) -> Any:
    if _depth > max_depth:
        return "<truncated:depth_limit>"
    if isinstance(value, str):
        return _truncate_str(value, max_str_len)
    if isinstance(value, (int, float, bool)) or value is None:
        return value
    if isinstance(value, dict):
        out: Dict[str, Any] = {}
        kept = 0
        for k, v in value.items():
            key = str(k)
            if key in TRACE_DROP_KEYS:
                continue
            kept += 1
            if kept > max_dict_keys:
                out["__truncated_keys__"] = f"kept_first_{max_dict_keys}"
                break
            out[key] = _clean_and_truncate(
                v,
                max_depth=max_depth,
                max_str_len=max_str_len,
                max_list_len=max_list_len,
                max_dict_keys=max_dict_keys,
                _depth=_depth + 1,
            )
        return out
    if isinstance(value, list):
        items = [
            _clean_and_truncate(
                x,
                max_depth=max_depth,
                max_str_len=max_str_len,
                max_list_len=max_list_len,
                max_dict_keys=max_dict_keys,
                _depth=_depth + 1,
            )
            for x in value[:max_list_len]
        ]
        if len(value) > max_list_len:
            items.append(f"<truncated:list_items={len(value) - max_list_len}>")
        return items
    return _truncate_str(str(value), max_str_len)


def _extract_events(trace_obj: Dict[str, Any]) -> List[Dict[str, Any]]:
    events = trace_obj.get("events")
    if not isinstance(events, list):
        one = trace_obj.get("event")
        if isinstance(one, dict):
            events = [one]
        else:
            events = []
    out: List[Dict[str, Any]] = []
    for ev in events:
        if not isinstance(ev, dict):
            continue
        cleaned = _clean_and_truncate(ev)
        if isinstance(cleaned, dict):
            out.append(cleaned)
    return out


def _extract_tool_name_from_event(event: Dict[str, Any]) -> str:
    data = event.get("data")
    if isinstance(data, dict):
        for key in ("tool_name",):
            v = data.get(key)
            if isinstance(v, str) and v.strip():
                return v.strip()
        raw_tool_call = data.get("raw_tool_call")
        if isinstance(raw_tool_call, dict):
            v = raw_tool_call.get("name")
            if isinstance(v, str) and v.strip():
                return v.strip()
    return ""


def _extract_mcp_server_from_tool_name(tool_name: str) -> str:
    name = (tool_name or "").strip().lower()
    if not name:
        return ""
    for pat in MCP_TOOL_PATTERNS:
        m = pat.search(name)
        if m:
            return m.group(1)
    return ""


def _collect_mcp_servers(events: Iterable[Dict[str, Any]]) -> Set[str]:
    servers: Set[str] = set()
    for ev in events:
        if not isinstance(ev, dict):
            continue
        tool_name = _extract_tool_name_from_event(ev)
        server = _extract_mcp_server_from_tool_name(tool_name)
        if server:
            servers.add(server)
    return servers


def _filter_canonical_diff_by_servers(canonical_diff: Any, servers: Set[str]) -> Dict[str, Any]:
    if not isinstance(canonical_diff, dict):
        return {}
    if not servers:
        return {}
    out: Dict[str, Any] = {}
    top_servers = canonical_diff.get("servers")
    if isinstance(top_servers, dict):
        kept = {s: top_servers[s] for s in sorted(servers) if s in top_servers}
        if kept:
            out["servers"] = _clean_and_truncate(kept, max_str_len=500, max_list_len=80, max_dict_keys=80)
    errors = canonical_diff.get("errors")
    if errors:
        out["errors"] = _clean_and_truncate(errors, max_str_len=500, max_list_len=50, max_dict_keys=50)
    for s in sorted(servers):
        if s in canonical_diff:
            out[s] = _clean_and_truncate(
                canonical_diff[s],
                max_str_len=500,
                max_list_len=80,
                max_dict_keys=80,
            )
    return out


def _load_json_file(path: str) -> Any:
    return json.loads(Path(path).read_text(encoding="utf-8"))


RETURN_JSON_FIELDS_BLOCK = (
    "Return a JSON object with fields:\n"
    "{\n"
    '  "passed": <bool>,\n'
    '  "confidence": <float 0~1>,\n'
    '  "reason": "<short conclusion>",\n'
    '  "matched_points": [<string>...],\n'
    '  "missed_points": [<string>...]\n'
    "}\n"
)


def _build_judge_messages(payload: Dict[str, Any]) -> List[Dict[str, str]]:
    judge_task_type = str(payload.get("judge_task_type", "mcp")).strip().lower()
    has_question = isinstance(payload.get("question"), str) and bool(str(payload.get("question")).strip())
    has_final_answer = isinstance(payload.get("final_answer"), str) and bool(str(payload.get("final_answer")).strip())
    if judge_task_type == "approval":
        system_prompt = (
            "You are a strict but fair judge for approval-task agents. "
            "Evaluate only the current agent in `agent_name`. "
            "Your primary target is whether this agent made the correct approval decision based on document/rule evidence."
        )
        rules: List[str] = [
            "Compare `ground_truth_approval_result_for_agent` with the agent's final output in `actual_trace_events_for_agent` for this agent only.",
            "Preferred output schema is plain text fields: `DECISION:..., RATIONALE:..., ERROR:...`.",
            "First, extract DECISION/RATIONALE/ERROR from the final output and compare with `ground_truth_approval_result_for_agent`.",
            "For decision comparison, align extracted/inferred decision with `ground_truth_approval_result_for_agent.decision`.",
            "For rationale comparison, check whether the output rationale is consistent with `ground_truth_approval_result_for_agent.rationale`, cited rule logic, and required docs/preapproval implications.",
            "Use trajectory evidence to verify the result is document/rule-grounded (e.g., read policy/submission docs, cites or applies relevant rules), not fabricated.",
            "If fields are not perfectly formatted but the final output still clearly conveys equivalent decision and rationale, judge by semantic equivalence instead of failing on formatting alone.",
            "Allow ordering differences, equivalent implementations, and harmless extra steps.",
            "Fail when decision is wrong, key approval findings/evidence are missing, or conclusions are contradicted by trajectory evidence.",
        ]
        user_prompt = (
            "Judge whether this agent passed.\n"
            "Rules:\n- "
            + "\n- ".join(rules)
            + "\n"
            + RETURN_JSON_FIELDS_BLOCK
            + "\nInput:\n"
            f"{json.dumps(payload, ensure_ascii=False)}"
        )
    else:
        system_prompt = (
            "You are a strict but fair judge for evaluating agents. "
            "Evaluate only the current agent in `agent_name`. "
            "Your primary target is whether this agent completed the received task."
        )
        rules = [
            "Compare `correct_reference_trajectory_for_agent` with `actual_trace_events` for this agent only.",
            "Allow equivalent implementations, minor ordering differences, and harmless extra steps.",
            "Fail when key actions are missing, clearly incorrect, or contradicted by trajectory evidence.",
            "`related_canonical_diff` is subtask-scoped canonical DB diff evidence; use it as supporting evidence for whether the current agent truly completed DB-side effects.",
        ]
        if has_question and has_final_answer:
            rules.append(
                "Because `question` and `final_answer` are present, also judge whether `final_answer` actually resolves `question`, and support that judgment with trajectory evidence."
            )
            rules.append(
                "If `final_answer` does not resolve `question`, still separately judge whether this agent completed its own key intent from `correct_reference_trajectory_for_agent`."
            )
        user_prompt = (
            "Judge whether this agent passed.\n"
            "Rules:\n- "
            + "\n- ".join(rules)
            + "\n"
            + RETURN_JSON_FIELDS_BLOCK
            + "\nInput:\n"
            f"{json.dumps(payload, ensure_ascii=False)}"
        )
    return [
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": user_prompt},
    ]


def _chat_completion_json(
    *,
    base_url: str,
    api_key: str,
    model: str,
    messages: List[Dict[str, str]],
    timeout_seconds: int = 120,
) -> Tuple[Dict[str, Any], Dict[str, int]]:
    url = f"{base_url.rstrip('/')}/chat/completions"
    payload: Dict[str, Any] = {
        "model": model,
        "temperature": 0,
        "response_format": {"type": "json_object"},
        "messages": messages,
    }
    req = urlrequest.Request(
        url=url,
        data=json.dumps(payload, ensure_ascii=False).encode("utf-8"),
        headers={
            "Content-Type": "application/json",
            "Authorization": f"Bearer {api_key}",
        },
        method="POST",
    )
    with urlrequest.urlopen(req, timeout=max(1, int(timeout_seconds))) as resp:
        raw = resp.read().decode("utf-8")
    obj = json.loads(raw) if raw else {}
    usage_obj = obj.get("usage", {}) if isinstance(obj, dict) else {}
    usage = {
        "input_tokens": _safe_int(
            usage_obj.get("prompt_tokens", usage_obj.get("input_tokens", 0))
            if isinstance(usage_obj, dict)
            else 0
        ),
        "output_tokens": _safe_int(
            usage_obj.get("completion_tokens", usage_obj.get("output_tokens", 0))
            if isinstance(usage_obj, dict)
            else 0
        ),
        "total_tokens": _safe_int(usage_obj.get("total_tokens", 0) if isinstance(usage_obj, dict) else 0),
    }
    if usage["total_tokens"] <= 0:
        usage["total_tokens"] = usage["input_tokens"] + usage["output_tokens"]
    choices = obj.get("choices")
    if not isinstance(choices, list) or not choices:
        raise RuntimeError("judge model returned empty choices")
    msg = choices[0].get("message", {}) if isinstance(choices[0], dict) else {}
    content = msg.get("content", "")
    if isinstance(content, list):
        content = "".join(
            item.get("text", "")
            for item in content
            if isinstance(item, dict)
        )
    if not isinstance(content, str) or not content.strip():
        raise RuntimeError("judge model returned empty content")
    parsed = _extract_json_object(content)
    if not isinstance(parsed, dict):
        raise RuntimeError(f"judge model returned non-JSON content: {content[:300]}")
    return parsed, usage


@dataclass
class JudgeVote:
    model: str
    passed: bool
    confidence: float
    reason: str
    matched_points: List[str]
    missed_points: List[str]
    error: str = ""
    latency_ms: Optional[float] = None
    input_tokens: int = 0
    output_tokens: int = 0
    total_tokens: int = 0

    def to_dict(self) -> Dict[str, Any]:
        return {
            "model": self.model,
            "passed": self.passed,
            "confidence": self.confidence,
            "reason": self.reason,
            "matched_points": self.matched_points,
            "missed_points": self.missed_points,
            "error": self.error,
            "latency_ms": self.latency_ms,
            "input_tokens": self.input_tokens,
            "output_tokens": self.output_tokens,
            "total_tokens": self.total_tokens,
        }


def _one_model_vote(
    *,
    model: str,
    judge_input: Dict[str, Any],
    base_url: str,
    api_key: str,
    timeout_seconds: int,
) -> JudgeVote:
    started = time.time()
    try:
        parsed, usage = _chat_completion_json(
            base_url=base_url,
            api_key=api_key,
            model=model,
            messages=_build_judge_messages(judge_input),
            timeout_seconds=timeout_seconds,
        )
        passed = _to_bool(parsed.get("passed"), default=False)
        conf = parsed.get("confidence", 0.0)
        try:
            confidence = float(conf)
        except Exception:
            confidence = 0.0
        confidence = max(0.0, min(1.0, confidence))
        reason = str(parsed.get("reason", "")).strip()
        matched = parsed.get("matched_points", [])
        missed = parsed.get("missed_points", [])
        if not isinstance(matched, list):
            matched = [str(matched)]
        if not isinstance(missed, list):
            missed = [str(missed)]
        return JudgeVote(
            model=model,
            passed=passed,
            confidence=confidence,
            reason=reason,
            matched_points=[str(x) for x in matched[:10]],
            missed_points=[str(x) for x in missed[:10]],
            latency_ms=round((time.time() - started) * 1000.0, 3),
            input_tokens=_safe_int(usage.get("input_tokens", 0)),
            output_tokens=_safe_int(usage.get("output_tokens", 0)),
            total_tokens=_safe_int(usage.get("total_tokens", 0)),
        )
    except Exception as exc:
        return JudgeVote(
            model=model,
            passed=False,
            confidence=0.0,
            reason="judge_model_error",
            matched_points=[],
            missed_points=[],
            error=str(exc),
            latency_ms=round((time.time() - started) * 1000.0, 3),
        )


def _majority_vote(
    *,
    judge_input: Dict[str, Any],
    models: List[str],
    base_url: str,
    api_key: str,
    timeout_seconds: int,
) -> Tuple[bool, List[JudgeVote]]:
    votes = [
        _one_model_vote(
            model=model,
            judge_input=judge_input,
            base_url=base_url,
            api_key=api_key,
            timeout_seconds=timeout_seconds,
        )
        for model in models[:3]
    ]
    if not votes:
        return False, votes
    passed_count = sum(1 for v in votes if v.passed)
    return passed_count > (len(votes) / 2.0), votes


def _normalize_tasks(tasks_obj: Any) -> List[Dict[str, Any]]:
    if isinstance(tasks_obj, list):
        return [x for x in tasks_obj if isinstance(x, dict)]
    if isinstance(tasks_obj, dict):
        if isinstance(tasks_obj.get("tasks"), list):
            return [x for x in tasks_obj["tasks"] if isinstance(x, dict)]
        return [tasks_obj]
    return []


def _extract_first_int(value: Any) -> Optional[int]:
    if isinstance(value, int):
        return int(value)
    if isinstance(value, str):
        token = value.strip()
        if not token:
            return None
        if token.isdigit():
            return int(token)
        buf: List[str] = []
        for ch in token:
            if ch.isdigit():
                buf.append(ch)
            elif buf:
                break
        if buf:
            return int("".join(buf))
    return None


def _extract_last_int(value: Any) -> Optional[int]:
    if isinstance(value, int):
        return int(value)
    if isinstance(value, str):
        token = value.strip()
        if not token:
            return None
        if token.isdigit():
            return int(token)
        i = len(token) - 1
        while i >= 0 and not token[i].isdigit():
            i -= 1
        if i < 0:
            return None
        j = i
        while j >= 0 and token[j].isdigit():
            j -= 1
        return int(token[j + 1 : i + 1])
    return None


def _normalize_task_id(value: Any, fallback: int) -> str:
    num = _extract_first_int(value)
    if num is None or num <= 0:
        num = fallback
    return f"task_{num}"


def _normalize_sub_task_id(task_id: str, value: Any, fallback_sub_pos: int) -> str:
    num = _extract_last_int(value)
    if num is None or num <= 0:
        num = fallback_sub_pos
    return f"{task_id}_{num}"


def _task_id_to_obj(tasks: List[Dict[str, Any]]) -> Dict[str, Dict[str, Any]]:
    out: Dict[str, Dict[str, Any]] = {}
    for pos, task in enumerate(tasks, start=1):
        task_id = _normalize_task_id(task.get("task_id", task.get("task_index", task.get("index"))), fallback=pos)
        out[task_id] = task
    return out


def _pick_task_for_batch(
    tasks: List[Dict[str, Any]],
    batch: Dict[str, Any],
    batch_pos: int,
    *,
    task_by_id: Optional[Dict[str, Dict[str, Any]]] = None,
) -> Tuple[Dict[str, Any], str]:
    if task_by_id:
        batch_task_id = str(batch.get("task_id", "")).strip()
        if batch_task_id and batch_task_id in task_by_id:
            return task_by_id[batch_task_id], "task_id"
    source_index = batch.get("source_index")
    if isinstance(source_index, int) and 0 <= source_index < len(tasks):
        return tasks[source_index], "source_index"
    if 0 <= batch_pos < len(tasks):
        return tasks[batch_pos], "batch_position"
    return {}, "fallback_empty"


def _pick_subtask_gt(
    task_obj: Dict[str, Any],
    subtask_pos: int,
    subtask_index: int,
    *,
    sub_task_id: str,
) -> Dict[str, Any]:
    sub_list = task_obj.get("sub_task_list")
    if not isinstance(sub_list, list) or not sub_list:
        return {}
    if sub_task_id.strip():
        for sub in sub_list:
            if not isinstance(sub, dict):
                continue
            sub_id = str(sub.get("sub_task_id", "")).strip()
            if sub_id and sub_id == sub_task_id:
                return sub
    idx = subtask_index - 1
    if 0 <= idx < len(sub_list) and isinstance(sub_list[idx], dict):
        return sub_list[idx]
    if 0 <= subtask_pos < len(sub_list) and isinstance(sub_list[subtask_pos], dict):
        return sub_list[subtask_pos]
    return {}


def _gt_agents(subtask_gt: Dict[str, Any]) -> List[str]:
    gt = subtask_gt.get("ground_truth")
    if not isinstance(gt, list):
        return []
    out: Set[str] = set()
    for step in gt:
        if not isinstance(step, dict):
            continue
        agent = step.get("agent")
        if isinstance(agent, str) and agent.strip():
            out.add(agent.strip())
    return sorted(out)


def _gt_steps_for_agent(subtask_gt: Dict[str, Any], agent_name: str) -> List[Dict[str, Any]]:
    gt = subtask_gt.get("ground_truth")
    if not isinstance(gt, list):
        return []
    out: List[Dict[str, Any]] = []
    for step in gt:
        if not isinstance(step, dict):
            continue
        if str(step.get("agent", "")).strip() == agent_name:
            out.append(_clean_and_truncate(step, max_str_len=500, max_list_len=80, max_dict_keys=80))
    return out


def _trace_agents(all_agent_traces: Dict[str, Any]) -> List[str]:
    if not isinstance(all_agent_traces, dict):
        return []
    out = {str(k).strip() for k in all_agent_traces.keys() if str(k).strip()}
    return sorted(out)


def _read_agent_name_from_obj(obj: Dict[str, Any]) -> str:
    for key in ("agent_name", "agent", "target_agent", "review_agent"):
        v = obj.get(key)
        if isinstance(v, str) and v.strip():
            return v.strip()
    return ""


def _approval_agents(ground_truth_approval_results: Any) -> List[str]:
    out: Set[str] = set()
    if isinstance(ground_truth_approval_results, dict):
        for agent in APPROVAL_EVAL_AGENTS:
            if agent in ground_truth_approval_results and _approval_value_has_content(ground_truth_approval_results.get(agent)):
                out.add(agent)
        return sorted(out)
    if isinstance(ground_truth_approval_results, list):
        for item in ground_truth_approval_results:
            if not isinstance(item, dict):
                continue
            name = _read_agent_name_from_obj(item)
            if name in APPROVAL_EVAL_AGENTS and _approval_value_has_content(item):
                out.add(name)
    return sorted(out)


def _approval_value_has_content(value: Any) -> bool:
    if value is None:
        return False
    if isinstance(value, str):
        return bool(value.strip())
    if isinstance(value, (list, tuple, set, dict)):
        return len(value) > 0
    return True


def _approval_results_for_agent(subtask_gt: Dict[str, Any], agent_name: str) -> Any:
    raw = subtask_gt.get("ground_truth_approval_results", [])
    if isinstance(raw, dict):
        if agent_name in raw:
            return _clean_and_truncate(raw.get(agent_name), max_str_len=500, max_list_len=80, max_dict_keys=80)
        name = _read_agent_name_from_obj(raw)
        if name and name == agent_name:
            return _clean_and_truncate(raw, max_str_len=500, max_list_len=80, max_dict_keys=80)
        if not name:
            return _clean_and_truncate(raw, max_str_len=500, max_list_len=80, max_dict_keys=80)
        return []
    if not isinstance(raw, list):
        return []
    matched: List[Any] = []
    unscoped: List[Any] = []
    for item in raw:
        if isinstance(item, dict):
            name = _read_agent_name_from_obj(item)
            if name and name == agent_name:
                matched.append(item)
            elif not name:
                unscoped.append(item)
        else:
            unscoped.append(item)
    if matched:
        return _clean_and_truncate(matched, max_str_len=500, max_list_len=80, max_dict_keys=80)
    if unscoped and len(_approval_agents(raw)) <= 1:
        return _clean_and_truncate(unscoped, max_str_len=500, max_list_len=80, max_dict_keys=80)
    return []


def evaluate_benchmark(
    *,
    tasks_data: Any,
    bench_data: Any,
    judge_models: Optional[List[str]] = None,
    openai_base_url: Optional[str] = None,
    openai_api_key: Optional[str] = None,
    timeout_seconds: int = 120,
) -> Dict[str, Any]:
    models_raw = judge_models or []
    explicit_models = [m.strip() for m in models_raw if isinstance(m, str) and m.strip()]
    if explicit_models:
        raise RuntimeError("Explicit judge models are not supported. Please set JUDGE_MODELS.")

    models: List[str] = []
    for item in os.getenv("JUDGE_MODELS", "").split(","):
        model = item.strip()
        if model and model not in models:
            models.append(model)
    if not models:
        raise RuntimeError("JUDGE_MODELS is required and must contain at least one model.")
    models = models[:3]

    base_url = (openai_base_url or os.getenv("OPENAI_BASE_URL") or "https://api.openai.com/v1").strip()
    api_key = (openai_api_key or os.getenv("OPENAI_API_KEY") or "").strip()
    if not api_key:
        raise RuntimeError("OPENAI_API_KEY is required for LLM-as-a-judge.")

    tasks = _normalize_tasks(tasks_data)
    task_by_id = _task_id_to_obj(tasks)
    batch_results = bench_data.get("batch_results", []) if isinstance(bench_data, dict) else []
    if not isinstance(batch_results, list):
        batch_results = []

    evaluated_tasks: List[Dict[str, Any]] = []
    task_pass_count = 0
    subtask_pass_count = 0
    agent_pass_count = 0
    agent_eval_count = 0
    judge_input_tokens = 0
    judge_output_tokens = 0
    judge_total_tokens = 0

    for batch_pos, batch in enumerate(batch_results):
        if not isinstance(batch, dict):
            continue
        task_obj, align_mode = _pick_task_for_batch(tasks, batch, batch_pos, task_by_id=task_by_id)
        batch_task_id = _normalize_task_id(
            batch.get("task_id", task_obj.get("task_id", task_obj.get("task_index", task_obj.get("index")))),
            fallback=batch_pos + 1,
        )
        task_results = batch.get("task_results", [])
        if not isinstance(task_results, list):
            task_results = []
        canonical_diff = batch.get("canonical_diff", {})
        task_type = str(task_obj.get("type", "")).strip().lower()
        judge_task_type = "approval" if task_type == "approval" else "mcp"

        subtask_reports: List[Dict[str, Any]] = []
        for sub_pos, sub_run in enumerate(task_results):
            if not isinstance(sub_run, dict):
                continue
            subtask_index = _safe_int(sub_run.get("subtask_index"), sub_pos + 1)
            sub_task_id = _normalize_sub_task_id(
                batch_task_id,
                sub_run.get("sub_task_id", sub_run.get("subtask_index")),
                fallback_sub_pos=sub_pos + 1,
            )
            subtask_gt = _pick_subtask_gt(
                task_obj,
                sub_pos,
                subtask_index,
                sub_task_id=sub_task_id,
            )

            user_prompt = str(subtask_gt.get("user_prompt", ""))
            beginning_agent = str(subtask_gt.get("beginning_agent", sub_run.get("target_agent", "")))
            subtask_answer = str(sub_run.get("subtask_result", ""))

            if _to_bool(sub_run.get("skipped_due_to_prior_failure"), default=False):
                subtask_reports.append(
                    {
                        "sub_task_id": sub_task_id,
                        "passed": False,
                        "evaluated_agent_count": 0,
                        "agents": [],
                        "task_description": {
                            "user_prompt": user_prompt,
                            "beginning_agent": beginning_agent,
                        },
                        "skipped": True,
                        "skip_reason": str(sub_run.get("skip_reason", "")).strip(),
                    }
                )
                continue

            all_agent_traces = sub_run.get("all_agent_traces", {})
            if not isinstance(all_agent_traces, dict):
                all_agent_traces = {}
            if judge_task_type == "approval":
                gt_agents = _approval_agents(subtask_gt.get("ground_truth_approval_results", []))
            else:
                gt_agents = _gt_agents(subtask_gt)

            per_agent_reports: List[Dict[str, Any]] = []
            for agent_name in gt_agents:
                raw_agent_trace = all_agent_traces.get(agent_name, {})
                trace_obj = raw_agent_trace.get("trace", {}) if isinstance(raw_agent_trace, dict) else {}
                events = _extract_events(trace_obj if isinstance(trace_obj, dict) else {})
                mcp_servers: Set[str] = set()
                if judge_task_type == "mcp":
                    mcp_servers = _collect_mcp_servers(events)
                related_diff: Dict[str, Any] = {}
                if judge_task_type == "mcp":
                    subtask_canonical_diff = sub_run.get("subtask_canonical_diff", {})
                    diff_scope = (
                        subtask_canonical_diff
                        if isinstance(subtask_canonical_diff, dict) and subtask_canonical_diff
                        else canonical_diff
                    )
                    related_diff = _filter_canonical_diff_by_servers(diff_scope, mcp_servers)

                is_beginning_agent = (agent_name.strip() == beginning_agent.strip())
                if judge_task_type == "approval":
                    approval_results = _approval_results_for_agent(subtask_gt, agent_name)
                    judge_input = {
                        "judge_task_type": "approval",
                        "agent_name": agent_name,
                        "ground_truth_approval_result_for_agent": approval_results,
                        "actual_trace_events_for_agent": events,
                    }
                else:
                    gt_steps = _gt_steps_for_agent(subtask_gt, agent_name)
                    judge_input = {
                        "judge_task_type": "mcp",
                        "agent_name": agent_name,
                        "correct_reference_trajectory_for_agent": gt_steps,
                        "actual_trace_events": events,
                        "related_canonical_diff": related_diff,
                    }
                if is_beginning_agent:
                    judge_input["question"] = user_prompt
                    judge_input["final_answer"] = _truncate_str(subtask_answer, 2000)

                passed, votes = _majority_vote(
                    judge_input=judge_input,
                    models=models,
                    base_url=base_url,
                    api_key=api_key,
                    timeout_seconds=timeout_seconds,
                )
                agent_eval_count += 1
                if passed:
                    agent_pass_count += 1
                judge_input_tokens += sum(_safe_int(v.input_tokens, 0) for v in votes)
                judge_output_tokens += sum(_safe_int(v.output_tokens, 0) for v in votes)
                judge_total_tokens += sum(_safe_int(v.total_tokens, 0) for v in votes)

                per_agent_reports.append(
                    {
                        "agent_name": agent_name,
                        "passed": passed,
                        "vote_pass_count": sum(1 for v in votes if v.passed),
                        "vote_fail_count": sum(1 for v in votes if not v.passed),
                        "votes": [v.to_dict() for v in votes],
                        "trace_event_count": len(events),
                        "mcp_servers_in_trace": sorted(mcp_servers),
                    }
                )

            subtask_passed = all(x.get("passed", False) for x in per_agent_reports)
            if subtask_passed:
                subtask_pass_count += 1
            subtask_reports.append(
                {
                    "sub_task_id": sub_task_id,
                    "passed": subtask_passed,
                    "evaluated_agent_count": len(per_agent_reports),
                    "agents": per_agent_reports,
                    "task_description": {
                        "user_prompt": user_prompt,
                        "beginning_agent": beginning_agent,
                    },
                }
            )

        task_passed = all(x.get("passed", False) for x in subtask_reports)
        if task_passed:
            task_pass_count += 1

        evaluated_tasks.append(
            {
                "batch_index": batch.get("batch_index"),
                "task_id": batch_task_id,
                "alignment_mode": align_mode,
                "matched_task_id": task_obj.get("task_id", task_obj.get("task_index")),
                "passed": task_passed,
                "subtask_count": len(subtask_reports),
                "subtasks": subtask_reports,
            }
        )

    return {
        "status": "ok",
        "judge_models": models,
        "summary": {
            "task_count": len(evaluated_tasks),
            "task_pass_count": task_pass_count,
            "task_pass_rate": (task_pass_count / len(evaluated_tasks)) if evaluated_tasks else 0.0,
            "subtask_count": sum(t.get("subtask_count", 0) for t in evaluated_tasks),
            "subtask_pass_count": subtask_pass_count,
            "agent_eval_count": agent_eval_count,
            "agent_pass_count": agent_pass_count,
            "agent_pass_rate": (agent_pass_count / agent_eval_count) if agent_eval_count else 0.0,
            "judge_input_tokens": judge_input_tokens,
            "judge_output_tokens": judge_output_tokens,
            "judge_total_tokens": judge_total_tokens,
        },
        "tasks": evaluated_tasks,
    }


def evaluate_benchmark_files(
    *,
    tasks_file: str,
    bench_file: str,
    output_file: str = "",
    judge_models: Optional[List[str]] = None,
    openai_base_url: Optional[str] = None,
    openai_api_key: Optional[str] = None,
    timeout_seconds: int = 120,
) -> Dict[str, Any]:
    tasks_data = _load_json_file(tasks_file)
    bench_data = _load_json_file(bench_file)
    out = evaluate_benchmark(
        tasks_data=tasks_data,
        bench_data=bench_data,
        judge_models=judge_models,
        openai_base_url=openai_base_url,
        openai_api_key=openai_api_key,
        timeout_seconds=timeout_seconds,
    )
    if output_file.strip():
        Path(output_file).write_text(
            json.dumps(out, ensure_ascii=False, indent=2),
            encoding="utf-8",
        )
    return out


def run_judge(
    *,
    tasks_file: str,
    bench_file: str,
    output_file: str = "",
    judge_models: Optional[List[str]] = None,
    openai_base_url: Optional[str] = None,
    openai_api_key: Optional[str] = None,
    timeout_seconds: int = 120,
) -> Dict[str, Any]:
    return evaluate_benchmark_files(
        tasks_file=tasks_file,
        bench_file=bench_file,
        output_file=output_file,
        judge_models=judge_models,
        openai_base_url=openai_base_url,
        openai_api_key=openai_api_key,
        timeout_seconds=timeout_seconds,
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="LLM-as-a-judge benchmark evaluator: task/subtask/agent majority voting."
    )
    parser.add_argument("--tasks-file", required=True, help="Path to tasks_200_format-style JSON.")
    parser.add_argument("--bench-file", required=True, help="Path to bench_*.json output.")
    parser.add_argument("--output-file", default="", help="Optional output JSON path.")
    parser.add_argument(
        "--judge-model",
        action="append",
        default=[],
        help="Deprecated. Judge models must be provided via JUDGE_MODELS.",
    )
    parser.add_argument("--openai-base-url", default=os.getenv("OPENAI_BASE_URL", "https://api.openai.com/v1"))
    parser.add_argument("--openai-api-key", default=os.getenv("OPENAI_API_KEY", ""))
    parser.add_argument("--timeout-seconds", type=int, default=120)
    args = parser.parse_args()

    result = evaluate_benchmark_files(
        tasks_file=args.tasks_file,
        bench_file=args.bench_file,
        output_file=args.output_file,
        judge_models=args.judge_model,
        openai_base_url=args.openai_base_url,
        openai_api_key=args.openai_api_key,
        timeout_seconds=max(1, int(args.timeout_seconds)),
    )
    if args.output_file.strip():
        print(args.output_file)
    else:
        print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
