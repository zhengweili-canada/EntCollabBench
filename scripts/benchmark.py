#!/usr/bin/env python3
from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
import copy
import glob
import json
import os
import random
import sys
import time
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Set, Tuple
from urllib import error as urlerror
from urllib import request as urlrequest


ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from tool.tool_executor import ToolExecutionError, execute_tool  # noqa: E402
from session_store import RedisSessionBindingStore  # noqa: E402

DEFAULT_SERVERS: List[str] = [
    "calendar",
    "csm",
    "drive",
    "email",
    "gitea",
    "hr",
    "itsm",
    "teams",
]

DEFAULT_STATE_DIFF_IGNORE_FIELDS = {
    "id",
    "created_at",
    "updated_at",
    "deleted_at",
    "createdon",
    "updatedon",
    "sys_created_on",
    "sys_updated_on",
    "sys_created_by",
    "sys_updated_by",
    "last_modified",
    "last_modified_at",
}


def _utc_now_iso() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="milliseconds")


def _beijing_ts() -> str:
    beijing_tz = timezone(timedelta(hours=8), name="Asia/Shanghai")
    return datetime.now(beijing_tz).strftime("%Y%m%d_%H%M%S")


def _post_json_with_meta(url: str, payload: Dict[str, Any], timeout: int = 300) -> Dict[str, Any]:
    sent_at = _utc_now_iso()
    started = time.time()
    req = urlrequest.Request(
        url=url,
        data=json.dumps(payload, ensure_ascii=False).encode("utf-8"),
        headers={"Content-Type": "application/json", "Accept": "application/json"},
        method="POST",
    )
    with urlrequest.urlopen(req, timeout=timeout) as resp:
        raw = resp.read().decode("utf-8")
        body = json.loads(raw) if raw else {}
        headers = dict(resp.headers.items())
        status_code = int(getattr(resp, "status", 200))
    return {
        "sent_at": sent_at,
        "received_at": _utc_now_iso(),
        "duration_ms": round((time.time() - started) * 1000, 3),
        "status_code": status_code,
        "response_headers": headers,
        "response_body": body,
    }


def _post_json(url: str, payload: Dict[str, Any], timeout: int = 400) -> Dict[str, Any]:
    out = _post_json_with_meta(url, payload, timeout=timeout)
    return out.get("response_body", {})


def _should_retry_http_status(status_code: Optional[int]) -> bool:
    return int(status_code or 0) in {429, 503}


def _compute_retry_delay_seconds(attempt_index: int, base_seconds: float = 2.0, max_seconds: float = 60.0) -> float:
    expo = base_seconds * (2 ** max(0, attempt_index - 1))
    delay = min(max_seconds, expo)
    # Small jitter to avoid synchronized retries when running multiple batches.
    jitter = random.uniform(0.0, min(1.0, delay * 0.2))
    return delay + jitter


def _task_request(
    *,
    task_url: str,
    request_id: str,
    target_agent: str,
    task: str,
    session_id: str,
    max_depth: int,
    timeout_seconds: int,
    benchmark_server_allowlist: Optional[List[str]] = None,
) -> Dict[str, Any]:
    deadline_iso = datetime.fromtimestamp(time.time() + max(1, int(timeout_seconds)), timezone.utc).isoformat(
        timespec="milliseconds"
    )
    payload = {
        "request_id": request_id,
        "source_agent": "user",
        "target_agent": target_agent,
        "task": task,
        "recursion": {"depth": 0, "max_depth": max_depth, "trace": [f"user->{target_agent}"]},
        "metadata": {"session_id": session_id, "deadline_at": deadline_iso},
    }
    if benchmark_server_allowlist is not None:
        payload["metadata"]["benchmark_server_allowlist"] = [
            str(server).strip()
            for server in benchmark_server_allowlist
            if str(server).strip()
        ]
    max_retries = max(0, int(os.getenv("BENCHMARK_HTTP_RETRY_MAX", "5")))
    retry_base_seconds = float(os.getenv("BENCHMARK_HTTP_RETRY_BASE_SECONDS", "2"))
    retry_max_seconds = float(os.getenv("BENCHMARK_HTTP_RETRY_MAX_SECONDS", "60"))
    retry_history: List[Dict[str, Any]] = []
    attempt = 0
    while True:
        attempt += 1
        sent_at = _utc_now_iso()
        started = time.time()
        try:
            response = _post_json_with_meta(task_url, payload, timeout=max(1, int(timeout_seconds)))
            out = {
                "request_payload": payload,
                "request_url": task_url,
                "response": response,
            }
            if retry_history:
                out["retry_attempts"] = len(retry_history)
                out["retry_history"] = retry_history
            return out
        except urlerror.HTTPError as exc:
            err_status_code: Optional[int] = None
            try:
                err_status_code = int(getattr(exc, "code", 0)) or None
            except Exception:
                err_status_code = None

            err_headers: Dict[str, Any] = {}
            try:
                err_headers = dict(exc.headers.items()) if exc.headers else {}
            except Exception:
                err_headers = {}

            raw_error_text = ""
            try:
                raw_bytes = exc.read()
                if isinstance(raw_bytes, bytes):
                    raw_error_text = raw_bytes.decode("utf-8", errors="replace")
                elif raw_bytes is not None:
                    raw_error_text = str(raw_bytes)
            except Exception:
                raw_error_text = ""
            raw_error_text = raw_error_text.strip()

            parsed_error_body: Any = {}
            if raw_error_text:
                try:
                    parsed_error_body = json.loads(raw_error_text)
                except Exception:
                    parsed_error_body = {"raw_text": raw_error_text[:4000]}

            response_detail = ""
            if isinstance(parsed_error_body, dict):
                for key in ("error", "message", "detail"):
                    if key in parsed_error_body:
                        response_detail = str(parsed_error_body.get(key, "")).strip()
                        if response_detail:
                            break
            elif isinstance(parsed_error_body, list) and parsed_error_body:
                response_detail = json.dumps(parsed_error_body[:3], ensure_ascii=False)
            if not response_detail and raw_error_text:
                response_detail = " ".join(raw_error_text.split())[:500]

            request_error = str(exc)
            if response_detail:
                request_error = f"{request_error} | response: {response_detail}"

            can_retry = _should_retry_http_status(err_status_code) and attempt <= max_retries
            if can_retry:
                delay_s = _compute_retry_delay_seconds(
                    attempt_index=attempt,
                    base_seconds=max(0.1, retry_base_seconds),
                    max_seconds=max(0.1, retry_max_seconds),
                )
                retry_history.append(
                    {
                        "attempt": attempt,
                        "status_code": err_status_code,
                        "exception_type": type(exc).__name__,
                        "delay_seconds": round(delay_s, 3),
                        "error_preview": request_error[:500],
                        "received_at": _utc_now_iso(),
                    }
                )
                time.sleep(delay_s)
                continue

            response = {
                "sent_at": sent_at,
                "received_at": _utc_now_iso(),
                "duration_ms": round((time.time() - started) * 1000, 3),
                "status_code": err_status_code,
                "response_headers": err_headers,
                "response_body": parsed_error_body if parsed_error_body is not None else {},
            }
            out = {
                "request_payload": payload,
                "request_url": task_url,
                "response": response,
                "request_error": request_error,
                "request_exception_type": type(exc).__name__,
                "request_error_status_code": err_status_code,
                "request_error_response_headers": err_headers,
                "request_error_response_body": parsed_error_body if parsed_error_body is not None else {},
                "request_error_response_text": raw_error_text[:4000] if raw_error_text else "",
            }
            if retry_history:
                out["retry_attempts"] = len(retry_history)
                out["retry_history"] = retry_history
            return out
        except Exception as exc:
            response = {
                "sent_at": sent_at,
                "received_at": _utc_now_iso(),
                "duration_ms": round((time.time() - started) * 1000, 3),
                "status_code": None,
                "response_headers": {},
                "response_body": {},
            }
            out = {
                "request_payload": payload,
                "request_url": task_url,
                "response": response,
                "request_error": str(exc),
                "request_exception_type": type(exc).__name__,
            }
            if retry_history:
                out["retry_attempts"] = len(retry_history)
                out["retry_history"] = retry_history
            return out


def _is_timeout_error(exc_text: str, exc_type: str = "") -> bool:
    t = (exc_text or "").lower()
    k = (exc_type or "").lower()
    if "timed out" in t or "timeout" in t:
        return True
    if "timeout" in k:
        return True
    if k in {"timeouterror"}:
        return True
    return False


def _cancel_request_on_agent(
    *,
    agent_base_url: str,
    session_id: str,
    request_id: str,
    reason: str,
    timeout_seconds: int = 5,
) -> Dict[str, Any]:
    url = f"{agent_base_url.rstrip('/')}/v1/agent/requests/cancel"
    payload = {
        "session_id": session_id,
        "request_id": request_id,
        "reason": reason,
    }
    return _post_json(url, payload, timeout=max(1, int(timeout_seconds)))


def _broadcast_cancel_request(
    *,
    agent_url_map: Dict[str, str],
    session_id: str,
    request_id: str,
    reason: str,
) -> Dict[str, Any]:
    out: Dict[str, Any] = {}
    if not agent_url_map:
        return out
    max_workers = min(len(agent_url_map), 8)
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        future_map = {
            executor.submit(
                _cancel_request_on_agent,
                agent_base_url=agent_base_url,
                session_id=session_id,
                request_id=request_id,
                reason=reason,
            ): agent_name
            for agent_name, agent_base_url in agent_url_map.items()
        }
        for future in as_completed(future_map):
            agent_name = future_map[future]
            try:
                out[agent_name] = future.result()
            except Exception as exc:
                out[agent_name] = {"status": "error", "error": str(exc)}
    return out


def _iso_to_unix_seconds(value: str) -> Optional[float]:
    v = str(value or "").strip()
    if not v:
        return None
    try:
        return datetime.fromisoformat(v).timestamp()
    except Exception:
        return None


def _trim_trace_to_cutoff(trace: Dict[str, Any], cutoff_ts: float) -> Dict[str, Any]:
    out = dict(trace)
    events = trace.get("events")
    if isinstance(events, list):
        filtered_events = []
        for item in events:
            if not isinstance(item, dict):
                continue
            ts = item.get("ts")
            if isinstance(ts, (int, float)) and float(ts) <= cutoff_ts:
                filtered_events.append(item)
        out["events"] = filtered_events
        out["event_count"] = len(filtered_events)
    return out


def _trim_all_agent_traces_to_cutoff(
    traces: Dict[str, Any],
    cutoff_ts: Optional[float],
) -> Dict[str, Any]:
    if cutoff_ts is None:
        return traces
    out: Dict[str, Any] = {}
    for agent_name, entry in traces.items():
        if not isinstance(entry, dict):
            out[agent_name] = entry
            continue
        agent_entry = dict(entry)
        trace_obj = agent_entry.get("trace")
        if isinstance(trace_obj, dict):
            agent_entry["trace"] = _trim_trace_to_cutoff(trace_obj, cutoff_ts)
        out[agent_name] = agent_entry
    return out


def _collect_completed_steps_before_cutoff(
    traces: Dict[str, Any],
    cutoff_ts: Optional[float],
) -> List[Dict[str, Any]]:
    if cutoff_ts is None:
        return []
    step_events = {
        "agent_message",
        "tool_call",
        "tool_result",
        "delegate_done",
    }
    steps: List[Dict[str, Any]] = []
    for agent_name, entry in traces.items():
        if not isinstance(entry, dict):
            continue
        trace = entry.get("trace")
        if not isinstance(trace, dict):
            continue
        events = trace.get("events")
        if not isinstance(events, list):
            continue
        for item in events:
            if not isinstance(item, dict):
                continue
            ts = item.get("ts")
            event_name = str(item.get("event", ""))
            if not isinstance(ts, (int, float)) or float(ts) > cutoff_ts:
                continue
            if event_name not in step_events:
                continue
            steps.append(
                {
                    "ts": float(ts),
                    "agent": agent_name,
                    "event": event_name,
                    "data": item.get("data", {}),
                }
            )
    steps.sort(key=lambda x: x["ts"])
    return steps


def _extract_json_object(text: str) -> Optional[Dict[str, Any]]:
    text = text.strip()
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


def _extract_embedded_error(result_text: str) -> Optional[str]:
    obj = _extract_json_object(result_text)
    if not isinstance(obj, dict):
        return None
    err = obj.get("error")
    if isinstance(err, str) and err.strip():
        return err.strip()
    return None


def _fetch_agent_session_trace(
    *,
    agent_base_url: str,
    session_id: str,
    request_id: str = "",
) -> Dict[str, Any]:
    trace_url = f"{agent_base_url.rstrip('/')}/v1/agent/sessions/trace"
    payload: Dict[str, Any] = {"session_id": session_id}
    if request_id.strip():
        payload["request_id"] = request_id.strip()
    return _post_json(trace_url, payload, timeout=300)


def _fetch_task_traces_from_all_agents(
    *,
    session_id: str,
    request_id: str,
    agent_url_map: Dict[str, str],
) -> Dict[str, Any]:
    traces: Dict[str, Any] = {}
    if not agent_url_map:
        return traces
    max_workers = min(len(agent_url_map), 8)
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        future_map = {
            executor.submit(
                _fetch_agent_session_trace,
                agent_base_url=agent_base_url,
                session_id=session_id,
                request_id=request_id,
            ): (agent_name, agent_base_url)
            for agent_name, agent_base_url in agent_url_map.items()
        }
        for future in as_completed(future_map):
            agent_name, agent_base_url = future_map[future]
            entry: Dict[str, Any] = {
                "agent_name": agent_name,
                "agent_base_url": agent_base_url,
            }
            try:
                trace = future.result()
                entry["status"] = str(trace.get("status", "ok"))
                entry["trace"] = trace
            except Exception as exc:
                entry["status"] = "error"
                entry["error"] = str(exc)
            traces[agent_name] = entry
    return traces


def _server_to_domain(server: str) -> str:
    return server


def _pick_default_sql_file(server: str) -> str:
    domain = _server_to_domain(server)
    pattern = str(ROOT / "Arena" / "seed" / domain / "dbs" / "*.sql")
    files = sorted(glob.glob(pattern))
    if not files:
        raise FileNotFoundError(f"No SQL files found for {server}: {pattern}")
    return files[0]


def _pick_gitea_repos_tar_file(sql_file_host_path: str) -> str:
    sql_path = Path(sql_file_host_path).resolve()
    if not sql_path.exists() or not sql_path.is_file():
        raise FileNotFoundError(f"SQL file not found: {sql_file_host_path}")

    parent = sql_path.parent
    candidates = sorted(parent.glob("*.tar.gz"))
    if candidates:
        return str(candidates[0])

    raise FileNotFoundError(
        f"No repos tar.gz file found for gitea under {parent}. "
        "Expected: *.tar.gz"
    )


def _normalize_task_spec(raw: Dict[str, Any]) -> Dict[str, str]:
    if not isinstance(raw, dict):
        raise ValueError("task spec must be an object")
    task = raw.get("task", "")
    if not isinstance(task, str) or not task.strip():
        task = raw.get("user_prompt", "")
    if not isinstance(task, str) or not task.strip():
        raise ValueError("task spec requires non-empty 'task' or 'user_prompt' string")
    target_agent = raw.get("target_agent", "")
    if not isinstance(target_agent, str) or not target_agent.strip():
        target_agent = raw.get("begin_agent", "")
    if not isinstance(target_agent, str) or not target_agent.strip():
        target_agent = raw.get("beginning_agent", "")
    if not isinstance(target_agent, str) or not target_agent.strip():
        raise ValueError(
            "task spec requires non-empty 'target_agent' or 'beginning_agent' string"
        )
    return {"task": task.strip(), "target_agent": target_agent.strip()}


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
    task_num = _extract_first_int(value)
    if task_num is None or task_num <= 0:
        task_num = fallback
    return f"task_{task_num}"


def _normalize_sub_task_id(task_id: str, value: Any, fallback_sub_pos: int) -> str:
    sub_num = _extract_last_int(value)
    if sub_num is None or sub_num <= 0:
        sub_num = fallback_sub_pos
    return f"{task_id}_{sub_num}"


def _parse_subtask_spec(
    raw: Dict[str, Any],
    *,
    task_id: str,
    fallback_sub_pos: int,
) -> Dict[str, Any]:
    spec = _normalize_task_spec(raw)
    subtask_index = _safe_int(raw.get("subtask_index", raw.get("sub_index")), fallback_sub_pos)
    return {
        "subtask_index": max(1, int(subtask_index)),
        "sub_task_id": _normalize_sub_task_id(
            task_id,
            raw.get("sub_task_id", raw.get("sub_index")),
            fallback_sub_pos=fallback_sub_pos,
        ),
        "task": spec["task"],
        "target_agent": spec["target_agent"],
    }


def _normalize_task_batch(raw: Dict[str, Any], *, fallback_task_pos: int) -> Dict[str, Any]:
    if not isinstance(raw, dict):
        raise ValueError("task batch must be an object")
    desc = raw.get("description", "")
    description = desc.strip() if isinstance(desc, str) else ""

    task_id = _normalize_task_id(
        raw.get("task_id", raw.get("task_index", raw.get("index"))),
        fallback=max(1, int(fallback_task_pos)),
    )
    if "sub_task_list" in raw:
        sub_task_list = raw.get("sub_task_list")
        if not isinstance(sub_task_list, list) or not sub_task_list:
            raise ValueError("task batch 'sub_task_list' must be a non-empty array")
        subtasks = [
            _parse_subtask_spec(item, task_id=task_id, fallback_sub_pos=i)
            for i, item in enumerate(sub_task_list, start=1)
        ]
    elif "task_list" in raw:
        task_list = raw.get("task_list")
        if not isinstance(task_list, list) or not task_list:
            raise ValueError("task batch 'task_list' must be a non-empty array")
        subtasks = [
            _parse_subtask_spec(item, task_id=task_id, fallback_sub_pos=i)
            for i, item in enumerate(task_list, start=1)
        ]
    else:
        subtasks = [_parse_subtask_spec(raw, task_id=task_id, fallback_sub_pos=1)]

    out: Dict[str, Any] = {"subtasks": subtasks}
    if description:
        out["description"] = description
    out["task_id"] = task_id
    out["_raw_task_for_judge"] = copy.deepcopy(raw)
    if "state_export" in raw:
        out["state_export"] = _normalize_state_export_spec(raw.get("state_export"))
    return out


def _infer_needed_servers_for_batch(
    *,
    batch: Dict[str, Any],
    requested_servers: List[str],
) -> List[str]:
    requested = [str(server).strip() for server in requested_servers if str(server).strip()]
    requested_set = set(requested)
    if not requested:
        return []

    raw_task = batch.get("_raw_task_for_judge", {})
    needed: Set[str] = set()
    gt_found = False

    if isinstance(raw_task, dict):
        raw_subtasks = raw_task.get("sub_task_list")
        if isinstance(raw_subtasks, list):
            for subtask in raw_subtasks:
                if not isinstance(subtask, dict):
                    continue
                ground_truth = subtask.get("ground_truth")
                if not isinstance(ground_truth, list):
                    continue
                for step in ground_truth:
                    if not isinstance(step, dict):
                        continue
                    gt_found = True
                    server = str(step.get("mcp_server_name", "")).strip()
                    if server and server in requested_set:
                        needed.add(server)

    state_export_spec = batch.get("state_export", {})
    if isinstance(state_export_spec, dict):
        servers_cfg = state_export_spec.get("servers")
        if isinstance(servers_cfg, dict):
            for server in servers_cfg.keys():
                server_name = str(server).strip()
                if server_name and server_name in requested_set:
                    needed.add(server_name)

    if not gt_found:
        return requested
    return [server for server in requested if server in needed]


def _load_task_batches(
    task_specs_json: List[str],
    tasks_spec_file: str,
) -> List[Dict[str, Any]]:
    batches: List[Dict[str, Any]] = []

    # Repeated --task-spec-json '{"task":"...","target_agent":"..."}'
    for raw in task_specs_json:
        if not isinstance(raw, str) or not raw.strip():
            continue
        obj = json.loads(raw)
        batches.append(_normalize_task_batch(obj, fallback_task_pos=len(batches) + 1))

    # Task spec file:
    # - Single JSON object:
    #   {"sub_task_list":[...]} (tasks_200_format/test_5 style),
    #   {"task_list":[...]} or {"task":"...","target_agent":"..."}
    # - JSON array file: [batch1, batch2, ...]
    # - JSONL: each line is one JSON object
    if tasks_spec_file:
        path = Path(tasks_spec_file)
        if not path.exists():
            raise FileNotFoundError(f"tasks spec file not found: {tasks_spec_file}")
        raw = path.read_text(encoding="utf-8").strip()
        if raw:
            parsed = None
            try:
                parsed = json.loads(raw)
            except Exception:
                parsed = None

            if isinstance(parsed, dict):
                batches.append(_normalize_task_batch(parsed, fallback_task_pos=len(batches) + 1))
            elif isinstance(parsed, list):
                for item in parsed:
                    batches.append(_normalize_task_batch(item, fallback_task_pos=len(batches) + 1))
            else:
                for i, line in enumerate(raw.splitlines(), start=1):
                    line = line.strip()
                    if not line:
                        continue
                    try:
                        item = json.loads(line)
                    except Exception as exc:
                        raise ValueError(
                            f"Invalid JSON on tasks-spec-file line {i}: {exc}"
                        ) from exc
                    batches.append(_normalize_task_batch(item, fallback_task_pos=len(batches) + 1))

    return batches


def _iter_jsonl_rows(path: Path) -> Iterable[Dict[str, Any]]:
    if not path.exists():
        return
    with path.open("r", encoding="utf-8") as f:
        for line_no, raw in enumerate(f, start=1):
            line = raw.strip()
            if not line:
                continue
            try:
                obj = json.loads(line)
            except Exception as exc:
                raise ValueError(f"Invalid JSON on result file line {line_no}: {exc}") from exc
            if isinstance(obj, dict):
                yield obj


def _write_jsonl_rows(path: Path, rows: List[Dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        for row in rows:
            f.write(json.dumps(row, ensure_ascii=False) + "\n")


def _row_sort_key_for_latest(row: Dict[str, Any], fallback_index: int) -> Tuple[str, int]:
    # Prefer explicit ISO timestamp; fallback to file order when missing.
    ts = str(row.get("timestamp", "")).strip()
    return ts, fallback_index


def _text_has_infra_error(text: str) -> bool:
    t = (text or "").strip().lower()
    if not t:
        return False
    needles = (
        "timed out",
        "timeout",
        "connection error",
        "http error 500",
        "internal server error",
        "ssl:",
        "unexpected eof",
        "eof occurred in violation of protocol",
        "apiconnectionerror",
        "service unavailable",
        "too many requests",
        "429",
    )
    return any(n in t for n in needles)


def _is_abnormal_existing_result(row: Dict[str, Any]) -> bool:
    runtime = row.get("runtime_summary", {})
    if isinstance(runtime, dict):
        # Runtime-level failures are treated as environment/infra anomalies.
        if str(runtime.get("status", "")).strip().lower() != "ok":
            return True
        subtasks = runtime.get("subtasks", [])
        if isinstance(subtasks, list):
            for sub in subtasks:
                if not isinstance(sub, dict):
                    continue
                if _text_has_infra_error(str(sub.get("request_error", ""))):
                    return True

    judge = row.get("judge", {})
    task = judge.get("task", {}) if isinstance(judge, dict) else {}
    subtasks = task.get("subtasks", []) if isinstance(task, dict) else []
    if isinstance(subtasks, list):
        for sub in subtasks:
            if not isinstance(sub, dict):
                continue
            agents = sub.get("agents", [])
            if not isinstance(agents, list):
                continue
            for agent in agents:
                if not isinstance(agent, dict):
                    continue
                votes = agent.get("votes", [])
                if not isinstance(votes, list):
                    continue
                for vote in votes:
                    if not isinstance(vote, dict):
                        continue
                    error = str(vote.get("error", "")).strip()
                    if _text_has_infra_error(error):
                        return True
    return False


def _row_has_judge_model_error(row: Dict[str, Any]) -> bool:
    judge = row.get("judge", {})
    task = judge.get("task", {}) if isinstance(judge, dict) else {}
    subtasks = task.get("subtasks", []) if isinstance(task, dict) else []
    if not isinstance(subtasks, list):
        return False
    for sub in subtasks:
        if not isinstance(sub, dict):
            continue
        agents = sub.get("agents", [])
        if not isinstance(agents, list):
            continue
        for agent in agents:
            if not isinstance(agent, dict):
                continue
            votes = agent.get("votes", [])
            if not isinstance(votes, list):
                continue
            for vote in votes:
                if not isinstance(vote, dict):
                    continue
                reason = str(vote.get("reason", "")).strip().lower()
                if reason == "judge_model_error":
                    return True
    return False


def _build_task_for_judge_from_batch(batch: Dict[str, Any], fallback_index: int) -> Dict[str, Any]:
    task_obj = copy.deepcopy(batch.get("_raw_task_for_judge", {}))
    if not isinstance(task_obj, dict):
        task_obj = {}
    task_obj.setdefault("task_id", batch.get("task_id", f"task_{fallback_index}"))
    raw_subtasks = task_obj.get("sub_task_list")
    if isinstance(raw_subtasks, list):
        spec_subtasks = batch.get("subtasks", [])
        for idx, sub in enumerate(raw_subtasks):
            if not isinstance(sub, dict):
                continue
            if "sub_task_id" not in sub:
                fallback_sub_id = ""
                if (
                    isinstance(spec_subtasks, list)
                    and idx < len(spec_subtasks)
                    and isinstance(spec_subtasks[idx], dict)
                ):
                    fallback_sub_id = str(spec_subtasks[idx].get("sub_task_id", "")).strip()
                sub["sub_task_id"] = fallback_sub_id or f"{task_obj.get('task_id', batch.get('task_id', f'task_{fallback_index}'))}_{idx + 1}"
    return task_obj


def _load_latest_trajectory_batch_entries(path: Path) -> Dict[str, Dict[str, Any]]:
    latest: Dict[str, Tuple[Tuple[str, int], Dict[str, Any]]] = {}
    idx = 0
    for row in _iter_jsonl_rows(path):
        idx += 1
        batch_entry = row.get("batch_entry")
        if not isinstance(batch_entry, dict):
            continue
        task_id = str(batch_entry.get("task_id", row.get("task_id", ""))).strip()
        if not task_id:
            continue
        key = _row_sort_key_for_latest(row, idx)
        prev = latest.get(task_id)
        if prev is None or key >= prev[0]:
            latest[task_id] = (key, batch_entry)
    return {task_id: copy.deepcopy(entry) for task_id, (_, entry) in latest.items()}


def _build_judge_line_from_task_judge(
    *,
    task_id: str,
    task_judge: Dict[str, Any],
    batch_entry: Dict[str, Any],
) -> Dict[str, Any]:
    line: Dict[str, Any] = {
        "timestamp": _utc_now_iso(),
        "task_id": task_id,
        "task_passed": 1 if bool(task_judge.get("passed")) else 0,
        "judge": {
            "summary": _compact_judge_summary_for_single_task(
                {
                    "subtask_count": task_judge.get("subtask_count", 0),
                    "subtask_pass_count": sum(
                        1
                        for sub in (task_judge.get("subtasks", []) if isinstance(task_judge.get("subtasks"), list) else [])
                        if isinstance(sub, dict) and bool(sub.get("passed"))
                    ),
                    "agent_eval_count": sum(
                        len(sub.get("agents", []))
                        for sub in (task_judge.get("subtasks", []) if isinstance(task_judge.get("subtasks"), list) else [])
                        if isinstance(sub, dict) and isinstance(sub.get("agents"), list)
                    ),
                    "agent_pass_count": sum(
                        sum(1 for agent in sub.get("agents", []) if isinstance(agent, dict) and bool(agent.get("passed")))
                        for sub in (task_judge.get("subtasks", []) if isinstance(task_judge.get("subtasks"), list) else [])
                        if isinstance(sub, dict) and isinstance(sub.get("agents"), list)
                    ),
                    "judge_input_tokens": sum(
                        _safe_int(vote.get("input_tokens"), 0)
                        for sub in (task_judge.get("subtasks", []) if isinstance(task_judge.get("subtasks"), list) else [])
                        if isinstance(sub, dict)
                        for agent in (sub.get("agents", []) if isinstance(sub.get("agents"), list) else [])
                        if isinstance(agent, dict)
                        for vote in (agent.get("votes", []) if isinstance(agent.get("votes"), list) else [])
                        if isinstance(vote, dict)
                    ),
                    "judge_output_tokens": sum(
                        _safe_int(vote.get("output_tokens"), 0)
                        for sub in (task_judge.get("subtasks", []) if isinstance(task_judge.get("subtasks"), list) else [])
                        if isinstance(sub, dict)
                        for agent in (sub.get("agents", []) if isinstance(sub.get("agents"), list) else [])
                        if isinstance(agent, dict)
                        for vote in (agent.get("votes", []) if isinstance(agent.get("votes"), list) else [])
                        if isinstance(vote, dict)
                    ),
                    "judge_total_tokens": sum(
                        _safe_int(vote.get("total_tokens"), 0)
                        for sub in (task_judge.get("subtasks", []) if isinstance(task_judge.get("subtasks"), list) else [])
                        if isinstance(sub, dict)
                        for agent in (sub.get("agents", []) if isinstance(sub.get("agents"), list) else [])
                        if isinstance(agent, dict)
                        for vote in (agent.get("votes", []) if isinstance(agent.get("votes"), list) else [])
                        if isinstance(vote, dict)
                    ),
                }
            ),
            "task": task_judge if isinstance(task_judge, dict) else {},
        },
    }
    line["runtime_summary"] = _build_runtime_summary(batch_entry)
    run_input_tokens, run_output_tokens, run_total_tokens, run_tokens_by_agent = _collect_run_tokens_from_batch_entry(batch_entry)
    line["run_input_tokens"] = run_input_tokens
    line["run_output_tokens"] = run_output_tokens
    line["run_total_tokens"] = run_total_tokens
    line["run_tokens_by_agent"] = run_tokens_by_agent
    return line


def _infer_paired_trajectory_path_from_result_path(result_path: Path) -> Optional[Path]:
    name = result_path.name
    if not (name.startswith("result-") and name.endswith(".jsonl")):
        return None
    suffix = name[len("result-") :]
    traj_name = f"traj-{suffix}"
    candidate = result_path.parent / "traj" / traj_name
    return candidate


def _load_stable_task_ids_from_result_jsonl(
    path_str: str,
) -> Tuple[Set[str], Dict[str, int], List[Dict[str, Any]], Set[str], Dict[str, Dict[str, Any]]]:
    path = Path(path_str).expanduser()
    stable_task_ids: Set[str] = set()
    stats = {
        "rows": 0,
        "kept": 0,
        "dropped_abnormal": 0,
        "judge_model_error_rows": 0,
        "dropped_dedup": 0,
        "missing_task_id": 0,
        "file_exists": path.exists(),
    }
    latest_by_task: Dict[str, Tuple[Tuple[str, int], Dict[str, Any]]] = {}
    latest_judge_error_by_task: Dict[str, Tuple[Tuple[str, int], Dict[str, Any]]] = {}
    judge_error_task_ids: Set[str] = set()
    dedup_kept_rows: List[Dict[str, Any]] = []
    row_idx = 0
    for row in _iter_jsonl_rows(path):
        row_idx += 1
        stats["rows"] += 1
        task_id = str(row.get("task_id", "")).strip()
        if not task_id:
            stats["missing_task_id"] += 1
            continue
        # Keep judge_model_error rows for rejudge even when they also carry
        # transient infra/network errors in judge votes.
        if _row_has_judge_model_error(row):
            stats["judge_model_error_rows"] += 1
            judge_error_task_ids.add(task_id)
            key = _row_sort_key_for_latest(row, row_idx)
            prev_judge_err = latest_judge_error_by_task.get(task_id)
            if prev_judge_err is None or key >= prev_judge_err[0]:
                latest_judge_error_by_task[task_id] = (key, row)
            continue
        if _is_abnormal_existing_result(row):
            stats["dropped_abnormal"] += 1
            continue
        key = _row_sort_key_for_latest(row, row_idx)
        prev = latest_by_task.get(task_id)
        if prev is None or key >= prev[0]:
            latest_by_task[task_id] = (key, row)

    for task_id, (_, row) in latest_by_task.items():
        stable_task_ids.add(task_id)
        dedup_kept_rows.append(row)
    stats["kept"] = len(dedup_kept_rows)
    stats["dropped_dedup"] = max(0, (stats["rows"] - stats["missing_task_id"] - stats["dropped_abnormal"]) - stats["kept"])

    # Keep file order stable by timestamp ascending when available, otherwise by original order.
    dedup_kept_rows.sort(key=lambda r: _row_sort_key_for_latest(r, 0))

    # Do not write file here. Caller decides when to flush rows to disk.
    stats["pruned_rows_written"] = stats["kept"]
    latest_judge_error_rows = {
        task_id: copy.deepcopy(row)
        for task_id, (_, row) in latest_judge_error_by_task.items()
    }
    return stable_task_ids, stats, dedup_kept_rows, judge_error_task_ids, latest_judge_error_rows


def _append_jsonl(path: Path, item: Dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a", encoding="utf-8") as f:
        f.write(json.dumps(item, ensure_ascii=False) + "\n")


def _safe_int(value: Any, default: int = 0) -> int:
    try:
        return int(value)
    except Exception:
        return default


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


def _load_judge_evaluator():
    scripts_dir = Path(__file__).resolve().parent
    if str(scripts_dir) not in sys.path:
        sys.path.insert(0, str(scripts_dir))
    from judge import judge as judge_mod  # type: ignore

    return judge_mod.evaluate_benchmark


def _require_judge_env_or_exit() -> None:
    judge_api_key = str(os.getenv("JUDGE_OPENAI_API_KEY", "")).strip()
    default_api_key = str(os.getenv("OPENAI_API_KEY", "")).strip()
    judge_base_url = str(os.getenv("JUDGE_OPENAI_BASE_URL", "")).strip()
    default_base_url = str(os.getenv("OPENAI_BASE_URL", "")).strip()
    judge_models = [x.strip() for x in os.getenv("JUDGE_MODELS", "").split(",") if x.strip()]

    missing: List[str] = []
    if not (judge_api_key or default_api_key):
        missing.append("API key")
    if not (judge_base_url or default_base_url):
        missing.append("base URL")
    if not judge_models:
        missing.append("JUDGE_MODELS")
    if not missing:
        return

    missing_text = ", ".join(missing)
    print(
        f"Missing required judge env: {missing_text}.\n"
        "Set API key (one of):\n"
        "  - JUDGE_OPENAI_API_KEY (preferred for benchmark judge)\n"
        "  - OPENAI_API_KEY (global fallback)\n"
        "Set base URL (one of):\n"
        "  - JUDGE_OPENAI_BASE_URL\n"
        "  - OPENAI_BASE_URL\n"
        "Set judge models:\n"
        "  - JUDGE_MODELS (comma-separated, required; supports 1 to 3 models)"
    )
    raise SystemExit(2)


def _build_runtime_summary(batch_entry: Dict[str, Any]) -> Dict[str, Any]:
    task_results = batch_entry.get("task_results", [])
    if not isinstance(task_results, list):
        task_results = []
    subtasks: List[Dict[str, Any]] = []
    for task_entry in task_results:
        if not isinstance(task_entry, dict):
            continue
        all_agent_traces = task_entry.get("all_agent_traces", {})
        trace_event_counts: Dict[str, int] = {}
        if isinstance(all_agent_traces, dict):
            for agent_name, agent_entry in all_agent_traces.items():
                if not isinstance(agent_entry, dict):
                    continue
                trace_obj = agent_entry.get("trace", {})
                events = trace_obj.get("events", []) if isinstance(trace_obj, dict) else []
                trace_event_counts[str(agent_name)] = len(events) if isinstance(events, list) else 0
        subtasks.append(
            {
                "sub_task_id": task_entry.get("sub_task_id"),
                "target_agent": task_entry.get("target_agent"),
                "agent_status": task_entry.get("agent_status"),
                "request_error": task_entry.get("request_error", ""),
                "duration_ms": task_entry.get("duration_ms"),
                "subtask_result_preview": str(task_entry.get("subtask_result", ""))[:400],
                "trace_event_counts": trace_event_counts,
            }
        )
    return {
        "status": batch_entry.get("status"),
        "task_id": batch_entry.get("task_id"),
        "session_id": batch_entry.get("session_id"),
        "subtask_count": batch_entry.get("subtask_count"),
        "subtasks": subtasks,
        "error_count": len(batch_entry.get("errors", [])) if isinstance(batch_entry.get("errors"), list) else 0,
    }


def _compact_judge_summary_for_single_task(summary: Any) -> Dict[str, Any]:
    if not isinstance(summary, dict):
        return {}
    return {
        "subtask_count": _safe_int(summary.get("subtask_count"), 0),
        "subtask_pass_count": _safe_int(summary.get("subtask_pass_count"), 0),
        "agent_eval_count": _safe_int(summary.get("agent_eval_count"), 0),
        "agent_pass_count": _safe_int(summary.get("agent_pass_count"), 0),
        "agent_pass_rate": float(summary.get("agent_pass_rate", 0.0) or 0.0),
        "judge_input_tokens": _safe_int(summary.get("judge_input_tokens"), 0),
        "judge_output_tokens": _safe_int(summary.get("judge_output_tokens"), 0),
        "judge_total_tokens": _safe_int(summary.get("judge_total_tokens"), 0),
    }


def _extract_usage_triplet_from_event_data(data: Dict[str, Any]) -> Tuple[int, int, int]:
    if not isinstance(data, dict):
        return (0, 0, 0)
    usage = data.get("usage_metadata")
    if isinstance(usage, dict):
        i = _safe_int(usage.get("input_tokens"), 0)
        o = _safe_int(usage.get("output_tokens"), 0)
        t = _safe_int(usage.get("total_tokens"), i + o)
        if t <= 0:
            t = i + o
        return (i, o, t)
    resp_meta = data.get("response_metadata")
    if isinstance(resp_meta, dict):
        token_usage = resp_meta.get("token_usage")
        if isinstance(token_usage, dict):
            i = _safe_int(token_usage.get("prompt_tokens"), 0)
            o = _safe_int(token_usage.get("completion_tokens"), 0)
            t = _safe_int(token_usage.get("total_tokens"), i + o)
            if t <= 0:
                t = i + o
            return (i, o, t)
    return (0, 0, 0)


def _collect_run_tokens_from_batch_entry(batch_entry: Dict[str, Any]) -> Tuple[int, int, int, Dict[str, Dict[str, int]]]:
    run_input = 0
    run_output = 0
    run_total = 0
    by_agent: Dict[str, Dict[str, int]] = {}
    task_results = batch_entry.get("task_results", [])
    if not isinstance(task_results, list):
        task_results = []
    for task_entry in task_results:
        if not isinstance(task_entry, dict):
            continue
        all_agent_traces = task_entry.get("all_agent_traces", {})
        if not isinstance(all_agent_traces, dict):
            continue
        for agent_name, agent_entry in all_agent_traces.items():
            if not isinstance(agent_entry, dict):
                continue
            trace_obj = agent_entry.get("trace", {})
            events = trace_obj.get("events", []) if isinstance(trace_obj, dict) else []
            if not isinstance(events, list):
                continue
            agent_in = 0
            agent_out = 0
            agent_total = 0
            for ev in events:
                if not isinstance(ev, dict):
                    continue
                if str(ev.get("event", "")).strip() != "llm_response_meta":
                    continue
                data = ev.get("data", {})
                if not isinstance(data, dict):
                    continue
                i, o, t = _extract_usage_triplet_from_event_data(data)
                agent_in += i
                agent_out += o
                agent_total += t
            if agent_name not in by_agent:
                by_agent[str(agent_name)] = {
                    "input_tokens": 0,
                    "output_tokens": 0,
                    "total_tokens": 0,
                }
            by_agent[str(agent_name)]["input_tokens"] += agent_in
            by_agent[str(agent_name)]["output_tokens"] += agent_out
            by_agent[str(agent_name)]["total_tokens"] += agent_total
            run_input += agent_in
            run_output += agent_out
            run_total += agent_total
    return run_input, run_output, run_total, by_agent


def _parse_json_mapping(raw: str, name: str) -> Dict[str, str]:
    if not raw.strip():
        return {}
    obj = json.loads(raw)
    if not isinstance(obj, dict):
        raise ValueError(f"{name} must be JSON object")
    out: Dict[str, str] = {}
    for k, v in obj.items():
        if isinstance(k, str) and k.strip() and isinstance(v, str) and v.strip():
            out[k.strip()] = v.strip()
    return out


def _load_json_mapping(
    *,
    mapping_file: str,
    mapping_json: str,
    name: str,
) -> Dict[str, str]:
    if mapping_file.strip():
        path = Path(mapping_file)
        if not path.exists():
            raise FileNotFoundError(f"{name} file not found: {mapping_file}")
        raw = path.read_text(encoding="utf-8").strip()
        if not raw:
            return {}
        return _parse_json_mapping(raw, name)
    return _parse_json_mapping(mapping_json, name)


def _resolve_task_url(
    *,
    target_agent: str,
    agent_url_map: Dict[str, str],
) -> str:
    mapped = agent_url_map.get(target_agent, "").strip()
    if not mapped:
        raise ValueError(
            f"Missing URL mapping for target_agent='{target_agent}'. "
            "Please provide it via --agent-url-map-json."
        )
    return f"{mapped.rstrip('/')}/v1/agent/tasks"


def _seed_server_direct(
    server: str,
    sql_file_host_path: str,
    repos_tar_host_path: str = "",
) -> str:
    payload: Dict[str, Any] = {"sql_file_path": sql_file_host_path}
    if repos_tar_host_path.strip():
        payload["repos_tar_path"] = repos_tar_host_path.strip()
    out = execute_tool(
        f"mcp.{server}.seed_database",
        payload,
    )
    obj = _extract_json_object(out) or {}
    db_id = str(obj.get("database_id", "")).strip()
    if not db_id:
        err = str(obj.get("error", "")).strip()
        if err:
            raise RuntimeError(err)
        raise RuntimeError(f"seed_database returned invalid payload: {out}")
    return db_id


def _cleanup_server_direct(server: str, database_id: str) -> Dict[str, Any]:
    out = execute_tool(
        f"mcp.{server}.delete_database",
        {"database_id": database_id},
    )
    obj = _extract_json_object(out) or {}
    if not obj:
        return {"raw_result": out}
    return obj


def _parse_json_value(text: str) -> Any:
    raw = str(text or "").strip()
    if not raw:
        return None
    try:
        return json.loads(raw)
    except Exception:
        return None


def _export_server_state(
    *,
    server: str,
    database_id: str,
    tables: Optional[List[str]] = None,
    where: Optional[Dict[str, Any]] = None,
    limit: int = 2000,
) -> Dict[str, Any]:
    payload: Dict[str, Any] = {"database_id": database_id}
    if tables:
        payload["tables"] = tables
    if where:
        payload["where"] = where
    if limit > 0:
        payload["limit"] = int(limit)
    out = execute_tool(f"mcp.{server}.export_state", payload)
    obj = _parse_json_value(out)
    if not isinstance(obj, dict):
        raise RuntimeError(f"export_state returned non-object payload on {server}: {out[:500]}")
    return obj


def _normalize_state_export_spec(raw: Any) -> Dict[str, Any]:
    if not isinstance(raw, dict):
        return {}
    out: Dict[str, Any] = {}
    default_limit = raw.get("default_limit")
    if isinstance(default_limit, int) and default_limit > 0:
        out["default_limit"] = int(default_limit)
    servers_raw = raw.get("servers")
    servers_out: Dict[str, Dict[str, Any]] = {}
    if isinstance(servers_raw, dict):
        for server, cfg in servers_raw.items():
            if not isinstance(server, str) or not server.strip() or not isinstance(cfg, dict):
                continue
            entry: Dict[str, Any] = {}
            tables_raw = cfg.get("tables")
            if isinstance(tables_raw, list):
                tables = [str(x).strip() for x in tables_raw if isinstance(x, str) and str(x).strip()]
                if tables:
                    entry["tables"] = tables
            where_raw = cfg.get("where")
            if isinstance(where_raw, dict):
                entry["where"] = where_raw
            limit_raw = cfg.get("limit")
            if isinstance(limit_raw, int) and limit_raw > 0:
                entry["limit"] = int(limit_raw)
            if entry:
                servers_out[server.strip()] = entry
    if servers_out:
        out["servers"] = servers_out
    return out


def _resolve_server_export_config(
    *,
    server: str,
    state_export_spec: Dict[str, Any],
    default_limit: int,
) -> Tuple[Optional[List[str]], Optional[Dict[str, Any]], int]:
    limit = int(default_limit)
    tables: Optional[List[str]] = None
    where: Optional[Dict[str, Any]] = None
    if not isinstance(state_export_spec, dict):
        return tables, where, limit
    if isinstance(state_export_spec.get("default_limit"), int) and int(state_export_spec["default_limit"]) > 0:
        limit = int(state_export_spec["default_limit"])
    servers_cfg = state_export_spec.get("servers")
    if isinstance(servers_cfg, dict):
        cfg = servers_cfg.get(server)
        if isinstance(cfg, dict):
            tables_cfg = cfg.get("tables")
            if isinstance(tables_cfg, list):
                tables = [str(x).strip() for x in tables_cfg if isinstance(x, str) and str(x).strip()]
                if not tables:
                    tables = None
            where_cfg = cfg.get("where")
            if isinstance(where_cfg, dict):
                where = where_cfg
            limit_cfg = cfg.get("limit")
            if isinstance(limit_cfg, int) and limit_cfg > 0:
                limit = int(limit_cfg)
    return tables, where, limit


def _extract_tables_from_export_payload(payload: Dict[str, Any]) -> Dict[str, List[Dict[str, Any]]]:
    tables: Dict[str, List[Dict[str, Any]]] = {}
    source: Any = None
    # Prefer explicit table containers from MCP/database export endpoints.
    if isinstance(payload.get("table_data"), dict):
        source = payload.get("table_data", {})
    elif isinstance(payload.get("tables"), dict):
        source = payload.get("tables", {})
    elif isinstance(payload.get("data"), dict):
        source = payload.get("data", {})
    else:
        source = payload

    if not isinstance(source, dict):
        return tables
    for table_name, rows_raw in source.items():
        if not isinstance(table_name, str) or not table_name.strip():
            continue
        # Skip known export metadata keys when source falls back to the raw payload.
        if table_name in {
            "success",
            "database_id",
            "service",
            "database_info",
            "table_counts",
            "timestamp",
            "error",
            "errors",
            "message",
        }:
            continue
        rows: List[Dict[str, Any]] = []
        if isinstance(rows_raw, list):
            for row in rows_raw:
                if isinstance(row, dict):
                    rows.append(row)
        elif isinstance(rows_raw, dict):
            rows.append(rows_raw)
        tables[table_name.strip()] = rows
    return tables


def _normalize_scalar(value: Any) -> Any:
    if isinstance(value, (str, int, float, bool)) or value is None:
        return value
    if isinstance(value, list):
        return [_normalize_scalar(v) for v in value]
    if isinstance(value, tuple):
        return [_normalize_scalar(v) for v in value]
    if isinstance(value, dict):
        out: Dict[str, Any] = {}
        for k in sorted(value.keys(), key=lambda x: str(x)):
            out[str(k)] = _normalize_scalar(value[k])
        return out
    return str(value)


def _canonicalize_row(row: Dict[str, Any], ignore_fields: set[str]) -> Dict[str, Any]:
    out: Dict[str, Any] = {}
    for key in sorted(row.keys()):
        key_s = str(key)
        if key_s.lower() in ignore_fields:
            continue
        out[key_s] = _normalize_scalar(row.get(key))
    return out


def _infer_key_fields(rows: List[Dict[str, Any]]) -> List[str]:
    if not rows:
        return []
    candidates = [
        "number",
        "sys_id",
        "kb_number",
        "id",
        "case_id",
        "incident_id",
        "change_id",
        "task_id",
        "user_id",
        "email",
        "name",
    ]
    sample_keys = set(rows[0].keys())
    dynamic_candidates = [k for k in sample_keys if isinstance(k, str) and k.endswith("_id")]
    for field in candidates + sorted(dynamic_candidates):
        if field not in sample_keys:
            continue
        seen = set()
        ok = True
        for row in rows:
            v = row.get(field)
            if v in (None, ""):
                ok = False
                break
            if v in seen:
                ok = False
                break
            seen.add(v)
        if ok:
            return [field]
    return []


def _canonicalize_snapshot(
    *,
    snapshot: Dict[str, Any],
    ignore_fields: set[str],
) -> Dict[str, Any]:
    out: Dict[str, Any] = {"servers": {}, "errors": list(snapshot.get("errors", []))}
    servers_raw = snapshot.get("servers", {})
    if not isinstance(servers_raw, dict):
        return out
    for server, entry in servers_raw.items():
        if not isinstance(entry, dict):
            continue
        server_out: Dict[str, Any] = {"status": entry.get("status", "")}
        if entry.get("status") != "ok":
            server_out["error"] = entry.get("error", "")
            out["servers"][server] = server_out
            continue
        payload = entry.get("payload")
        if not isinstance(payload, dict):
            server_out["status"] = "error"
            server_out["error"] = "invalid_payload"
            out["servers"][server] = server_out
            continue
        table_map = _extract_tables_from_export_payload(payload)
        tables_out: Dict[str, Any] = {}
        for table_name in sorted(table_map.keys()):
            rows = table_map[table_name]
            c_rows = [_canonicalize_row(row, ignore_fields) for row in rows]
            key_fields = _infer_key_fields(c_rows)
            c_rows.sort(key=lambda r: json.dumps(r, ensure_ascii=False, sort_keys=True))
            tables_out[table_name] = {
                "key_fields": key_fields,
                "row_count": len(c_rows),
                "rows": c_rows,
            }
        server_out["tables"] = tables_out
        out["servers"][server] = server_out
    return out


def _diff_row_fields(before: Dict[str, Any], after: Dict[str, Any]) -> Dict[str, Dict[str, Any]]:
    changed: Dict[str, Dict[str, Any]] = {}
    keys = sorted(set(before.keys()) | set(after.keys()))
    for key in keys:
        b = before.get(key)
        a = after.get(key)
        if b != a:
            changed[key] = {"before": b, "after": a}
    return changed


def _diff_table(
    *,
    initial_rows: List[Dict[str, Any]],
    final_rows: List[Dict[str, Any]],
    key_fields: List[str],
    max_changes: int,
) -> Dict[str, Any]:
    if not key_fields:
        initial_set = {json.dumps(r, ensure_ascii=False, sort_keys=True) for r in initial_rows}
        final_set = {json.dumps(r, ensure_ascii=False, sort_keys=True) for r in final_rows}
        inserted = [json.loads(x) for x in sorted(final_set - initial_set)[:max_changes]]
        deleted = [json.loads(x) for x in sorted(initial_set - final_set)[:max_changes]]
        return {
            "inserted": inserted,
            "deleted": deleted,
            "updated": [],
            "counts": {
                "inserted": len(final_set - initial_set),
                "deleted": len(initial_set - final_set),
                "updated": 0,
            },
            "truncated": {
                "inserted": len(final_set - initial_set) > len(inserted),
                "deleted": len(initial_set - final_set) > len(deleted),
                "updated": False,
            },
        }

    def _mk_key(row: Dict[str, Any]) -> str:
        return "|".join(str(row.get(k)) for k in key_fields)

    initial_map = {_mk_key(r): r for r in initial_rows}
    final_map = {_mk_key(r): r for r in final_rows}
    all_keys = sorted(set(initial_map.keys()) | set(final_map.keys()))
    inserted: List[Dict[str, Any]] = []
    deleted: List[Dict[str, Any]] = []
    updated: List[Dict[str, Any]] = []
    total_inserted = 0
    total_deleted = 0
    total_updated = 0
    for key in all_keys:
        in_before = key in initial_map
        in_after = key in final_map
        if not in_before and in_after:
            total_inserted += 1
            if len(inserted) < max_changes:
                inserted.append(final_map[key])
            continue
        if in_before and not in_after:
            total_deleted += 1
            if len(deleted) < max_changes:
                deleted.append(initial_map[key])
            continue
        before = initial_map[key]
        after = final_map[key]
        changes = _diff_row_fields(before, after)
        if changes:
            total_updated += 1
            if len(updated) < max_changes:
                updated.append({"key": key, "changed_fields": changes})
    return {
        "inserted": inserted,
        "deleted": deleted,
        "updated": updated,
        "counts": {
            "inserted": total_inserted,
            "deleted": total_deleted,
            "updated": total_updated,
        },
        "truncated": {
            "inserted": total_inserted > len(inserted),
            "deleted": total_deleted > len(deleted),
            "updated": total_updated > len(updated),
        },
    }


def _diff_canonical_snapshots(
    *,
    initial: Dict[str, Any],
    final: Dict[str, Any],
    max_changes: int,
) -> Dict[str, Any]:
    out: Dict[str, Any] = {"servers": {}, "errors": []}
    init_servers = initial.get("servers", {}) if isinstance(initial, dict) else {}
    final_servers = final.get("servers", {}) if isinstance(final, dict) else {}
    for server in sorted(set(init_servers.keys()) | set(final_servers.keys())):
        init_entry = init_servers.get(server, {}) if isinstance(init_servers, dict) else {}
        final_entry = final_servers.get(server, {}) if isinstance(final_servers, dict) else {}
        server_out: Dict[str, Any] = {
            "initial_status": init_entry.get("status", "missing"),
            "final_status": final_entry.get("status", "missing"),
            "tables": {},
        }
        if init_entry.get("status") != "ok" or final_entry.get("status") != "ok":
            if init_entry.get("status") != "ok":
                server_out["initial_error"] = init_entry.get("error", "")
            if final_entry.get("status") != "ok":
                server_out["final_error"] = final_entry.get("error", "")
            out["servers"][server] = server_out
            continue
        init_tables = init_entry.get("tables", {}) if isinstance(init_entry.get("tables"), dict) else {}
        final_tables = final_entry.get("tables", {}) if isinstance(final_entry.get("tables"), dict) else {}
        for table in sorted(set(init_tables.keys()) | set(final_tables.keys())):
            init_tbl = init_tables.get(table, {})
            final_tbl = final_tables.get(table, {})
            init_rows = init_tbl.get("rows", []) if isinstance(init_tbl, dict) else []
            final_rows = final_tbl.get("rows", []) if isinstance(final_tbl, dict) else []
            key_fields = []
            if isinstance(final_tbl, dict) and isinstance(final_tbl.get("key_fields"), list):
                key_fields = [str(x) for x in final_tbl["key_fields"]]
            elif isinstance(init_tbl, dict) and isinstance(init_tbl.get("key_fields"), list):
                key_fields = [str(x) for x in init_tbl["key_fields"]]
            table_diff = _diff_table(
                initial_rows=init_rows if isinstance(init_rows, list) else [],
                final_rows=final_rows if isinstance(final_rows, list) else [],
                key_fields=key_fields,
                max_changes=max(1, int(max_changes)),
            )
            counts = table_diff.get("counts", {})
            inserted = int(counts.get("inserted", 0)) if isinstance(counts, dict) else 0
            deleted = int(counts.get("deleted", 0)) if isinstance(counts, dict) else 0
            updated = int(counts.get("updated", 0)) if isinstance(counts, dict) else 0
            # Keep output focused for LLM judging: only include tables with actual changes.
            if inserted == 0 and deleted == 0 and updated == 0:
                continue
            table_diff["key_fields"] = key_fields
            table_diff["initial_row_count"] = len(init_rows) if isinstance(init_rows, list) else 0
            table_diff["final_row_count"] = len(final_rows) if isinstance(final_rows, list) else 0
            server_out["tables"][table] = table_diff
        # Skip unchanged servers unless there was a snapshot/export error.
        if server_out["tables"]:
            out["servers"][server] = server_out
    return out


def _capture_state_snapshot(
    *,
    seeded_db_ids: Dict[str, str],
    state_export_spec: Dict[str, Any],
    default_limit: int,
) -> Dict[str, Any]:
    out: Dict[str, Any] = {"servers": {}, "errors": []}
    for server, database_id in seeded_db_ids.items():
        tables, where, limit = _resolve_server_export_config(
            server=server,
            state_export_spec=state_export_spec,
            default_limit=default_limit,
        )
        entry: Dict[str, Any] = {
            "server": server,
            "database_id": database_id,
            "tables": tables or [],
            "limit": limit,
        }
        try:
            payload = _export_server_state(
                server=server,
                database_id=database_id,
                tables=tables,
                where=where,
                limit=limit,
            )
            entry["status"] = "ok"
            entry["payload"] = payload
        except Exception as exc:
            err = f"snapshot export failed on {server}: {exc}"
            entry["status"] = "error"
            entry["error"] = str(exc)
            out["errors"].append(err)
        out["servers"][server] = entry
    return out


def _clear_agent_session_memory(
    *,
    agent_base_url: str,
    session_id: str,
) -> Dict[str, Any]:
    clear_url = f"{agent_base_url.rstrip('/')}/v1/agent/sessions/clear"
    return _post_json(clear_url, {"session_id": session_id}, timeout=60)


def _build_task_for_judge(
    *,
    batch: Dict[str, Any],
    batch_entry: Dict[str, Any],
    batch_idx: int,
) -> Dict[str, Any]:
    task_for_judge = copy.deepcopy(batch.get("_raw_task_for_judge", {}))
    if not isinstance(task_for_judge, dict):
        task_for_judge = {}
    task_for_judge.setdefault("task_id", batch_entry.get("task_id"))
    raw_subtasks = task_for_judge.get("sub_task_list")
    if isinstance(raw_subtasks, list):
        spec_subtasks = batch.get("subtasks", [])
        for idx, sub in enumerate(raw_subtasks):
            if not isinstance(sub, dict):
                continue
            if "sub_task_id" not in sub:
                fallback_sub_id = ""
                if isinstance(spec_subtasks, list) and idx < len(spec_subtasks) and isinstance(spec_subtasks[idx], dict):
                    fallback_sub_id = str(spec_subtasks[idx].get("sub_task_id", "")).strip()
                sub["sub_task_id"] = fallback_sub_id or f"{task_for_judge.get('task_id', batch_entry.get('task_id', f'task_{batch_idx}'))}_{idx+1}"
    return task_for_judge


def _judge_single_subtask_passed(
    *,
    evaluate_benchmark_fn: Callable[..., Any],
    batch: Dict[str, Any],
    batch_entry: Dict[str, Any],
    task_entry: Dict[str, Any],
    batch_idx: int,
    args: argparse.Namespace,
) -> Dict[str, Any]:
    task_for_judge = _build_task_for_judge(
        batch=batch,
        batch_entry=batch_entry,
        batch_idx=batch_idx,
    )
    mini_batch_entry = {
        "task_id": batch_entry.get("task_id"),
        "session_id": batch_entry.get("session_id"),
        "task_results": [copy.deepcopy(task_entry)],
        "canonical_diff": copy.deepcopy(batch_entry.get("canonical_diff", {})),
    }
    judge_result = evaluate_benchmark_fn(
        tasks_data=[task_for_judge],
        bench_data={"batch_results": [mini_batch_entry]},
        judge_models=args.judge_model,
        openai_base_url=os.getenv("JUDGE_OPENAI_BASE_URL"),
        openai_api_key=os.getenv("JUDGE_OPENAI_API_KEY"),
        timeout_seconds=max(1, int(args.judge_timeout_seconds)),
    )
    task_judge = (
        judge_result.get("tasks", [{}])[0]
        if isinstance(judge_result, dict) and isinstance(judge_result.get("tasks"), list) and judge_result.get("tasks")
        else {}
    )
    subtask_judge = (
        task_judge.get("subtasks", [{}])[0]
        if isinstance(task_judge, dict) and isinstance(task_judge.get("subtasks"), list) and task_judge.get("subtasks")
        else {}
    )
    return {
        "passed": bool(subtask_judge.get("passed")) if isinstance(subtask_judge, dict) else False,
        "judge_task": task_judge if isinstance(task_judge, dict) else {},
        "judge_subtask": subtask_judge if isinstance(subtask_judge, dict) else {},
    }


def _build_skipped_subtask_entry(
    *,
    batch_idx: int,
    session_id: str,
    spec: Dict[str, Any],
    sub_idx: int,
    agent_url_map: Dict[str, str],
    reason: str,
) -> Dict[str, Any]:
    task = spec["task"]
    target_agent = spec["target_agent"]
    subtask_index = _safe_int(spec.get("subtask_index"), sub_idx)
    sub_task_id = str(spec.get("sub_task_id", f"task_{batch_idx}_{sub_idx}"))
    task_url = _resolve_task_url(
        target_agent=target_agent,
        agent_url_map=agent_url_map,
    )
    return {
        "subtask_index": subtask_index,
        "sub_task_id": sub_task_id,
        "request_id": "",
        "task": task,
        "target_agent": target_agent,
        "task_url": task_url,
        "request_payload": {},
        "request_sent_at": "",
        "response_received_at": "",
        "duration_ms": None,
        "http_status_code": None,
        "response_headers": {},
        "raw_response": {},
        "agent_status": "skipped",
        "agent_handled_by": "",
        "agent_api_version": "",
        "agent_recursion": {},
        "subtask_result": "",
        "error": "",
        "embedded_error": None,
        "request_trace_scope": {
            "session_id": session_id,
            "request_id": "",
        },
        "all_agent_traces": {},
        "request_error": "",
        "request_exception_type": "",
        "timeout_recovery": {
            "timed_out": False,
            "recovered": False,
        },
        "flow_error": reason,
        "skipped_due_to_prior_failure": True,
        "skip_reason": reason,
    }


def _record_subtask_failure(
    *,
    batch_errors: List[str],
    batch_entry: Dict[str, Any],
    task_entry: Dict[str, Any],
    message: str,
    sub_idx: int,
    report_error: bool = True,
) -> Tuple[bool, str, int]:
    if report_error:
        batch_errors.append(message)
    task_entry["flow_error"] = message
    batch_entry["task_results"].append(task_entry)
    return True, message, sub_idx


def _mark_all_subtasks_skipped(
    *,
    batch_idx: int,
    batch: Dict[str, Any],
    session_id: str,
    agent_url_map: Dict[str, str],
    batch_entry: Dict[str, Any],
    reason: str,
    state_diff_enabled: bool,
    seeded_db_ids: Dict[str, str],
) -> None:
    if batch_entry.get("task_results"):
        return
    for sub_idx, spec in enumerate(batch["subtasks"], start=1):
        skipped_entry = _build_skipped_subtask_entry(
            batch_idx=batch_idx,
            session_id=session_id,
            spec=spec,
            sub_idx=sub_idx,
            agent_url_map=agent_url_map,
            reason=reason,
        )
        skipped_entry["skipped_due_to_init_failure"] = True
        if state_diff_enabled and seeded_db_ids:
            skipped_entry["subtask_canonical_diff"] = {}
        batch_entry["task_results"].append(skipped_entry)


def _summarize_inline_judge_votes(agents: List[Dict[str, Any]]) -> Tuple[int, int, int]:
    input_tokens = 0
    output_tokens = 0
    total_tokens = 0
    for agent in agents:
        if not isinstance(agent, dict):
            continue
        votes = agent.get("votes", [])
        if not isinstance(votes, list):
            continue
        for vote in votes:
            if not isinstance(vote, dict):
                continue
            input_tokens += _safe_int(vote.get("input_tokens"), 0)
            output_tokens += _safe_int(vote.get("output_tokens"), 0)
            total_tokens += _safe_int(vote.get("total_tokens"), 0)
    return input_tokens, output_tokens, total_tokens


def _build_final_task_judge(
    *,
    batch: Dict[str, Any],
    batch_entry: Dict[str, Any],
) -> Dict[str, Any]:
    spec_subtasks = batch.get("subtasks", [])
    task_results = batch_entry.get("task_results", [])
    if not isinstance(spec_subtasks, list):
        spec_subtasks = []
    if not isinstance(task_results, list):
        task_results = []

    subtask_reports: List[Dict[str, Any]] = []
    subtask_pass_count = 0
    agent_eval_count = 0
    agent_pass_count = 0
    judge_input_tokens = 0
    judge_output_tokens = 0
    judge_total_tokens = 0

    for idx, task_entry in enumerate(task_results):
        if not isinstance(task_entry, dict):
            continue
        spec = spec_subtasks[idx] if idx < len(spec_subtasks) and isinstance(spec_subtasks[idx], dict) else {}
        user_prompt = str(spec.get("task", task_entry.get("task", "")))
        beginning_agent = str(spec.get("target_agent", task_entry.get("target_agent", "")))
        inline_judge = task_entry.get("inline_judge")

        if isinstance(inline_judge, dict) and isinstance(inline_judge.get("judge_subtask"), dict):
            subtask_report = copy.deepcopy(inline_judge["judge_subtask"])
        else:
            subtask_report = {
                "sub_task_id": task_entry.get("sub_task_id"),
                "passed": False,
                "evaluated_agent_count": 0,
                "agents": [],
            }
            if _safe_int(task_entry.get("subtask_index"), 0) > 0:
                subtask_report["subtask_index"] = _safe_int(task_entry.get("subtask_index"), 0)
            if _safe_int(task_entry.get("subtask_index"), 0) <= 0 and idx >= 0:
                subtask_report["subtask_index"] = idx + 1
            if _to_bool(task_entry.get("skipped_due_to_prior_failure"), default=False):
                subtask_report["skipped"] = True
                subtask_report["skip_reason"] = str(task_entry.get("skip_reason", "")).strip()
            failure_reason = str(task_entry.get("flow_error", "")).strip()
            if failure_reason:
                subtask_report["failure_reason"] = failure_reason

        subtask_report["task_description"] = {
            "user_prompt": user_prompt,
            "beginning_agent": beginning_agent,
        }

        agents = subtask_report.get("agents", [])
        if not isinstance(agents, list):
            agents = []
            subtask_report["agents"] = agents
        if bool(subtask_report.get("passed")):
            subtask_pass_count += 1
        agent_eval_count += len(agents)
        agent_pass_count += sum(1 for agent in agents if isinstance(agent, dict) and bool(agent.get("passed")))
        sub_in, sub_out, sub_total = _summarize_inline_judge_votes(agents)
        judge_input_tokens += sub_in
        judge_output_tokens += sub_out
        judge_total_tokens += sub_total
        subtask_reports.append(subtask_report)

    task_passed = bool(subtask_reports) and all(bool(item.get("passed")) for item in subtask_reports)
    if not subtask_reports:
        task_passed = False

    return {
        "summary": {
            "subtask_count": len(subtask_reports),
            "subtask_pass_count": subtask_pass_count,
            "agent_eval_count": agent_eval_count,
            "agent_pass_count": agent_pass_count,
            "agent_pass_rate": (agent_pass_count / agent_eval_count) if agent_eval_count else 0.0,
            "judge_input_tokens": judge_input_tokens,
            "judge_output_tokens": judge_output_tokens,
            "judge_total_tokens": judge_total_tokens,
        },
        "task": {
            "task_id": batch_entry.get("task_id"),
            "alignment_mode": "inline_subtask_and",
            "matched_task_id": batch_entry.get("task_id"),
            "passed": task_passed,
            "subtask_count": len(subtask_reports),
            "subtasks": subtask_reports,
        },
        "task_passed": task_passed,
    }


def _run_single_batch(
    *,
    batch_idx: int,
    batch: Dict[str, Any],
    session_id_prefix: str,
    servers: List[str],
    agent_url_map: Dict[str, str],
    args: argparse.Namespace,
    session_binding_store: RedisSessionBindingStore,
    canonical_ignore_fields: Set[str],
    evaluate_benchmark_fn: Callable[..., Any],
) -> Dict[str, Any]:
    session_id = f"{session_id_prefix}-{batch_idx}"
    active_servers = _infer_needed_servers_for_batch(
        batch=batch,
        requested_servers=servers,
    )
    seeded_db_ids: Dict[str, str] = {}
    batch_errors: List[str] = []
    batch_description = str(batch.get("description", "")).strip()
    state_export_spec = (
        batch.get("state_export")
        if isinstance(batch.get("state_export"), dict)
        else {}
    )
    initial_state_snapshot: Optional[Dict[str, Any]] = None
    final_state_snapshot: Optional[Dict[str, Any]] = None
    initial_canonical_snapshot: Optional[Dict[str, Any]] = None
    final_canonical_snapshot: Optional[Dict[str, Any]] = None
    batch_entry: Dict[str, Any] = {
        "task_id": batch.get("task_id"),
        "description": batch_description,
        "session_id": session_id,
        "seed_results": [],
        "task_results": [],
        "cleanup_results": [],
        "memory_clear_results": [],
        "errors": batch_errors,
        "subtask_count": len(batch["subtasks"]),
        "state_export_spec": state_export_spec,
        "requested_servers": list(servers),
        "active_servers": list(active_servers),
    }
    stop_remaining_subtasks = False
    stop_reason = ""
    stop_from_subtask_index = 0
    initialization_failed = False
    initialization_failure_reason = ""

    try:
        if not args.skip_seed:
            for server in active_servers:
                host_sql = _pick_default_sql_file(server)
                req_id = f"seed-direct-{batch_idx}-{server}-{int(time.time()*1000)}"
                seed_entry: Dict[str, Any] = {
                    "server": server,
                    "request_id": req_id,
                    "sql_file_host": host_sql,
                }
                try:
                    repos_tar_host = ""
                    if server == "gitea":
                        repos_tar_host = _pick_gitea_repos_tar_file(host_sql)
                        seed_entry["repos_tar_host"] = repos_tar_host
                    db_id = _seed_server_direct(
                        server,
                        host_sql,
                        repos_tar_host_path=repos_tar_host,
                    )
                    seeded_db_ids[server] = db_id
                    seed_entry["database_id"] = db_id
                    seed_entry["status"] = "ok"
                except (ToolExecutionError, Exception) as exc:
                    msg = f"batch#{batch_idx} seed failed on {server}: {exc}"
                    seed_entry["error"] = msg
                    batch_errors.append(msg)
                    batch_entry["seed_results"].append(seed_entry)
                    initialization_failed = True
                    initialization_failure_reason = msg
                    break
                batch_entry["seed_results"].append(seed_entry)

            if initialization_failed:
                _mark_all_subtasks_skipped(
                    batch_idx=batch_idx,
                    batch=batch,
                    session_id=session_id,
                    agent_url_map=agent_url_map,
                    batch_entry=batch_entry,
                    reason=initialization_failure_reason,
                    state_diff_enabled=bool(args.state_diff),
                    seeded_db_ids=seeded_db_ids,
                )
                stop_remaining_subtasks = True
                stop_reason = initialization_failure_reason
                stop_from_subtask_index = len(batch["subtasks"])

        if seeded_db_ids:
            session_binding_store.set_bindings(session_id, dict(seeded_db_ids))
            batch_entry["session_bindings_written"] = dict(seeded_db_ids)
        else:
            batch_entry["session_bindings_written"] = {}

        if initialization_failed:
            batch_entry["initialization_failed"] = True
            batch_entry["initialization_failure_reason"] = initialization_failure_reason

        if args.state_diff and seeded_db_ids and not initialization_failed:
            initial_state_snapshot = _capture_state_snapshot(
                seeded_db_ids=seeded_db_ids,
                state_export_spec=state_export_spec,
                default_limit=max(1, int(args.state_diff_default_limit)),
            )
            initial_canonical_snapshot = _canonicalize_snapshot(
                snapshot=initial_state_snapshot,
                ignore_fields=canonical_ignore_fields,
            )
            if args.state_diff_keep_snapshots:
                batch_entry["initial_state_snapshot"] = initial_state_snapshot
                batch_entry["initial_state_canonical"] = initial_canonical_snapshot

        for sub_idx, spec in enumerate(batch["subtasks"], start=1):
            if stop_remaining_subtasks:
                break
            task = spec["task"]
            target_agent = spec["target_agent"]
            subtask_index = _safe_int(spec.get("subtask_index"), sub_idx)
            sub_task_id = str(spec.get("sub_task_id", f"{batch.get('task_id', f'task_{batch_idx}')}_{sub_idx}"))
            task_url = _resolve_task_url(
                target_agent=target_agent,
                agent_url_map=agent_url_map,
            )
            req_id = f"task-{batch_idx}-{sub_idx}-{int(time.time()*1000)}"
            subtask_initial_state_snapshot: Optional[Dict[str, Any]] = None
            subtask_final_state_snapshot: Optional[Dict[str, Any]] = None
            subtask_initial_canonical_snapshot: Optional[Dict[str, Any]] = None
            subtask_final_canonical_snapshot: Optional[Dict[str, Any]] = None
            subtask_canonical_diff: Dict[str, Any] = {}
            subtask_state_diff_errors: List[str] = []
            if args.state_diff and seeded_db_ids:
                try:
                    subtask_initial_state_snapshot = _capture_state_snapshot(
                        seeded_db_ids=seeded_db_ids,
                        state_export_spec=state_export_spec,
                        default_limit=max(1, int(args.state_diff_default_limit)),
                    )
                    subtask_initial_canonical_snapshot = _canonicalize_snapshot(
                        snapshot=subtask_initial_state_snapshot,
                        ignore_fields=canonical_ignore_fields,
                    )
                except Exception as snapshot_exc:
                    msg = (
                        f"batch#{batch_idx} subtask#{sub_idx} initial state snapshot failed: "
                        f"{snapshot_exc}"
                    )
                    subtask_state_diff_errors.append(msg)
                    batch_errors.append(msg)
            traced = _task_request(
                task_url=task_url,
                request_id=req_id,
                target_agent=target_agent,
                task=task,
                session_id=session_id,
                max_depth=args.max_depth,
                timeout_seconds=args.task_timeout_seconds,
                benchmark_server_allowlist=active_servers,
            )
            resp_meta = traced.get("response", {}) if isinstance(traced, dict) else {}
            resp = resp_meta.get("response_body", {}) if isinstance(resp_meta, dict) else {}
            request_error = str(traced.get("request_error", "")).strip() if isinstance(traced, dict) else ""
            request_exception_type = (
                str(traced.get("request_exception_type", "")).strip()
                if isinstance(traced, dict)
                else ""
            )
            timeout_recovery: Dict[str, Any] = {
                "timed_out": False,
                "recovered": False,
            }
            if request_error and _is_timeout_error(request_error, request_exception_type):
                timeout_recovery["timed_out"] = True
                timeout_recovery["cancel_broadcast"] = _broadcast_cancel_request(
                    agent_url_map=agent_url_map,
                    session_id=session_id,
                    request_id=req_id,
                    reason="benchmark_request_timeout",
                )

            result_text = str(resp.get("result", "")) if isinstance(resp, dict) else ""
            timeout_cutoff_ts: Optional[float] = None
            timeout_cutoff_iso = ""
            if timeout_recovery.get("timed_out"):
                timeout_cutoff_iso = str(resp_meta.get("received_at", "")).strip()
                timeout_cutoff_ts = _iso_to_unix_seconds(timeout_cutoff_iso)
            try:
                all_agent_traces = _fetch_task_traces_from_all_agents(
                    session_id=session_id,
                    request_id=req_id,
                    agent_url_map=agent_url_map,
                )
                all_agent_traces = _trim_all_agent_traces_to_cutoff(
                    all_agent_traces,
                    timeout_cutoff_ts,
                )
            except Exception as trace_exc:
                all_agent_traces = {
                    "_trace_fetch_error": {
                        "status": "error",
                        "error": str(trace_exc),
                    }
                }
            if args.state_diff and seeded_db_ids:
                try:
                    subtask_final_state_snapshot = _capture_state_snapshot(
                        seeded_db_ids=seeded_db_ids,
                        state_export_spec=state_export_spec,
                        default_limit=max(1, int(args.state_diff_default_limit)),
                    )
                    subtask_final_canonical_snapshot = _canonicalize_snapshot(
                        snapshot=subtask_final_state_snapshot,
                        ignore_fields=canonical_ignore_fields,
                    )
                    if (
                        subtask_initial_canonical_snapshot is not None
                        and subtask_final_canonical_snapshot is not None
                    ):
                        subtask_canonical_diff = _diff_canonical_snapshots(
                            initial=subtask_initial_canonical_snapshot,
                            final=subtask_final_canonical_snapshot,
                            max_changes=max(1, int(args.state_diff_max_changes)),
                        )
                except Exception as snapshot_exc:
                    msg = (
                        f"batch#{batch_idx} subtask#{sub_idx} final state snapshot failed: "
                        f"{snapshot_exc}"
                    )
                    subtask_state_diff_errors.append(msg)
                    batch_errors.append(msg)
            resp_obj = resp if isinstance(resp, dict) else {}
            task_entry = {
                "subtask_index": subtask_index,
                "sub_task_id": sub_task_id,
                "request_id": req_id,
                "task": task,
                "target_agent": target_agent,
                "task_url": task_url,
                "request_payload": traced.get("request_payload", {}),
                "request_sent_at": resp_meta.get("sent_at", ""),
                "response_received_at": resp_meta.get("received_at", ""),
                "duration_ms": resp_meta.get("duration_ms"),
                "http_status_code": resp_meta.get("status_code"),
                "response_headers": resp_meta.get("response_headers", {}),
                "raw_response": resp_obj,
                "agent_status": resp_obj.get("status", ""),
                "agent_handled_by": resp_obj.get("handled_by", ""),
                "agent_api_version": resp_obj.get("api_version", ""),
                "agent_recursion": resp_obj.get("recursion", {}),
                "subtask_result": result_text,
                "error": resp_obj.get("error", ""),
                "embedded_error": _extract_embedded_error(result_text),
                "request_trace_scope": {
                    "session_id": session_id,
                    "request_id": req_id,
                },
                "all_agent_traces": all_agent_traces,
                "request_error": request_error,
                "request_exception_type": request_exception_type,
                "request_error_status_code": traced.get("request_error_status_code"),
                "request_error_response_headers": traced.get("request_error_response_headers", {}),
                "request_error_response_body": traced.get("request_error_response_body", {}),
                "request_error_response_text": traced.get("request_error_response_text", ""),
                "timeout_recovery": timeout_recovery,
            }
            if args.state_diff and seeded_db_ids:
                task_entry["subtask_canonical_diff"] = subtask_canonical_diff
                if subtask_state_diff_errors:
                    task_entry["subtask_state_diff_errors"] = list(subtask_state_diff_errors)
                if args.state_diff_keep_snapshots:
                    task_entry["subtask_initial_state_snapshot"] = subtask_initial_state_snapshot
                    task_entry["subtask_initial_state_canonical"] = subtask_initial_canonical_snapshot
                    task_entry["subtask_final_state_snapshot"] = subtask_final_state_snapshot
                    task_entry["subtask_final_state_canonical"] = subtask_final_canonical_snapshot
            if timeout_recovery.get("timed_out"):
                task_entry["timeout_cutoff_at"] = timeout_cutoff_iso
                task_entry["completed_steps_before_timeout"] = _collect_completed_steps_before_cutoff(
                    all_agent_traces,
                    timeout_cutoff_ts,
                )
            if request_error:
                msg = (
                    f"batch#{batch_idx} subtask#{sub_idx} request failed: "
                    f"{request_exception_type or 'Error'}: {request_error}"
                )
                stop_remaining_subtasks, stop_reason, stop_from_subtask_index = _record_subtask_failure(
                    batch_errors=batch_errors,
                    batch_entry=batch_entry,
                    task_entry=task_entry,
                    message=msg,
                    sub_idx=sub_idx,
                )
                continue
            if resp_obj.get("status") != "ok":
                msg = (
                    f"batch#{batch_idx} subtask#{sub_idx} failed: "
                    f"agent status={resp_obj.get('status')}"
                )
                stop_remaining_subtasks, stop_reason, stop_from_subtask_index = _record_subtask_failure(
                    batch_errors=batch_errors,
                    batch_entry=batch_entry,
                    task_entry=task_entry,
                    message=msg,
                    sub_idx=sub_idx,
                )
                continue

            inline_judge_error = ""
            try:
                inline_judge = _judge_single_subtask_passed(
                    evaluate_benchmark_fn=evaluate_benchmark_fn,
                    batch=batch,
                    batch_entry=batch_entry,
                    task_entry=task_entry,
                    batch_idx=batch_idx,
                    args=args,
                )
                task_entry["inline_judge"] = inline_judge
                if inline_judge.get("passed") is False:
                    msg = (
                        f"batch#{batch_idx} subtask#{sub_idx} judged failed: "
                        f"sub_task_id={sub_task_id}"
                    )
                    stop_remaining_subtasks, stop_reason, stop_from_subtask_index = _record_subtask_failure(
                        batch_errors=batch_errors,
                        batch_entry=batch_entry,
                        task_entry=task_entry,
                        message=msg,
                        sub_idx=sub_idx,
                        report_error=False,
                    )
                    continue
            except Exception as judge_exc:
                inline_judge_error = str(judge_exc)
                task_entry["inline_judge_error"] = inline_judge_error
            batch_entry["task_results"].append(task_entry)

        if stop_remaining_subtasks:
            for skipped_sub_idx, skipped_spec in enumerate(batch["subtasks"][stop_from_subtask_index:], start=stop_from_subtask_index + 1):
                skipped_entry = _build_skipped_subtask_entry(
                    batch_idx=batch_idx,
                    session_id=session_id,
                    spec=skipped_spec,
                    sub_idx=skipped_sub_idx,
                    agent_url_map=agent_url_map,
                    reason=stop_reason or (
                        f"batch#{batch_idx} skipped because an earlier subtask failed"
                    ),
                )
                if args.state_diff and seeded_db_ids:
                    skipped_entry["subtask_canonical_diff"] = {}
                batch_entry["task_results"].append(skipped_entry)

        if args.state_diff and seeded_db_ids and not initialization_failed:
            final_state_snapshot = _capture_state_snapshot(
                seeded_db_ids=seeded_db_ids,
                state_export_spec=state_export_spec,
                default_limit=max(1, int(args.state_diff_default_limit)),
            )
            final_canonical_snapshot = _canonicalize_snapshot(
                snapshot=final_state_snapshot,
                ignore_fields=canonical_ignore_fields,
            )
            if args.state_diff_keep_snapshots:
                batch_entry["final_state_snapshot"] = final_state_snapshot
                batch_entry["final_state_canonical"] = final_canonical_snapshot
            if initial_canonical_snapshot is not None and final_canonical_snapshot is not None:
                batch_entry["canonical_diff"] = _diff_canonical_snapshots(
                    initial=initial_canonical_snapshot,
                    final=final_canonical_snapshot,
                    max_changes=max(1, int(args.state_diff_max_changes)),
                )
    except Exception as exc:
        batch_errors.append(str(exc))
    finally:
        if (
            args.state_diff
            and seeded_db_ids
            and not initialization_failed
            and final_state_snapshot is None
        ):
            try:
                final_state_snapshot = _capture_state_snapshot(
                    seeded_db_ids=seeded_db_ids,
                    state_export_spec=state_export_spec,
                    default_limit=max(1, int(args.state_diff_default_limit)),
                )
                final_canonical_snapshot = _canonicalize_snapshot(
                    snapshot=final_state_snapshot,
                    ignore_fields=canonical_ignore_fields,
                )
                if args.state_diff_keep_snapshots:
                    batch_entry["final_state_snapshot"] = final_state_snapshot
                    batch_entry["final_state_canonical"] = final_canonical_snapshot
                if initial_canonical_snapshot is not None and final_canonical_snapshot is not None:
                    batch_entry["canonical_diff"] = _diff_canonical_snapshots(
                        initial=initial_canonical_snapshot,
                        final=final_canonical_snapshot,
                        max_changes=max(1, int(args.state_diff_max_changes)),
                    )
            except Exception as snapshot_exc:
                msg = f"batch#{batch_idx} final state snapshot failed: {snapshot_exc}"
                batch_errors.append(msg)

        if not args.skip_cleanup:
            session_scoped_bindings = session_binding_store.get_bindings(session_id)
            batch_entry["session_bindings_before_cleanup"] = dict(session_scoped_bindings)
            cleanup_targets = dict(session_scoped_bindings)
            for server, db_id in seeded_db_ids.items():
                cleanup_targets.setdefault(server, db_id)

            for server, db_id in cleanup_targets.items():
                req_id = f"cleanup-{batch_idx}-{server}-{int(time.time()*1000)}"
                cleanup_entry = {
                    "server": server,
                    "database_id": db_id,
                    "request_id": req_id,
                }
                try:
                    result_obj = _cleanup_server_direct(server, db_id)
                    cleanup_entry["status"] = "ok"
                    cleanup_entry["raw_result"] = json.dumps(result_obj, ensure_ascii=False)
                    err = (
                        str(result_obj.get("error", "")).strip()
                        if isinstance(result_obj, dict)
                        else ""
                    )
                    if err:
                        cleanup_entry["error"] = err
                except (ToolExecutionError, Exception) as exc:
                    cleanup_entry["status"] = "error"
                    cleanup_entry["error"] = str(exc)
                    batch_errors.append(
                        f"batch#{batch_idx} cleanup failed on {server}: {exc}"
                    )
                batch_entry["cleanup_results"].append(cleanup_entry)
            session_binding_store.clear_bindings(session_id)
            batch_entry["session_bindings_cleared"] = True
        else:
            batch_entry["session_bindings_cleared"] = False

        memory_clear_targets = sorted(set(agent_url_map.values()))
        for agent_base_url in memory_clear_targets:
            clear_entry: Dict[str, Any] = {
                "agent_base_url": agent_base_url,
                "session_id": session_id,
            }
            try:
                clear_resp = _clear_agent_session_memory(
                    agent_base_url=agent_base_url,
                    session_id=session_id,
                )
                clear_entry["status"] = str(clear_resp.get("status", "ok"))
                clear_entry["result"] = clear_resp
            except Exception as exc:
                clear_entry["status"] = "error"
                clear_entry["error"] = str(exc)
                batch_errors.append(
                    f"batch#{batch_idx} clear memory failed on {agent_base_url}: {exc}"
                )
            batch_entry["memory_clear_results"].append(clear_entry)

        if initialization_failed:
            batch_entry["status"] = "init_failed"
        else:
            batch_entry["status"] = "error" if batch_errors else "ok"

    judge_line: Dict[str, Any] = {
        "timestamp": _utc_now_iso(),
        "task_id": batch_entry.get("task_id"),
        "task_passed": 0,
    }
    if initialization_failed:
        judge_line["judge_skipped"] = True
        judge_line["judge_skip_reason"] = initialization_failure_reason
    else:
        final_task_judge = _build_final_task_judge(
            batch=batch,
            batch_entry=batch_entry,
        )
        judge_line["judge"] = {
            "summary": _compact_judge_summary_for_single_task(final_task_judge.get("summary", {})),
            "task": final_task_judge.get("task", {}),
        }
        judge_line["task_passed"] = 1 if bool(final_task_judge.get("task_passed")) else 0

    judge_line["runtime_summary"] = _build_runtime_summary(batch_entry)
    run_input_tokens, run_output_tokens, run_total_tokens, run_tokens_by_agent = _collect_run_tokens_from_batch_entry(batch_entry)
    judge_line["run_input_tokens"] = run_input_tokens
    judge_line["run_output_tokens"] = run_output_tokens
    judge_line["run_total_tokens"] = run_total_tokens
    judge_line["run_tokens_by_agent"] = run_tokens_by_agent

    return {
        "batch_idx": batch_idx,
        "batch_entry": batch_entry,
        "batch_errors": list(batch_errors),
        "judge_line": judge_line,
    }


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Benchmark flow: seed -> run tasks -> cleanup databases."
    )
    parser.add_argument(
        "--agent-url-map-json",
        default=os.getenv(
            "AGENT_URL_MAP_JSON",
            '{"it_service_desk_l1":"http://127.0.0.1:18001",'
            '"it_change_engineer":"http://127.0.0.1:18002",'
            '"hr_service_specialist":"http://127.0.0.1:18003",'
            '"customer_support_specialist":"http://127.0.0.1:18004",'
            '"knowledge_base_specialist":"http://127.0.0.1:18005",'
            '"collaboration_ops_specialist":"http://127.0.0.1:18006",'
            '"developer_engineer":"http://127.0.0.1:18007",'
            '"qa_test_engineer":"http://127.0.0.1:18008"}',
        ),
        help="Legacy fallback JSON map of agent->base URL for per-task routing.",
    )
    parser.add_argument(
        "--agent-url-map-file",
        default=os.getenv("AGENT_URL_MAP_FILE", str(ROOT / "config" / "agent_url_map.json")),
        help=(
            "Path to agent URL mapping JSON file. "
            "When set, this takes precedence over --agent-url-map-json."
        ),
    )
    parser.add_argument("--session-id", default="")
    parser.add_argument("--max-depth", type=int, default=3)
    parser.add_argument(
        "--task-timeout-seconds",
        type=int,
        default=int(os.getenv("TASK_TIMEOUT_SECONDS", "300")),
        help=(
            "Timeout for POST /v1/agent/tasks per subtask. "
            "Can also be set via TASK_TIMEOUT_SECONDS."
        ),
    )
    parser.add_argument(
        "--servers",
        nargs="*",
        default=None,
        help="Servers to seed/cleanup. Example: email hr",
    )
    parser.add_argument(
        "--endpoints-file",
        default=str(ROOT / "config" / "mcp_endpoints_export.json"),
        help="MCP endpoints config for direct seed/cleanup execute_tool calls.",
    )
    parser.add_argument(
        "--task-spec-json",
        action="append",
        default=[],
        help='Task spec JSON; can repeat. Example: {"task":"...","target_agent":"developer_engineer"}',
    )
    parser.add_argument(
        "--tasks-spec-file",
        default="",
        help=(
            "JSON/JSONL task spec file. Supports tasks_200_format/mul_mcp_5_format style "
            "({task_id,sub_task_list:[{sub_task_id,user_prompt,beginning_agent,ground_truth,...}]}) and "
            "legacy {task_list:[{task,target_agent}]} / {task,target_agent}."
        ),
    )
    parser.add_argument(
        "--sample-k",
        type=int,
        default=0,
        help=(
            "Randomly sample K task batches after loading task specs. "
            "0 means use all task batches."
        ),
    )
    parser.add_argument(
        "--sample-seed",
        type=int,
        default=None,
        help="Random seed used by --sample-k. Omit for non-deterministic sampling.",
    )
    parser.add_argument("--skip-seed", action="store_true")
    parser.add_argument("--skip-cleanup", action="store_true")
    parser.add_argument("--continue-on-error", action="store_true", default=True)
    parser.add_argument(
        "--batch-concurrency",
        type=int,
        default=int(os.getenv("BENCHMARK_BATCH_CONCURRENCY", "1")),
        help=(
            "How many task batches to run in parallel. "
            "Each batch uses an independent session_id, so this is the safest way to speed up the benchmark."
        ),
    )
    parser.add_argument(
        "--bench-result-jsonl",
        default="",
        help=(
            "Append one line per task with judge output + slim runtime summary. "
            "At startup, if this file already exists, it is also used for one-time resume filtering: "
            "rows with infra/judge anomalies are dropped, and only missing task_ids are run. "
            "Default: scripts/bench_result_<beijing time>.jsonl"
        ),
    )
    parser.add_argument(
        "--trajectory-run-jsonl",
        default="",
        help=(
            "Optional full-mode JSONL. When enabled, append one line per task with full runtime batch entry. "
            "Default: scripts/trajectory_run_<beijing time>.jsonl"
        ),
    )
    parser.add_argument(
        "--trajectory-full-mode",
        action="store_true",
        help="Enable full trajectory JSONL output.",
    )
    parser.add_argument(
        "--judge-model",
        action="append",
        default=[],
        help="Deprecated. Judge models must be provided via JUDGE_MODELS.",
    )
    parser.add_argument(
        "--judge-timeout-seconds",
        type=int,
        default=int(os.getenv("JUDGE_TIMEOUT_SECONDS", "120")),
        help=(
            "Timeout per model request when inline judging. "
            "Can also be set via JUDGE_TIMEOUT_SECONDS."
        ),
    )
    parser.add_argument(
        "--rejudge-concurrency",
        type=int,
        default=int(os.getenv("BENCHMARK_REJUDGE_CONCURRENCY", "16")),
        help=(
            "How many judge_model_error task_ids to rejudge in parallel when reusing existing bench results. "
            "Can also be set via BENCHMARK_REJUDGE_CONCURRENCY."
        ),
    )
    parser.add_argument(
        "--redis-url",
        default=os.getenv("REDIS_URL", "redis://127.0.0.1:6379/0"),
        help="Redis URL for session-scoped mcp_db_bindings persistence.",
    )
    parser.add_argument(
        "--session-bindings-prefix",
        default=os.getenv("AGENT_SESSION_BINDINGS_PREFIX", "company-agent:session-bindings"),
        help="Redis key prefix for session mcp_db_bindings.",
    )
    parser.add_argument(
        "--session-bindings-ttl-seconds",
        type=int,
        default=int(os.getenv("AGENT_SESSION_BINDINGS_TTL_SECONDS", "86400")),
        help="TTL for session mcp_db_bindings in Redis (0 means no expiration).",
    )
    parser.add_argument(
        "--state-diff",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="Capture initial/final DB state snapshots and output canonical diff. Default: enabled.",
    )
    parser.add_argument(
        "--state-diff-default-limit",
        type=int,
        default=2000,
        help="Default row limit for each server export_state request.",
    )
    parser.add_argument(
        "--state-diff-max-changes",
        type=int,
        default=200,
        help="Max inserted/deleted/updated examples per table in canonical diff output.",
    )
    parser.add_argument(
        "--state-diff-keep-snapshots",
        action="store_true",
        help=(
            "Keep initial/final snapshot and canonical snapshot payloads in report. "
            "By default only canonical_diff is written."
        ),
    )
    parser.add_argument(
        "--state-diff-ignore-fields",
        default="",
        help=(
            "Comma-separated extra field names ignored in canonicalization, "
            "e.g. updated_at,created_at,sys_updated_on."
        ),
    )
    args = parser.parse_args()
    if args.judge_model:
        print("`--judge-model` is no longer supported. Please set JUDGE_MODELS instead.")
        raise SystemExit(2)
    _require_judge_env_or_exit()
    ts = _beijing_ts()
    bench_result_jsonl_path = (
        Path(args.bench_result_jsonl)
        if str(args.bench_result_jsonl).strip()
        else (ROOT / "scripts" / f"bench_result_{ts}.jsonl")
    )
    trajectory_run_jsonl_path = (
        Path(args.trajectory_run_jsonl)
        if str(args.trajectory_run_jsonl).strip()
        else (ROOT / "scripts" / f"trajectory_run_{ts}.jsonl")
    )
    evaluate_benchmark_fn = _load_judge_evaluator()

    started = time.time()
    session_id_prefix = args.session_id.strip() or f"bench-{int(started)}"
    task_batches = _load_task_batches(
        task_specs_json=args.task_spec_json,
        tasks_spec_file=args.tasks_spec_file,
    )
    resume_filter_stats: Dict[str, Any] = {
        "enabled": True,
        "source_file": str(bench_result_jsonl_path),
        "source_file_exists": False,
        "rows": 0,
        "kept": 0,
        "dropped_abnormal": 0,
        "missing_task_id": 0,
        "task_batch_count_before_resume_filter": len(task_batches),
        "task_batch_count_after_resume_filter": len(task_batches),
        "skipped_existing_task_ids_count": 0,
    }
    (
        stable_task_ids,
        stable_stats,
        stable_rows,
        judge_error_task_ids,
        latest_judge_error_rows,
    ) = _load_stable_task_ids_from_result_jsonl(str(bench_result_jsonl_path))
    rejudge_stats: Dict[str, Any] = {
        "judge_model_error_task_count": len(judge_error_task_ids),
        "rejudge_attempted": 0,
        "rejudge_succeeded": 0,
        "rejudge_failed": 0,
        "missing_task_spec": 0,
        "missing_trajectory": 0,
        "rejudge_concurrency": max(1, int(args.rejudge_concurrency)),
    }
    if judge_error_task_ids:
        print(
            f"[rejudge] detected judge_model_error task_ids={len(judge_error_task_ids)}",
            flush=True,
        )
        trajectory_for_rejudge = _infer_paired_trajectory_path_from_result_path(bench_result_jsonl_path)
        print(
            f"[rejudge] paired trajectory path={trajectory_for_rejudge if trajectory_for_rejudge else '<none>'}",
            flush=True,
        )
        task_batch_by_id: Dict[str, Dict[str, Any]] = {}
        for i, batch in enumerate(task_batches, start=1):
            task_id = str(batch.get("task_id", "")).strip()
            if not task_id:
                continue
            task_batch_by_id[task_id] = _build_task_for_judge_from_batch(batch, i)
        if isinstance(trajectory_for_rejudge, Path) and trajectory_for_rejudge.exists():
            print("[rejudge] start", flush=True)
            trajectory_batch_by_task_id = _load_latest_trajectory_batch_entries(trajectory_for_rejudge)
            rejudge_task_ids = sorted(judge_error_task_ids)
            rejudge_stats["rejudge_attempted"] = len(rejudge_task_ids)
            rejudge_total = len(rejudge_task_ids)
            rejudge_concurrency = max(1, min(int(args.rejudge_concurrency), rejudge_total))

            def _run_single_rejudge(task_id: str) -> Dict[str, Any]:
                task_obj = task_batch_by_id.get(task_id)
                if not isinstance(task_obj, dict):
                    return {"task_id": task_id, "status": "missing_task_spec"}
                batch_entry = trajectory_batch_by_task_id.get(task_id)
                if not isinstance(batch_entry, dict):
                    return {"task_id": task_id, "status": "missing_trajectory"}
                judge_result = evaluate_benchmark_fn(
                    tasks_data=[task_obj],
                    bench_data={"batch_results": [batch_entry]},
                    judge_models=args.judge_model,
                    openai_base_url=os.getenv("JUDGE_OPENAI_BASE_URL"),
                    openai_api_key=os.getenv("JUDGE_OPENAI_API_KEY"),
                    timeout_seconds=max(1, int(args.judge_timeout_seconds)),
                )
                task_judge = (
                    judge_result.get("tasks", [{}])[0]
                    if isinstance(judge_result, dict)
                    and isinstance(judge_result.get("tasks"), list)
                    and judge_result.get("tasks")
                    and isinstance(judge_result.get("tasks")[0], dict)
                    else {}
                )
                if not task_judge:
                    raise RuntimeError("empty_task_judge")
                line = _build_judge_line_from_task_judge(
                    task_id=task_id,
                    task_judge=task_judge,
                    batch_entry=batch_entry,
                )
                return {"task_id": task_id, "status": "success", "line": line}

            print(
                f"[rejudge] parallel start: total={rejudge_total} concurrency={rejudge_concurrency}",
                flush=True,
            )
            completed = 0
            with ThreadPoolExecutor(max_workers=rejudge_concurrency) as executor:
                futures = {
                    executor.submit(_run_single_rejudge, task_id): task_id
                    for task_id in rejudge_task_ids
                }
                for future in as_completed(futures):
                    task_id = futures[future]
                    completed += 1
                    print(
                        f"[rejudge] ({completed}/{rejudge_total}) task_id={task_id}",
                        flush=True,
                    )
                    try:
                        result = future.result()
                        status = str(result.get("status", ""))
                        if status == "success":
                            line = result.get("line")
                            if isinstance(line, dict):
                                stable_rows.append(line)
                                stable_task_ids.add(task_id)
                            rejudge_stats["rejudge_succeeded"] += 1
                            print(
                                f"[rejudge] task_id={task_id} success: replaced old row",
                                flush=True,
                            )
                        elif status == "missing_task_spec":
                            rejudge_stats["missing_task_spec"] += 1
                            rejudge_stats["rejudge_failed"] += 1
                            preserved = latest_judge_error_rows.get(task_id)
                            if isinstance(preserved, dict):
                                stable_rows.append(copy.deepcopy(preserved))
                                stable_task_ids.add(task_id)
                            print(
                                f"[rejudge] task_id={task_id} failed: missing task spec, keep old judge_model_error row and skip rerun",
                                flush=True,
                            )
                        elif status == "missing_trajectory":
                            rejudge_stats["missing_trajectory"] += 1
                            rejudge_stats["rejudge_failed"] += 1
                            preserved = latest_judge_error_rows.get(task_id)
                            if isinstance(preserved, dict):
                                stable_rows.append(copy.deepcopy(preserved))
                                stable_task_ids.add(task_id)
                            print(
                                f"[rejudge] task_id={task_id} failed: missing trajectory batch, keep old judge_model_error row and skip rerun",
                                flush=True,
                            )
                        else:
                            raise RuntimeError(f"unknown_rejudge_status={status}")
                    except Exception as exc:
                        rejudge_stats["rejudge_failed"] += 1
                        preserved = latest_judge_error_rows.get(task_id)
                        if isinstance(preserved, dict):
                            stable_rows.append(copy.deepcopy(preserved))
                            stable_task_ids.add(task_id)
                        print(
                            f"[rejudge] task_id={task_id} failed: {exc} ; keep old judge_model_error row and skip rerun",
                            flush=True,
                        )
        else:
            # Paired trajectory file is missing: skip rejudge and keep these rows.
            print(
                "[rejudge] skip: paired trajectory file not found, keep old judge_model_error rows and skip rerun",
                flush=True,
            )
            for task_id in sorted(judge_error_task_ids):
                preserved = latest_judge_error_rows.get(task_id)
                if isinstance(preserved, dict):
                    stable_rows.append(copy.deepcopy(preserved))
                    stable_task_ids.add(task_id)

        stable_rows.sort(key=lambda r: _row_sort_key_for_latest(r, 0))
        _write_jsonl_rows(bench_result_jsonl_path, stable_rows)
        print(
            "[rejudge] done: "
            f"attempted={rejudge_stats['rejudge_attempted']} "
            f"succeeded={rejudge_stats['rejudge_succeeded']} "
            f"failed={rejudge_stats['rejudge_failed']} "
            "failed_rows_kept=yes failed_tasks_will_rerun=no",
            flush=True,
        )
    else:
        # No judge re-evaluation path; still flush startup pruning results.
        stable_rows.sort(key=lambda r: _row_sort_key_for_latest(r, 0))
        if stable_stats.get("file_exists", False) and (
            int(stable_stats.get("dropped_abnormal", 0)) > 0
            or int(stable_stats.get("dropped_dedup", 0)) > 0
        ):
            _write_jsonl_rows(bench_result_jsonl_path, stable_rows)
            print(
                "[resume-filter] pruned existing result file: "
                f"kept={len(stable_rows)} "
                f"dropped_abnormal={int(stable_stats.get('dropped_abnormal', 0))} "
                f"dropped_dedup={int(stable_stats.get('dropped_dedup', 0))}",
                flush=True,
            )
    before_filter = len(task_batches)
    if stable_task_ids:
        task_batches = [
            batch
            for batch in task_batches
            if str(batch.get("task_id", "")).strip() not in stable_task_ids
        ]
    resume_filter_stats = {
        "enabled": True,
        "source_file": str(bench_result_jsonl_path),
        "source_file_exists": bool(stable_stats.get("file_exists", False)),
        "rows": int(stable_stats.get("rows", 0)),
        "kept": int(stable_stats.get("kept", 0)),
        "dropped_abnormal": int(stable_stats.get("dropped_abnormal", 0)),
        "judge_model_error_rows": int(stable_stats.get("judge_model_error_rows", 0)),
        "dropped_dedup": int(stable_stats.get("dropped_dedup", 0)),
        "pruned_rows_written": int(stable_stats.get("pruned_rows_written", 0)),
        "missing_task_id": int(stable_stats.get("missing_task_id", 0)),
        "task_batch_count_before_resume_filter": before_filter,
        "task_batch_count_after_resume_filter": len(task_batches),
        "skipped_existing_task_ids_count": before_filter - len(task_batches),
        "rejudge": rejudge_stats,
    }
    if args.sample_k < 0:
        raise ValueError("--sample-k must be >= 0")
    sampled_batch_indices: List[int] = []
    task_batch_count_before_sampling = len(task_batches)
    if args.sample_k > 0 and task_batches:
        k = min(int(args.sample_k), len(task_batches))
        rng = random.Random(args.sample_seed)
        sampled_batch_indices = sorted(rng.sample(range(len(task_batches)), k))
        task_batches = [task_batches[i] for i in sampled_batch_indices]
    agent_url_map = _load_json_mapping(
        mapping_file=args.agent_url_map_file,
        mapping_json=args.agent_url_map_json,
        name="agent-url-map-json",
    )
    servers: List[str] = list(args.servers or DEFAULT_SERVERS)
    extra_ignored_fields = {
        x.strip().lower()
        for x in str(args.state_diff_ignore_fields or "").split(",")
        if x.strip()
    }
    canonical_ignore_fields = set(DEFAULT_STATE_DIFF_IGNORE_FIELDS) | extra_ignored_fields

    report: Dict[str, Any] = {
        "status": "ok",
        "session_id_prefix": session_id_prefix,
        "servers": servers,
        "agent_url_map": agent_url_map,
        "agent_url_map_file": args.agent_url_map_file,
        "batch_results": [],
        "errors": [],
        "seed_mode": "direct_execute_tool",
        "task_batch_count": len(task_batches),
        "task_batch_count_before_sampling": task_batch_count_before_sampling,
        "sample_k": int(args.sample_k),
        "sample_seed": args.sample_seed,
        "sampled_batch_indices": sampled_batch_indices,
        "batch_concurrency": max(1, int(args.batch_concurrency)),
        "session_bindings_store": "redis",
        "state_diff_enabled": bool(args.state_diff),
        "state_diff_default_limit": int(max(1, args.state_diff_default_limit)),
        "state_diff_max_changes": int(max(1, args.state_diff_max_changes)),
        "state_diff_keep_snapshots": bool(args.state_diff_keep_snapshots),
        "state_diff_ignored_fields": sorted(canonical_ignore_fields),
        "bench_result_jsonl": str(bench_result_jsonl_path),
        "trajectory_full_mode": bool(args.trajectory_full_mode),
        "trajectory_run_jsonl": str(trajectory_run_jsonl_path) if args.trajectory_full_mode else "",
        "resume_filter": resume_filter_stats,
    }

    if not args.redis_url.strip():
        raise ValueError("--redis-url (or REDIS_URL) is required for session mcp_db_bindings mode")
    session_binding_store = RedisSessionBindingStore(
        redis_url=args.redis_url.strip(),
        key_prefix=args.session_bindings_prefix,
        ttl_seconds=args.session_bindings_ttl_seconds,
    )
    session_binding_store.client.ping()

    try:
        os.environ["MCP_ENDPOINTS_FILE"] = args.endpoints_file
        os.environ["GITEA_ISOLATION_REDIS_URL"] = args.redis_url.strip()
        effective_batch_concurrency = max(1, int(args.batch_concurrency))
        if effective_batch_concurrency > 1 and not args.continue_on_error:
            effective_batch_concurrency = 1
        report["effective_batch_concurrency"] = effective_batch_concurrency

        indexed_batch_results: Dict[int, Dict[str, Any]] = {}

        def _handle_completed_batch(result: Dict[str, Any]) -> None:
            batch_idx = int(result.get("batch_idx", 0))
            indexed_batch_results[batch_idx] = result
            batch_errors = result.get("batch_errors", [])
            if isinstance(batch_errors, list) and batch_errors:
                report["errors"].extend(str(item) for item in batch_errors)
                report["status"] = "error"
            judge_line = result.get("judge_line")
            if isinstance(judge_line, dict):
                _append_jsonl(bench_result_jsonl_path, judge_line)
            if args.trajectory_full_mode:
                batch_entry = result.get("batch_entry", {})
                if isinstance(batch_entry, dict):
                    _append_jsonl(
                        trajectory_run_jsonl_path,
                        {
                            "timestamp": _utc_now_iso(),
                            "task_id": batch_entry.get("task_id"),
                            "batch_entry": batch_entry,
                        },
                    )

        if effective_batch_concurrency == 1 or not task_batches:
            for batch_idx, batch in enumerate(task_batches, start=1):
                result = _run_single_batch(
                    batch_idx=batch_idx,
                    batch=batch,
                    session_id_prefix=session_id_prefix,
                    servers=servers,
                    agent_url_map=agent_url_map,
                    args=args,
                    session_binding_store=session_binding_store,
                    canonical_ignore_fields=canonical_ignore_fields,
                    evaluate_benchmark_fn=evaluate_benchmark_fn,
                )
                _handle_completed_batch(result)
                if result.get("batch_errors") and not args.continue_on_error:
                    break
        else:
            max_workers = min(effective_batch_concurrency, len(task_batches))
            with ThreadPoolExecutor(max_workers=max_workers) as executor:
                future_map = {
                    executor.submit(
                        _run_single_batch,
                        batch_idx=batch_idx,
                        batch=batch,
                        session_id_prefix=session_id_prefix,
                        servers=servers,
                        agent_url_map=agent_url_map,
                        args=args,
                        session_binding_store=session_binding_store,
                        canonical_ignore_fields=canonical_ignore_fields,
                        evaluate_benchmark_fn=evaluate_benchmark_fn,
                    ): batch_idx
                    for batch_idx, batch in enumerate(task_batches, start=1)
                }
                for future in as_completed(future_map):
                    batch_idx = future_map[future]
                    try:
                        result = future.result()
                    except Exception as exc:
                        result = {
                            "batch_idx": batch_idx,
                            "batch_entry": {
                                "task_id": task_batches[batch_idx - 1].get("task_id"),
                                "session_id": f"{session_id_prefix}-{batch_idx}",
                                "errors": [str(exc)],
                                "status": "error",
                            },
                            "batch_errors": [str(exc)],
                            "judge_line": {
                                "timestamp": _utc_now_iso(),
                                "task_id": task_batches[batch_idx - 1].get("task_id"),
                                "task_passed": 0,
                                "judge_error": str(exc),
                            },
                        }
                    _handle_completed_batch(result)

        report["batch_results"] = [
            indexed_batch_results[idx]["batch_entry"]
            for idx in sorted(indexed_batch_results)
        ]

    except Exception as exc:
        report["status"] = "error"
        report["errors"].append(str(exc))
    finally:
        report["duration_seconds"] = round(time.time() - started, 3)

    print(
        json.dumps(
            {
                "status": report.get("status"),
                "task_batch_count": report.get("task_batch_count"),
                "errors": report.get("errors", []),
                "duration_seconds": report.get("duration_seconds"),
            },
            ensure_ascii=False,
            indent=2,
        )
    )
    print(f"Saved incremental judge jsonl: {bench_result_jsonl_path}")
    if args.trajectory_full_mode:
        print(f"Saved full trajectory jsonl: {trajectory_run_jsonl_path}")
    if report["status"] != "ok":
        raise SystemExit(2)


if __name__ == "__main__":
    main()
