from __future__ import annotations

import argparse
import contextvars
import copy
import json
import logging
import os
import re
import time
import uuid
from datetime import datetime
from pathlib import Path
from dataclasses import dataclass, field, asdict
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from threading import Lock
from typing import Any, Callable, Dict, Iterable, List, Optional, Tuple
from urllib import error as urlerror
from urllib import request as urlrequest

from langchain.agents import create_agent
from langchain.agents.middleware import SummarizationMiddleware
from langchain_core.tools import tool
from langchain_openai import ChatOpenAI
from langgraph.checkpoint.memory import InMemorySaver

from api_schema import (
    AgentTaskRequest,
    ContractError,
    RecursionMeta,
    build_error_response,
    build_success_response,
    get_contract_schema,
    parse_task_request,
    parse_task_response,
)
from tool.toolsets import get_agent_tools
from tool.tool_executor import (
    SERVER_REQUIRED_AUTH_HEADER,
    set_tool_runtime_context,
    reset_tool_runtime_context,
)
from session_store import (
    InMemorySessionBindingStore,
    RedisSessionBindingStore,
    SessionBindingStore,
)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s [%(name)s] %(message)s",
)
logger = logging.getLogger("company_agent")

# ── Verification pipeline (Stage 2 & Stage 5) ─────────────────────────────────
# Controlled entirely by VERIFICATION_MODE env var — no code changes needed.
#   VERIFICATION_MODE=baseline        -> no intervention   (Phase 1)
#   VERIFICATION_MODE=stage2          -> Stage 2 only      (Phase 2)
#   VERIFICATION_MODE=stage2_stage5   -> Stage 2 + Stage 5 (Phase 3)
try:
    from my_verification.verification_pipeline import (
        check_stage2,
        check_stage5,
        get_metrics_summary,
        VERIFICATION_MODE as _VERIFICATION_MODE,
    )
    logger.info("[verification] loaded from my_verification.verification_pipeline mode=%s", _VERIFICATION_MODE)
except ImportError:
    # Fallback: my_verification not on path — run as baseline silently
    def check_stage2(*a, **kw): return None
    def check_stage5(*a, **kw): return None
    def get_metrics_summary(): return {"verification_mode": "baseline (import failed)"}
    _VERIFICATION_MODE = "baseline"
    logger.warning("[verification] my_verification.verification_pipeline not found — running as baseline")

SCHEMA_TOOL_NAME_RE = re.compile(r"^mcp_[a-z0-9_]+_(list_tools|get_tool_schema)$")
WORKSPACE_READ_TOOL_NAME_RE = re.compile(r"(^|[_\.])workspace_read_file$")


def _normalize_chat_model_name(model_name: str) -> str:
    """Strip provider prefixes like `openai:` for OpenAI-compatible endpoints (e.g. vLLM)."""
    raw = str(model_name or "").strip()
    if not raw:
        return raw
    for prefix in ("openai:",):
        if raw.lower().startswith(prefix):
            candidate = raw[len(prefix):].strip()
            if candidate:
                return candidate
    return raw


def _env_flag(name: str, default: bool = False) -> bool:
    raw = os.getenv(name)
    if raw is None:
        return default
    return str(raw).strip().lower() in {"1", "true", "yes", "on"}


def _build_llm_extra_body(model_name: str) -> Dict[str, Any]:
    extra_body: Dict[str, Any] = {}
    model_lower = str(model_name or "").strip().lower()
    # DeepSeek thinking mode requires round-tripping reasoning content across turns.
    # Current LangChain message conversion may not preserve that provider-specific field.
    # Disabling thinking avoids 400: "reasoning_content ... must be passed back".
    is_deepseek_model = model_lower.startswith("deepseek-") or model_lower.startswith("deepseek/")
    if is_deepseek_model and _env_flag("AGENT_DISABLE_DEEPSEEK_THINKING", default=True):
        extra_body["thinking"] = {"type": "disabled"}
    return extra_body


def _is_schema_tool_message(msg: Any) -> bool:
    if not isinstance(msg, dict):
        return False
    role = str(msg.get("role") or msg.get("type") or msg.get("kind") or "").lower()
    if role != "tool":
        return False
    name = str(msg.get("name") or "").strip()
    return bool(SCHEMA_TOOL_NAME_RE.match(name))


def _is_workspace_read_tool_message(msg: Any) -> bool:
    if not isinstance(msg, dict):
        return False
    role = str(msg.get("role") or msg.get("type") or msg.get("kind") or "").lower()
    if role != "tool":
        return False
    name = str(msg.get("name") or "").strip()
    return bool(WORKSPACE_READ_TOOL_NAME_RE.search(name))


def _parse_tool_call_arguments(raw: Any) -> Dict[str, Any]:
    if isinstance(raw, dict):
        return raw
    if isinstance(raw, str):
        text = raw.strip()
        if not text:
            return {}
        try:
            obj = json.loads(text)
            if isinstance(obj, dict):
                return obj
        except Exception:
            return {}
    return {}


def _collect_workspace_read_bindings_from_message(
    msg: Dict[str, Any],
    *,
    by_tool_call_id: Dict[str, str],
) -> None:
    def _scan_tool_calls(tool_calls: Any) -> None:
        if not isinstance(tool_calls, list):
            return
        for tool_call in tool_calls:
            if not isinstance(tool_call, dict):
                continue
            tool_call_id = str(
                tool_call.get("id")
                or tool_call.get("tool_call_id")
                or ""
            ).strip()
            tool_name = str(tool_call.get("name") or "").strip()
            raw_args: Any = tool_call.get("args")
            fn = tool_call.get("function")
            if isinstance(fn, dict):
                tool_name = tool_name or str(fn.get("name") or "").strip()
                raw_args = fn.get("arguments", raw_args)
            if not WORKSPACE_READ_TOOL_NAME_RE.search(tool_name):
                continue
            args = _parse_tool_call_arguments(raw_args)
            file_path = str(args.get("file_path") or "").strip()
            if tool_call_id and file_path:
                by_tool_call_id[tool_call_id] = file_path

    _scan_tool_calls(msg.get("tool_calls"))
    additional_kwargs = msg.get("additional_kwargs")
    if isinstance(additional_kwargs, dict):
        _scan_tool_calls(additional_kwargs.get("tool_calls"))


def _redact_schema_payload_in_memory(
    value: Any,
    *,
    mode: str,
    workspace_read_by_call_id: Optional[Dict[str, str]] = None,
) -> Any:
    if mode == "off":
        return value
    if workspace_read_by_call_id is None:
        workspace_read_by_call_id = {}
    if isinstance(value, dict):
        _collect_workspace_read_bindings_from_message(
            value,
            by_tool_call_id=workspace_read_by_call_id,
        )
        if _is_schema_tool_message(value):
            tool_name = str(value.get("name") or "").strip()
            redacted = dict(value)
            redacted["content"] = json.dumps(
                {
                    "event": "schema_payload_redacted_in_memory",
                    "tool_name": tool_name,
                    "data": "<omitted>",
                },
                ensure_ascii=False,
            )
            return redacted
        if _is_workspace_read_tool_message(value):
            tool_call_id = str(value.get("tool_call_id") or "").strip()
            file_path = workspace_read_by_call_id.get(tool_call_id, "").strip()
            if not file_path:
                file_path = "<unknown file>"
            redacted = dict(value)
            redacted["content"] = f"Read the contents of {file_path}"
            return redacted
        out: Dict[str, Any] = {}
        for k, v in value.items():
            out[k] = _redact_schema_payload_in_memory(
                v,
                mode=mode,
                workspace_read_by_call_id=workspace_read_by_call_id,
            )
        return out
    if isinstance(value, list):
        return [
            _redact_schema_payload_in_memory(
                v,
                mode=mode,
                workspace_read_by_call_id=workspace_read_by_call_id,
            )
            for v in value
        ]
    if isinstance(value, tuple):
        return tuple(
            _redact_schema_payload_in_memory(
                v,
                mode=mode,
                workspace_read_by_call_id=workspace_read_by_call_id,
            )
            for v in value
        )
    return value


def _install_checkpointer_redaction(checkpointer: Any, *, mode: str) -> Any:
    normalized = (mode or "").strip().lower()
    if normalized not in {"off", "placeholder"}:
        normalized = "placeholder"
    if normalized == "off":
        return checkpointer

    def _redact_args_kwargs(args: tuple[Any, ...], kwargs: Dict[str, Any]) -> tuple[tuple[Any, ...], Dict[str, Any]]:
        state: Dict[str, str] = {}
        safe_args = tuple(
            _redact_schema_payload_in_memory(
                copy.deepcopy(v),
                mode=normalized,
                workspace_read_by_call_id=state,
            )
            for v in args
        )
        safe_kwargs = {
            k: _redact_schema_payload_in_memory(
                copy.deepcopy(v),
                mode=normalized,
                workspace_read_by_call_id=state,
            )
            for k, v in kwargs.items()
        }
        return safe_args, safe_kwargs

    original_put = getattr(checkpointer, "put", None)
    if callable(original_put):
        def put_wrapper(*args: Any, **kwargs: Any) -> Any:
            safe_args, safe_kwargs = _redact_args_kwargs(args, kwargs)
            return original_put(*safe_args, **safe_kwargs)
        checkpointer.put = put_wrapper  # type: ignore[attr-defined]

    original_put_writes = getattr(checkpointer, "put_writes", None)
    if callable(original_put_writes):
        def put_writes_wrapper(*args: Any, **kwargs: Any) -> Any:
            safe_args, safe_kwargs = _redact_args_kwargs(args, kwargs)
            return original_put_writes(*safe_args, **safe_kwargs)
        checkpointer.put_writes = put_writes_wrapper  # type: ignore[attr-defined]

    original_aput = getattr(checkpointer, "aput", None)
    if callable(original_aput):
        async def aput_wrapper(*args: Any, **kwargs: Any) -> Any:
            safe_args, safe_kwargs = _redact_args_kwargs(args, kwargs)
            return await original_aput(*safe_args, **safe_kwargs)
        checkpointer.aput = aput_wrapper  # type: ignore[attr-defined]

    original_aput_writes = getattr(checkpointer, "aput_writes", None)
    if callable(original_aput_writes):
        async def aput_writes_wrapper(*args: Any, **kwargs: Any) -> Any:
            safe_args, safe_kwargs = _redact_args_kwargs(args, kwargs)
            return await original_aput_writes(*safe_args, **safe_kwargs)
        checkpointer.aput_writes = aput_writes_wrapper  # type: ignore[attr-defined]

    return checkpointer


@dataclass
class AgentSpec:
    """Extensible per-agent definition."""

    name: str
    system_prompt: str
    local_tools: List[Callable] = field(default_factory=list)
    delegate_to: Optional[List[str]] = None


@dataclass
class RequestContext:
    request_id: str
    source_agent: str
    recursion: RecursionMeta
    session_id: str
    metadata: Dict[str, object] = field(default_factory=dict)


def default_agent_specs() -> List[AgentSpec]:
    default_file = Path(__file__).resolve().parent / "config" / "agent_specs.json"
    return load_agent_specs_from_file(str(default_file))


def _parse_mcp_auth_headers_obj(obj: Any) -> Dict[str, Dict[str, str]]:
    """
    Accepts:
    - {"email": "TOKEN"}
    - {"email": {"x-email-user-token": "TOKEN"}}
    """
    if obj is None:
        return {}
    if not isinstance(obj, dict):
        raise ValueError("mcp auth config must be a JSON object")

    out: Dict[str, Dict[str, str]] = {}
    for server, value in obj.items():
        if not isinstance(server, str) or not server.strip():
            continue
        server = server.strip()
        if value is None:
            continue

        if isinstance(value, str):
            token = value.strip()
            if not token:
                continue
            header_name = SERVER_REQUIRED_AUTH_HEADER.get(server)
            if not header_name:
                raise ValueError(
                    f"mcp auth shorthand requires known auth header mapping for server '{server}'"
                )
            out[server] = {header_name: token}
            continue

        if isinstance(value, dict):
            headers: Dict[str, str] = {}
            for key, header_value in value.items():
                if (
                    isinstance(key, str)
                    and key.strip()
                    and isinstance(header_value, str)
                    and header_value.strip()
                ):
                    headers[key.strip()] = header_value.strip()
            if headers:
                out[server] = headers
            continue

        raise ValueError(f"mcp auth config value for '{server}' must be string or object")

    return out


def _load_agent_mcp_auth_map(
    *,
    config_file: str,
    config_json: str,
) -> Dict[str, Dict[str, Dict[str, str]]]:
    if config_file.strip():
        path = Path(config_file)
        if not path.exists():
            raise ValueError(f"MCP auth config file not found: {config_file}")
        raw = path.read_text(encoding="utf-8").strip()
        if not raw:
            return {}
        loaded = json.loads(raw)
    elif config_json.strip():
        loaded = json.loads(config_json)
    else:
        return {}

    if not isinstance(loaded, dict):
        raise ValueError("MCP auth config must be a JSON object")

    out: Dict[str, Dict[str, Dict[str, str]]] = {}
    for agent_name, value in loaded.items():
        if not isinstance(agent_name, str) or not agent_name.strip():
            continue
        out[agent_name.strip()] = _parse_mcp_auth_headers_obj(value)
    return out


class AgentRuntime:
    def __init__(
        self,
        *,
        agent_name: str,
        llm_model: str = "",
        base_url: str = "",
        peers: Optional[Dict[str, str]] = None,
        max_recursion_depth: int = 3,
        memory_window_size: int = 6,
        agent_specs: Optional[Iterable[AgentSpec]] = None,
        session_binding_store: Optional[SessionBindingStore] = None,
        debug: bool = False,
        debug_max_chars: int = 500,
        http_timeout_seconds: int = 300,
        fixed_mcp_auth_headers: Optional[Dict[str, Dict[str, str]]] = None,
        summary_enabled: bool = True,
        summary_model: str = "",
        summary_trigger_tokens: int = 0,
        summary_trigger_messages: int = 12,
        summary_keep_messages: int = 6,
    ):
        self.agent_name = agent_name
        self.peers = peers or {}
        self.max_recursion_depth = max_recursion_depth
        self.memory_window_size = max(1, int(memory_window_size))
        self.session_binding_store = session_binding_store or InMemorySessionBindingStore()
        self.debug = bool(debug)
        self.debug_max_chars = max(120, int(debug_max_chars))
        self.http_timeout_seconds = max(1, int(http_timeout_seconds))
        self.base_url = base_url
        self.summary_enabled = bool(summary_enabled)
        self.summary_model = _normalize_chat_model_name(summary_model.strip() or "gpt-4o-mini")
        self.summary_trigger_tokens = max(0, int(summary_trigger_tokens))
        self.summary_trigger_messages = max(2, int(summary_trigger_messages))
        self.summary_keep_messages = max(1, int(summary_keep_messages))
        self.fixed_mcp_auth_headers = fixed_mcp_auth_headers or {}
        self._session_locks_guard = Lock()
        self._session_locks: Dict[str, Lock] = {}
        self._event_log_lock = Lock()
        memory_redaction_mode = os.getenv("MCP_SCHEMA_MEMORY_REDACTION_MODE", "placeholder")
        self.checkpointer = _install_checkpointer_redaction(
            InMemorySaver(),
            mode=memory_redaction_mode,
        )
        self.session_event_log: Dict[str, List[Dict[str, Any]]] = {}
        self.cancelled_requests: Dict[str, Dict[str, Dict[str, Any]]] = {}
        self.request_context: contextvars.ContextVar[Optional[RequestContext]] = contextvars.ContextVar(
            "request_context", default=None
        )

        resolved_llm_model = _normalize_chat_model_name(llm_model)
        llm_kwargs: Dict[str, Any] = {
            "model": resolved_llm_model,
            "temperature": 0,
            "base_url": base_url,
        }
        extra_body = _build_llm_extra_body(resolved_llm_model)
        if extra_body:
            llm_kwargs["extra_body"] = extra_body
        self.llm = ChatOpenAI(**llm_kwargs)

        self.agent_specs: Dict[str, AgentSpec] = {}
        for spec in (agent_specs or default_agent_specs()):
            self.register_agent_spec(spec)

        if self.agent_name not in self.agent_specs:
            raise ValueError(
                f"Unknown agent name '{self.agent_name}'. Available specs: {list(self.agent_specs.keys())}"
            )

        self.langchain_agent = self._build_agent(self.agent_specs[self.agent_name])
        if self.debug:
            logger.info(
                "[%s] debug mode enabled (max_chars=%s)",
                self.agent_name,
                self.debug_max_chars,
            )
            logger.info(
                "[%s] short-term memory mode=checkpointer summary_enabled=%s "
                "trigger_tokens=%s trigger_messages=%s keep_messages=%s summary_model=%s",
                self.agent_name,
                self.summary_enabled,
                self.summary_trigger_tokens,
                self.summary_trigger_messages,
                self.summary_keep_messages,
                self.summary_model,
            )
            logger.info(
                "[%s] fixed mcp auth servers=%s",
                self.agent_name,
                sorted(self.fixed_mcp_auth_headers.keys()),
            )

    def _debug(self, message: str, *args: object) -> None:
        if not self.debug:
            return
        logger.info("[%s] " + message, self.agent_name, *args)

    def _clip(self, text: object) -> str:
        s = str(text)
        if len(s) <= self.debug_max_chars:
            return s
        return s[: self.debug_max_chars] + "...(truncated)"

    def _append_session_event(
        self,
        *,
        session_id: str,
        request_id: str,
        event: str,
        data: Optional[Dict[str, Any]] = None,
    ) -> None:
        sid = session_id.strip()
        if not sid:
            return
        rid = request_id.strip() if isinstance(request_id, str) else ""
        entry: Dict[str, Any] = {
            "ts": time.time(),
            "event": event,
            "agent_name": self.agent_name,
            "session_id": sid,
            "request_id": rid,
        }
        if data:
            entry["data"] = self._json_safe(data)
        with self._event_log_lock:
            arr = self.session_event_log.setdefault(sid, [])
            arr.append(entry)

    def _checkpoint_message_count(self, thread_id: str) -> Optional[int]:
        """
        Best-effort debug metric for current thread message count in checkpointer.
        Returns None when underlying checkpoint format is unavailable.
        """
        try:
            if not hasattr(self.checkpointer, "get_tuple"):
                return None
            checkpoint_tuple = self.checkpointer.get_tuple({"configurable": {"thread_id": thread_id}})
            if checkpoint_tuple is None:
                return 0
            checkpoint = getattr(checkpoint_tuple, "checkpoint", None)
            if not isinstance(checkpoint, dict):
                return None
            channel_values = checkpoint.get("channel_values")
            if not isinstance(channel_values, dict):
                return None
            messages = channel_values.get("messages")
            if isinstance(messages, list):
                return len(messages)
            return None
        except Exception:
            return None

    def _get_session_lock(self, session_id: str) -> Lock:
        sid = session_id.strip() if isinstance(session_id, str) else ""
        if not sid:
            sid = "__default__"
        with self._session_locks_guard:
            lock = self._session_locks.get(sid)
            if lock is None:
                lock = Lock()
                self._session_locks[sid] = lock
            return lock

    def register_agent_spec(self, spec: AgentSpec) -> None:
        self.agent_specs[spec.name] = spec

    def _resolve_delegate_targets(self, spec: AgentSpec) -> List[str]:
        targets = spec.delegate_to if spec.delegate_to is not None else [
            name for name in self.agent_specs if name != spec.name
        ]

        unknown_targets = [name for name in targets if name not in self.agent_specs]
        if unknown_targets:
            raise ValueError(
                f"Agent '{spec.name}' has unknown delegate targets: {unknown_targets}"
            )
        return targets

    def _http_post_json(self, url: str, payload: Dict, timeout: int = 300) -> Dict:
        body = json.dumps(payload).encode("utf-8")
        req = urlrequest.Request(
            url=url,
            data=body,
            headers={"Content-Type": "application/json", "Accept": "application/json"},
            method="POST",
        )
        try:
            with urlrequest.urlopen(req, timeout=timeout) as resp:
                raw = resp.read().decode("utf-8")
                if not raw:
                    return {}
                return json.loads(raw)
        except urlerror.HTTPError as exc:
            try:
                payload = exc.read().decode("utf-8")
            except Exception:
                payload = ""
            raise RuntimeError(f"HTTP {exc.code} from peer: {payload}") from exc
        except urlerror.URLError as exc:
            raise RuntimeError(f"Peer request failed: {exc.reason}") from exc

    @staticmethod
    def _parse_deadline_ts(metadata: Dict[str, Any]) -> Optional[float]:
        if not isinstance(metadata, dict):
            return None
        raw = metadata.get("deadline_at")
        if isinstance(raw, (int, float)):
            return float(raw)
        if not isinstance(raw, str):
            return None
        value = raw.strip()
        if not value:
            return None
        try:
            return float(value)
        except Exception:
            pass
        try:
            return datetime.fromisoformat(value).timestamp()
        except Exception:
            return None

    def _is_request_cancelled(self, *, session_id: str, request_id: str) -> bool:
        sid = session_id.strip()
        rid = request_id.strip()
        if not sid or not rid:
            return False
        with self._event_log_lock:
            return isinstance(self.cancelled_requests.get(sid, {}).get(rid), dict)

    def _check_cancel_or_deadline(self, context: Optional[RequestContext]) -> Optional[str]:
        if context is None:
            return None
        if self._is_request_cancelled(session_id=context.session_id, request_id=context.request_id):
            return "request_cancelled"
        deadline_ts = self._parse_deadline_ts(context.metadata)
        if isinstance(deadline_ts, float) and time.time() >= deadline_ts:
            return "deadline_exceeded"
        return None

    def cancel_request(self, *, session_id: str, request_id: str, reason: str = "cancelled") -> Dict[str, Any]:
        sid = session_id.strip()
        rid = request_id.strip()
        if not sid:
            raise ValueError("session_id is required")
        if not rid:
            raise ValueError("request_id is required")
        entry = {"ts": time.time(), "reason": reason.strip() or "cancelled"}
        with self._event_log_lock:
            bucket = self.cancelled_requests.setdefault(sid, {})
            bucket[rid] = entry
        self._append_session_event(
            session_id=sid,
            request_id=rid,
            event="request_cancelled",
            data={"reason": entry["reason"]},
        )
        return {
            "status": "ok",
            "session_id": sid,
            "request_id": rid,
            "reason": entry["reason"],
            "cancelled_at": entry["ts"],
        }

    def _create_http_delegation_tool(self, target_agent_name: str):
        """Build an HTTP Client Tool for peer-to-peer delegation."""

        def delegation_tool(task_description: str) -> str:
            context = self.request_context.get()
            if context is None:
                return "Error: request context not available for delegation."

            cancel_or_deadline = self._check_cancel_or_deadline(context)
            if cancel_or_deadline == "request_cancelled":
                return "Error: request cancelled."
            if cancel_or_deadline == "deadline_exceeded":
                return "Error: deadline exceeded."

            depth = context.recursion.depth
            max_depth = context.recursion.max_depth
            if depth >= max_depth:
                return (
                    f"Error: Request denied. Maximum recursion depth ({max_depth}) reached. "
                    "You must solve it with existing info."
                )

            # Prevent delegation cycles by blocking calls to any agent already
            # present in the current recursion trace (e.g. A->B->A).
            trace_agents: List[str] = []
            for hop in context.recursion.trace:
                if not isinstance(hop, str):
                    continue
                parts = [part.strip() for part in hop.split("->")]
                for part in parts:
                    if part:
                        trace_agents.append(part)
            if target_agent_name in trace_agents:
                self._append_session_event(
                    session_id=context.session_id,
                    request_id=context.request_id,
                    event="delegate_blocked_cycle",
                    data={
                        "from_agent": self.agent_name,
                        "to_agent": target_agent_name,
                        "trace": context.recursion.trace,
                        "reason": "target already appears in recursion trace",
                    },
                )
                self._debug(
                    "delegate blocked (cycle) request_id=%s from=%s to=%s trace=%s",
                    context.request_id,
                    self.agent_name,
                    target_agent_name,
                    context.recursion.trace,
                )
                return (
                    f"Error: delegation to '{target_agent_name}' blocked to prevent recursion cycle. "
                    "You must continue with available context or delegate to a different agent."
                )

            target_base = self.peers.get(target_agent_name)
            if not target_base:
                return f"Error: peer '{target_agent_name}' endpoint is not configured."

            next_recursion = RecursionMeta(
                depth=depth + 1,
                max_depth=max_depth,
                trace=[*context.recursion.trace, f"{self.agent_name}->{target_agent_name}"],
            )
            outbound = {
                "request_id": context.request_id,
                "source_agent": self.agent_name,
                "target_agent": target_agent_name,
                "task": task_description,
                "recursion": {
                    "depth": next_recursion.depth,
                    "max_depth": next_recursion.max_depth,
                    "trace": next_recursion.trace,
                },
                "metadata": {},
            }
            outbound["metadata"]["via"] = "http_client_tool"
            outbound["metadata"]["session_id"] = context.session_id
            outbound["metadata"]["parent_agent"] = self.agent_name
            if "deadline_at" in context.metadata:
                outbound["metadata"]["deadline_at"] = context.metadata.get("deadline_at")
            if "benchmark_server_allowlist" in context.metadata:
                outbound["metadata"]["benchmark_server_allowlist"] = context.metadata.get(
                    "benchmark_server_allowlist"
                )

            # ── Stage 2: Pre-Delegation Check ──────────────────────────────
            # Delegates to my_verification/verification_pipeline.py for all logic.
            _s2_error = check_stage2(
                task_description=task_description,
                target_agent=target_agent_name,
                from_agent=self.agent_name,
            )
            if _s2_error:
                return _s2_error
            # ───────────────────────────────────────────────────────────────

            try:
                self._append_session_event(
                    session_id=context.session_id,
                    request_id=context.request_id,
                    event="delegate_start",
                    data={
                        "from_agent": self.agent_name,
                        "to_agent": target_agent_name,
                        "task": task_description,
                        "depth": next_recursion.depth,
                        "max_depth": next_recursion.max_depth,
                        "trace": next_recursion.trace,
                    },
                )
                self._debug(
                    "delegate start request_id=%s depth=%s/%s trace=%s to=%s task=%s",
                    context.request_id,
                    next_recursion.depth,
                    next_recursion.max_depth,
                    next_recursion.trace,
                    target_agent_name,
                    self._clip(task_description),
                )
                peer_timeout_seconds = self.http_timeout_seconds
                deadline_ts = self._parse_deadline_ts(context.metadata)
                if isinstance(deadline_ts, float):
                    remaining = int(deadline_ts - time.time())
                    if remaining <= 0:
                        raise RuntimeError("deadline exceeded")
                    peer_timeout_seconds = max(1, min(self.http_timeout_seconds, remaining))
                response_obj = self._http_post_json(
                    f"{target_base.rstrip('/')}/v1/agent/tasks",
                    outbound,
                    timeout=peer_timeout_seconds,
                )
                parsed = parse_task_response(response_obj)
            except Exception as exc:
                self._append_session_event(
                    session_id=context.session_id,
                    request_id=context.request_id,
                    event="delegate_error",
                    data={"to_agent": target_agent_name, "error": str(exc)},
                )
                self._debug(
                    "delegate error request_id=%s to=%s err=%s",
                    context.request_id,
                    target_agent_name,
                    self._clip(exc),
                )
                return f"Error: delegation to '{target_agent_name}' failed: {exc}"

            if parsed.status != "ok":
                self._append_session_event(
                    session_id=context.session_id,
                    request_id=context.request_id,
                    event="delegate_non_ok",
                    data={
                        "to_agent": target_agent_name,
                        "status": parsed.status,
                        "error": parsed.error,
                    },
                )
                self._debug(
                    "delegate non-ok request_id=%s to=%s status=%s err=%s",
                    context.request_id,
                    target_agent_name,
                    parsed.status,
                    self._clip(parsed.error),
                )
                if parsed.error:
                    return f"Error: {parsed.error}"
                return "Error: peer returned non-ok status."
            self._debug(
                "delegate done request_id=%s from=%s recursion=%s result=%s",
                context.request_id,
                parsed.handled_by,
                asdict(parsed.recursion),
                self._clip(parsed.result),
            )
            self._append_session_event(
                session_id=context.session_id,
                request_id=context.request_id,
                event="delegate_done",
                data={
                    "to_agent": target_agent_name,
                    "handled_by": parsed.handled_by,
                    "status": parsed.status,
                    "recursion": asdict(parsed.recursion),
                    "result_preview": self._clip(parsed.result),
                },
            )

            # ── Stage 5: Post-Generation Audit ─────────────────────────────
            # Count tool_call trace events to detect silent 0-tool responses.
            # Delegates to my_verification/verification_pipeline.py for all logic.
            with self._event_log_lock:
                _session_events = list(self.session_event_log.get(context.session_id, []))
            _trace_event_count = sum(
                1 for ev in _session_events
                if ev.get("event") == "tool_call"
                and ev.get("request_id") == context.request_id
            )
            _s5_error = check_stage5(
                result=parsed.result,
                agent_name=self.agent_name,
                target_agent=target_agent_name,
                trace_event_count=_trace_event_count,
            )
            if _s5_error:
                return _s5_error
            # ───────────────────────────────────────────────────────────────

            return parsed.result

        delegation_tool.__name__ = f"ask_{target_agent_name}_by_http"
        delegation_tool.__doc__ = (
            f"Delegate a subtask to peer agent '{target_agent_name}' over HTTP. "
            "Provide a complete and specific task_description."
        )
        return tool(delegation_tool)

    def _build_agent(self, spec: AgentSpec):
        delegation_tools = [
            self._create_http_delegation_tool(target)
            for target in self._resolve_delegate_targets(spec)
        ]
        tools = [*spec.local_tools, *delegation_tools]
        middleware = []
        if self.summary_enabled:
            if self.summary_trigger_tokens > 0 and self.summary_trigger_messages > 0:
                # OR semantics: summarization runs when any threshold is met.
                trigger: Any = [
                    ("tokens", self.summary_trigger_tokens),
                    ("messages", self.summary_trigger_messages),
                ]
            elif self.summary_trigger_tokens > 0:
                trigger = ("tokens", self.summary_trigger_tokens)
            else:
                trigger = ("messages", self.summary_trigger_messages)
            middleware.append(
                SummarizationMiddleware(
                    model=f"openai:{self.summary_model}",
                    base_url=self.base_url,
                    api_key=os.getenv("OPENAI_API_KEY", ""),
                    temperature=0,
                    trigger=trigger,
                    keep=("messages", self.summary_keep_messages),
                )
            )
        return create_agent(
            model=self.llm,
            tools=tools,
            system_prompt=spec.system_prompt,
            middleware=middleware,
            checkpointer=self.checkpointer,
        )

    def _invoke_langchain(self, user_task: str) -> str:
        context = self.request_context.get()
        session_lock = self._get_session_lock(context.session_id if context is not None else "")
        invoke_config = None
        before_count: Optional[int] = None
        step_index = 0
        seen_messages: set[str] = set()
        pending_tool_calls: Dict[str, Dict[str, Any]] = {}
        latest_assistant_text = ""
        if context is not None:
            invoke_config = {"configurable": {"thread_id": context.session_id}}
            self._append_session_event(
                session_id=context.session_id,
                request_id=context.request_id,
                event="invoke_start",
                data={
                    "source_agent": context.source_agent,
                    "depth": context.recursion.depth,
                    "max_depth": context.recursion.max_depth,
                    "trace": context.recursion.trace,
                    "task": user_task,
                },
            )
            self._debug(
                "invoke start request_id=%s source=%s depth=%s/%s trace=%s session_id=%s task=%s",
                context.request_id,
                context.source_agent,
                context.recursion.depth,
                context.recursion.max_depth,
                context.recursion.trace,
                context.session_id,
                self._clip(user_task),
            )
        payload = {"messages": [("user", user_task)]}
        streamed = False

        with session_lock:
            if context is not None:
                before_count = self._checkpoint_message_count(context.session_id)
                if before_count is not None:
                    self._debug("checkpoint messages before=%s thread_id=%s", before_count, context.session_id)
            stream_iter = None
            invoke_started = time.time()
            first_update_ts: Optional[float] = None
            update_count = 0
            try:
                if context is not None:
                    self._append_session_event(
                        session_id=context.session_id,
                        request_id=context.request_id,
                        event="llm_invoke_start",
                        data={"mode": "stream_updates"},
                    )
                stream_iter = self.langchain_agent.stream(payload, config=invoke_config, stream_mode="updates")
            except Exception:
                stream_iter = None

            if stream_iter is not None:
                for update in stream_iter:
                    if first_update_ts is None:
                        first_update_ts = time.time()
                    update_count += 1
                    streamed = True
                    if context is None:
                        continue
                    for raw_message in self._collect_messages_from_update(update):
                        safe_message = self._json_safe(raw_message)
                        fingerprint = self._event_fingerprint(safe_message)
                        if fingerprint in seen_messages:
                            continue
                        seen_messages.add(fingerprint)
                        step_index += 1
                        maybe_text = self._record_message_step(
                            context=context,
                            step_index=step_index,
                            message=safe_message,
                            pending_tool_calls=pending_tool_calls,
                        )
                        if maybe_text:
                            latest_assistant_text = maybe_text
                if context is not None:
                    self._append_session_event(
                        session_id=context.session_id,
                        request_id=context.request_id,
                        event="llm_invoke_done",
                        data={
                            "mode": "stream_updates",
                            "duration_ms": round((time.time() - invoke_started) * 1000, 3),
                            "first_update_latency_ms": (
                                round((first_update_ts - invoke_started) * 1000, 3)
                                if first_update_ts is not None
                                else None
                            ),
                            "update_count": update_count,
                        },
                    )
            if not streamed:
                invoke_started = time.time()
                response = self.langchain_agent.invoke(payload, config=invoke_config)
                if context is not None:
                    self._append_session_event(
                        session_id=context.session_id,
                        request_id=context.request_id,
                        event="llm_invoke_done",
                        data={
                            "mode": "invoke_once",
                            "duration_ms": round((time.time() - invoke_started) * 1000, 3),
                            "update_count": 0,
                        },
                    )
                    for raw_message in response.get("messages", []):
                        safe_message = self._json_safe(raw_message)
                        fingerprint = self._event_fingerprint(safe_message)
                        if fingerprint in seen_messages:
                            continue
                        seen_messages.add(fingerprint)
                        step_index += 1
                        maybe_text = self._record_message_step(
                            context=context,
                            step_index=step_index,
                            message=safe_message,
                            pending_tool_calls=pending_tool_calls,
                        )
                        if maybe_text:
                            latest_assistant_text = maybe_text
            after_count: Optional[int] = None
            if context is not None:
                after_count = self._checkpoint_message_count(context.session_id)
                if after_count is not None:
                    self._debug("checkpoint messages after=%s thread_id=%s", after_count, context.session_id)
                if (
                    self.summary_enabled
                    and before_count is not None
                    and after_count is not None
                    and after_count <= before_count
                ):
                    self._debug(
                        "checkpoint compacted: before=%s after=%s thread_id=%s",
                        before_count,
                        after_count,
                        context.session_id,
                    )
        rendered = latest_assistant_text or ""
        self._debug("invoke done result=%s", self._clip(rendered))
        return rendered

    @classmethod
    def _collect_messages_from_update(cls, value: Any) -> List[Any]:
        out: List[Any] = []
        if isinstance(value, dict):
            for key, item in value.items():
                if key == "messages" and isinstance(item, list):
                    out.extend(item)
                    continue
                out.extend(cls._collect_messages_from_update(item))
            return out
        if isinstance(value, list):
            for item in value:
                out.extend(cls._collect_messages_from_update(item))
        return out

    @staticmethod
    def _event_fingerprint(value: Any) -> str:
        try:
            return json.dumps(value, ensure_ascii=False, sort_keys=True, default=str)
        except Exception:
            return str(value)

    @staticmethod
    def _extract_message_text(content: Any) -> str:
        if isinstance(content, str):
            return content
        if isinstance(content, list):
            parts: List[str] = []
            for block in content:
                if isinstance(block, str):
                    parts.append(block)
                    continue
                if isinstance(block, dict):
                    text = block.get("text")
                    if isinstance(text, str):
                        parts.append(text)
            if parts:
                return "\n".join(parts)
        if content is None:
            return ""
        return str(content)

    def _record_message_step(
        self,
        *,
        context: RequestContext,
        step_index: int,
        message: Any,
        pending_tool_calls: Dict[str, Dict[str, Any]],
    ) -> str:
        msg = message if isinstance(message, dict) else {"value": self._json_safe(message)}
        known_keys = {"role", "type", "kind", "content", "name", "tool_calls", "tool_call_id"}
        if not any(key in msg for key in known_keys):
            return ""
        role = str(msg.get("role") or msg.get("type") or msg.get("kind") or "unknown").lower()
        text = self._extract_message_text(msg.get("content"))

        self._append_session_event(
            session_id=context.session_id,
            request_id=context.request_id,
            event="agent_message",
            data={
                "step": step_index,
                "role": role,
                "message": msg,
                "content_preview": self._clip(text),
            },
        )

        tool_calls = msg.get("tool_calls")
        if isinstance(tool_calls, list):
            for tool_call in tool_calls:
                if not isinstance(tool_call, dict):
                    continue
                tool_name = str(tool_call.get("name") or "").strip()
                args = tool_call.get("args")
                if args is None:
                    fn = tool_call.get("function")
                    if isinstance(fn, dict):
                        tool_name = tool_name or str(fn.get("name") or "").strip()
                        args = fn.get("arguments")
                parsed_args: Any = args
                if isinstance(parsed_args, str):
                    try:
                        parsed_args = json.loads(parsed_args)
                    except Exception:
                        parsed_args = args
                call_id = str(tool_call.get("id") or tool_call.get("tool_call_id") or "").strip()
                if not call_id:
                    call_id = f"tool_call_step_{step_index}_{tool_name or 'unknown'}"

                call_entry = {
                    "tool_call_id": call_id,
                    "tool_name": tool_name,
                    "arguments": self._json_safe(parsed_args),
                    "raw_arguments": self._json_safe(args),
                    "raw_tool_call": self._json_safe(tool_call),
                    "step": step_index,
                }
                pending_tool_calls[call_id] = call_entry
                self._append_session_event(
                    session_id=context.session_id,
                    request_id=context.request_id,
                    event="tool_call",
                    data=call_entry,
                )

        is_tool_message = role == "tool" or msg.get("tool_call_id") is not None
        if is_tool_message:
            tool_call_id = str(msg.get("tool_call_id") or "").strip()
            mapped_call = pending_tool_calls.get(tool_call_id, {})
            tool_name = str(msg.get("name") or mapped_call.get("tool_name") or "").strip()
            self._append_session_event(
                session_id=context.session_id,
                request_id=context.request_id,
                event="tool_result",
                data={
                    "step": step_index,
                    "tool_call_id": tool_call_id,
                    "tool_name": tool_name,
                    "arguments": mapped_call.get("arguments"),
                    "result": self._json_safe(msg.get("content")),
                    "message": msg,
                },
            )
            return ""

        if role in {"assistant", "ai", "aimessage"}:
            usage_metadata = msg.get("usage_metadata")
            response_metadata = msg.get("response_metadata")
            model_name = ""
            finish_reason: Any = None
            if isinstance(response_metadata, dict):
                model_name = str(response_metadata.get("model_name") or response_metadata.get("model") or "").strip()
                finish_reason = response_metadata.get("finish_reason")
            elapsed_ms_from_request_start: Optional[float] = None
            request_received_at = context.metadata.get("request_received_at_ts")
            if isinstance(request_received_at, (int, float)):
                elapsed_ms_from_request_start = round((time.time() - float(request_received_at)) * 1000, 3)
            self._append_session_event(
                session_id=context.session_id,
                request_id=context.request_id,
                event="llm_response_meta",
                data={
                    "step": step_index,
                    "model_name": model_name,
                    "finish_reason": finish_reason,
                    "usage_metadata": self._json_safe(usage_metadata),
                    "response_metadata": self._json_safe(response_metadata),
                    "elapsed_ms_from_request_start": elapsed_ms_from_request_start,
                },
            )
            return text
        return ""

    def handle_task_payload(self, payload: Dict) -> Tuple[int, Dict]:
        request_id_for_error = str(payload.get("request_id", "unknown")) if isinstance(payload, dict) else "unknown"
        default_recursion = RecursionMeta(depth=0, max_depth=self.max_recursion_depth, trace=[])
        self._debug("request received payload=%s", self._clip(payload))

        try:
            req: AgentTaskRequest = parse_task_request(payload)
        except ContractError as exc:
            return 400, build_error_response(
                request_id=request_id_for_error,
                handled_by=self.agent_name,
                error_message=f"Bad request: {exc}",
                recursion=default_recursion,
                status="rejected",
            )

        if req.target_agent != self.agent_name:
            return 400, build_error_response(
                request_id=req.request_id,
                handled_by=self.agent_name,
                error_message=f"target_agent mismatch: expected '{self.agent_name}', got '{req.target_agent}'",
                recursion=req.recursion,
                status="rejected",
            )

        if req.recursion.max_depth > self.max_recursion_depth:
            req.recursion.max_depth = self.max_recursion_depth

        session_id = req.source_agent
        raw_session_id = req.metadata.get("session_id")
        if isinstance(raw_session_id, str) and raw_session_id.strip():
            session_id = raw_session_id.strip()

        # Session MCP bindings are read-only for agent runtime.
        # They should be provisioned externally (e.g., benchmark bootstrap) before task execution.
        effective_bindings = self._load_session_mcp_bindings(session_id=session_id)

        runtime_metadata = dict(req.metadata)
        runtime_metadata["request_received_at_ts"] = time.time()
        incoming_auth_headers = runtime_metadata.pop("mcp_auth_headers", None)
        incoming_auth_tokens = runtime_metadata.pop("mcp_auth_tokens", None)
        runtime_metadata["session_id"] = session_id
        runtime_metadata["mcp_db_bindings"] = effective_bindings
        runtime_metadata["mcp_auth_headers"] = dict(self.fixed_mcp_auth_headers)
        if incoming_auth_headers is not None or incoming_auth_tokens is not None:
            self._debug(
                "request ignored incoming mcp auth metadata request_id=%s has_headers=%s has_tokens=%s",
                req.request_id,
                incoming_auth_headers is not None,
                incoming_auth_tokens is not None,
            )
        self._debug(
            "request parsed request_id=%s source=%s target=%s depth=%s/%s trace=%s session_id=%s",
            req.request_id,
            req.source_agent,
            req.target_agent,
            req.recursion.depth,
            req.recursion.max_depth,
            req.recursion.trace,
            session_id,
        )
        self._append_session_event(
            session_id=session_id,
            request_id=req.request_id,
            event="request_parsed",
            data={
                "source_agent": req.source_agent,
                "target_agent": req.target_agent,
                "depth": req.recursion.depth,
                "max_depth": req.recursion.max_depth,
                "trace": req.recursion.trace,
            },
        )

        token = self.request_context.set(
            RequestContext(
                request_id=req.request_id,
                source_agent=req.source_agent,
                recursion=req.recursion,
                session_id=session_id,
                metadata=runtime_metadata,
            )
        )
        tool_context_token = set_tool_runtime_context(runtime_metadata)
        response_status_code = 200
        response_payload: Dict[str, Any]
        try:
            cancel_or_deadline = self._check_cancel_or_deadline(self.request_context.get())
            if cancel_or_deadline == "request_cancelled":
                response_status_code = 499
                response_payload = build_error_response(
                    request_id=req.request_id,
                    handled_by=self.agent_name,
                    error_message="Request cancelled.",
                    recursion=req.recursion,
                )
            elif cancel_or_deadline == "deadline_exceeded":
                response_status_code = 408
                response_payload = build_error_response(
                    request_id=req.request_id,
                    handled_by=self.agent_name,
                    error_message="Deadline exceeded.",
                    recursion=req.recursion,
                )
            else:
                result = self._invoke_langchain(req.task)
                self._debug("request success request_id=%s result=%s", req.request_id, self._clip(result))
                response_status_code = 200
                response_payload = build_success_response(
                    request_id=req.request_id,
                    handled_by=self.agent_name,
                    result=result,
                    recursion=req.recursion,
                )
        except Exception as exc:
            self._debug("request failed request_id=%s err=%s", req.request_id, self._clip(exc))
            response_status_code = 500
            response_payload = build_error_response(
                request_id=req.request_id,
                handled_by=self.agent_name,
                error_message=f"Agent execution failed: {exc}",
                recursion=req.recursion,
            )
        finally:
            reset_tool_runtime_context(tool_context_token)
            self.request_context.reset(token)

        return response_status_code, response_payload

    def _load_session_mcp_bindings(self, *, session_id: str) -> Dict[str, str]:
        return self.session_binding_store.get_bindings(session_id)

    @staticmethod
    def _json_safe(value: Any) -> Any:
        if value is None or isinstance(value, (bool, int, float, str)):
            return value
        if isinstance(value, bytes):
            try:
                return value.decode("utf-8")
            except Exception:
                return repr(value)
        if isinstance(value, tuple):
            return [AgentRuntime._json_safe(v) for v in value]
        if isinstance(value, list):
            return [AgentRuntime._json_safe(v) for v in value]
        if isinstance(value, dict):
            out: Dict[str, Any] = {}
            for k, v in value.items():
                out[str(k)] = AgentRuntime._json_safe(v)
            return out
        for attr in ("content", "role", "type"):
            if hasattr(value, attr):
                break
        else:
            return str(value)

        msg: Dict[str, Any] = {"kind": value.__class__.__name__}
        role = getattr(value, "role", None)
        if role is not None:
            msg["role"] = AgentRuntime._json_safe(role)
        msg_type = getattr(value, "type", None)
        if msg_type is not None:
            msg["type"] = AgentRuntime._json_safe(msg_type)
        content = getattr(value, "content", None)
        if content is not None:
            msg["content"] = AgentRuntime._json_safe(content)
        name = getattr(value, "name", None)
        if name is not None:
            msg["name"] = AgentRuntime._json_safe(name)
        tool_calls = getattr(value, "tool_calls", None)
        if tool_calls is not None:
            msg["tool_calls"] = AgentRuntime._json_safe(tool_calls)
        usage_metadata = getattr(value, "usage_metadata", None)
        if usage_metadata is not None:
            msg["usage_metadata"] = AgentRuntime._json_safe(usage_metadata)
        response_metadata = getattr(value, "response_metadata", None)
        if response_metadata is not None:
            msg["response_metadata"] = AgentRuntime._json_safe(response_metadata)
        msg_id = getattr(value, "id", None)
        if msg_id is not None:
            msg["id"] = AgentRuntime._json_safe(msg_id)
        return msg

    def export_session_trace(self, session_id: str, request_id: str = "") -> Dict[str, Any]:
        session = session_id.strip()
        if not session:
            raise ValueError("session_id is required")
        request_filter = request_id.strip()

        session_events: List[Dict[str, Any]] = []

        with self._event_log_lock:
            raw_events = list(self.session_event_log.get(session, []))
        if request_filter:
            session_events = [
                event for event in raw_events
                if str(event.get("request_id", "")).strip() == request_filter
            ]
        else:
            session_events = raw_events

        return {
            "status": "ok",
            "session_id": session,
            "request_id": request_filter,
            "agent_name": self.agent_name,
            "events": session_events,
            "event_count": len(session_events),
        }

    @staticmethod
    def _prune_checkpointer_mapping_by_session(mapping: Any, session_id: str) -> int:
        if not isinstance(mapping, dict):
            return 0
        removed = 0
        for key in list(mapping.keys()):
            drop = False
            if key == session_id:
                drop = True
            elif isinstance(key, tuple) and session_id in key:
                drop = True
            elif isinstance(key, str) and session_id in key:
                drop = True
            if drop:
                mapping.pop(key, None)
                removed += 1
        return removed

    def clear_session_memory(self, session_id: str) -> Dict[str, Any]:
        session = session_id.strip()
        if not session:
            raise ValueError("session_id is required")

        removed = 0
        with self._get_session_lock(session):
            if hasattr(self.checkpointer, "delete_thread"):
                # LangGraph checkpointer API (preferred when available).
                self.checkpointer.delete_thread(session)
                removed += 1
            else:
                # Fallback for in-memory implementations with exposed dicts.
                removed += self._prune_checkpointer_mapping_by_session(
                    getattr(self.checkpointer, "storage", None),
                    session,
                )
                removed += self._prune_checkpointer_mapping_by_session(
                    getattr(self.checkpointer, "writes", None),
                    session,
                )
        with self._event_log_lock:
            self.session_event_log.pop(session, None)
            self.cancelled_requests.pop(session, None)

        return {
            "status": "ok",
            "session_id": session,
            "removed_entries": removed,
        }

    def invoke_as_entrypoint(self, task: str) -> Dict:
        payload = {
            "request_id": str(uuid.uuid4()),
            "source_agent": "user",
            "target_agent": self.agent_name,
            "task": task,
            "recursion": {
                "depth": 0,
                "max_depth": self.max_recursion_depth,
                "trace": [f"user->{self.agent_name}"],
            },
            "metadata": {"entrypoint": "local_cli"},
        }
        status_code, response_payload = self.handle_task_payload(payload)
        if status_code != 200:
            raise RuntimeError(response_payload.get("error", "unknown error"))
        return response_payload


class AgentHTTPHandler(BaseHTTPRequestHandler):
    runtime: AgentRuntime

    def _debug_http(self, message: str, *args: object) -> None:
        if not self.runtime.debug:
            return
        logger.info("[%s][http] " + message, self.runtime.agent_name, *args)

    def _request_trace_id(self) -> str:
        header = self.headers.get("X-Request-Id", "")
        if header and header.strip():
            return header.strip()
        return str(uuid.uuid4())

    @staticmethod
    def _extract_request_id(payload: object, fallback: str) -> str:
        if isinstance(payload, dict):
            value = payload.get("request_id")
            if isinstance(value, str) and value.strip():
                return value.strip()
        return fallback

    def _send_json(self, status_code: int, payload: Dict) -> None:
        body = json.dumps(payload, ensure_ascii=False).encode("utf-8")
        trace_id = getattr(self, "_trace_id", "unknown")
        started_at = getattr(self, "_started_at", None)
        elapsed_ms = int((time.monotonic() - started_at) * 1000) if isinstance(started_at, float) else -1
        request_id = self._extract_request_id(payload, trace_id)
        try:
            self.send_response(status_code)
            self.send_header("Content-Type", "application/json; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)
            self._debug_http(
                "response_sent trace_id=%s request_id=%s path=%s status=%s bytes=%s elapsed_ms=%s client=%s",
                trace_id,
                request_id,
                self.path,
                status_code,
                len(body),
                elapsed_ms,
                self.client_address,
            )
        except (BrokenPipeError, ConnectionResetError, OSError) as exc:
            logger.warning(
                "[%s][http] response_write_failed trace_id=%s request_id=%s path=%s "
                "status=%s bytes=%s elapsed_ms=%s client=%s error=%r",
                self.runtime.agent_name,
                trace_id,
                request_id,
                self.path,
                status_code,
                len(body),
                elapsed_ms,
                self.client_address,
                exc,
            )

    def do_GET(self) -> None:  # noqa: N802
        self._trace_id = self._request_trace_id()
        self._started_at = time.monotonic()
        self._debug_http(
            "request_start trace_id=%s method=GET path=%s client=%s",
            self._trace_id,
            self.path,
            self.client_address,
        )
        if self.path == "/healthz":
            self._send_json(
                200,
                {
                    "status": "ok",
                    "agent": self.runtime.agent_name,
                },
            )
            return

        if self.path == "/v1/schema":
            self._send_json(200, get_contract_schema())
            return

        self._send_json(404, {"error": "not found"})

    def do_POST(self) -> None:  # noqa: N802
        self._trace_id = self._request_trace_id()
        self._started_at = time.monotonic()
        content_length = int(self.headers.get("Content-Length", "0"))
        self._debug_http(
            "request_start trace_id=%s method=POST path=%s content_length=%s client=%s",
            self._trace_id,
            self.path,
            content_length,
            self.client_address,
        )

        if self.path == "/v1/agent/sessions/clear":
            raw = self.rfile.read(content_length) if content_length > 0 else b"{}"
            try:
                payload = json.loads(raw.decode("utf-8"))
            except Exception as exc:
                self._send_json(400, {"status": "error", "error": f"Invalid JSON: {exc}"})
                return

            session_id = payload.get("session_id", "") if isinstance(payload, dict) else ""
            if not isinstance(session_id, str) or not session_id.strip():
                self._send_json(400, {"status": "error", "error": "session_id is required"})
                return
            try:
                self._debug_http(
                    "session_clear_start trace_id=%s session_id=%s client=%s",
                    self._trace_id,
                    session_id.strip(),
                    self.client_address,
                )
                result = self.runtime.clear_session_memory(session_id.strip())
                self._debug_http(
                    "session_clear_done trace_id=%s session_id=%s removed_entries=%s",
                    self._trace_id,
                    result.get("session_id"),
                    result.get("removed_entries"),
                )
                self._send_json(200, result)
            except Exception as exc:
                self._send_json(500, {"status": "error", "error": str(exc)})
            return

        if self.path == "/v1/agent/sessions/trace":
            raw = self.rfile.read(content_length) if content_length > 0 else b"{}"
            try:
                payload = json.loads(raw.decode("utf-8"))
            except Exception as exc:
                self._send_json(400, {"status": "error", "error": f"Invalid JSON: {exc}"})
                return

            session_id = payload.get("session_id", "") if isinstance(payload, dict) else ""
            request_id = payload.get("request_id", "") if isinstance(payload, dict) else ""
            if not isinstance(session_id, str) or not session_id.strip():
                self._send_json(400, {"status": "error", "error": "session_id is required"})
                return
            if request_id is not None and not isinstance(request_id, str):
                self._send_json(400, {"status": "error", "error": "request_id must be a string"})
                return
            try:
                self._debug_http(
                    "session_trace_start trace_id=%s session_id=%s request_id=%s client=%s",
                    self._trace_id,
                    session_id.strip(),
                    request_id.strip() if isinstance(request_id, str) else "",
                    self.client_address,
                )
                result = self.runtime.export_session_trace(
                    session_id.strip(),
                    request_id.strip() if isinstance(request_id, str) else "",
                )
                self._debug_http(
                    "session_trace_done trace_id=%s session_id=%s request_id=%s event_count=%s",
                    self._trace_id,
                    result.get("session_id"),
                    result.get("request_id"),
                    result.get("event_count"),
                )
                self._send_json(200, result)
            except Exception as exc:
                self._send_json(500, {"status": "error", "error": str(exc)})
            return

        if self.path == "/v1/agent/requests/cancel":
            raw = self.rfile.read(content_length) if content_length > 0 else b"{}"
            try:
                payload = json.loads(raw.decode("utf-8"))
            except Exception as exc:
                self._send_json(400, {"status": "error", "error": f"Invalid JSON: {exc}"})
                return
            session_id = payload.get("session_id", "") if isinstance(payload, dict) else ""
            request_id = payload.get("request_id", "") if isinstance(payload, dict) else ""
            reason = payload.get("reason", "cancelled") if isinstance(payload, dict) else "cancelled"
            if not isinstance(session_id, str) or not session_id.strip():
                self._send_json(400, {"status": "error", "error": "session_id is required"})
                return
            if not isinstance(request_id, str) or not request_id.strip():
                self._send_json(400, {"status": "error", "error": "request_id is required"})
                return
            try:
                result = self.runtime.cancel_request(
                    session_id=session_id.strip(),
                    request_id=request_id.strip(),
                    reason=str(reason),
                )
                self._send_json(200, result)
            except Exception as exc:
                self._send_json(500, {"status": "error", "error": str(exc)})
            return

        if self.path != "/v1/agent/tasks":
            self._send_json(404, {"error": "not found"})
            return

        raw = self.rfile.read(content_length) if content_length > 0 else b"{}"
        try:
            payload = json.loads(raw.decode("utf-8"))
        except Exception as exc:
            default_recursion = RecursionMeta(depth=0, max_depth=self.runtime.max_recursion_depth, trace=[])
            self._send_json(
                400,
                build_error_response(
                    request_id="unknown",
                    handled_by=self.runtime.agent_name,
                    error_message=f"Invalid JSON: {exc}",
                    recursion=default_recursion,
                    status="rejected",
                ),
            )
            return

        if isinstance(payload, dict):
            recursion_obj = payload.get("recursion")
            recursion_depth = None
            recursion_max_depth = None
            if isinstance(recursion_obj, dict):
                recursion_depth = recursion_obj.get("depth")
                recursion_max_depth = recursion_obj.get("max_depth")
            self._debug_http(
                "task_request trace_id=%s request_id=%s source=%s target=%s session_id=%s depth=%s/%s",
                self._trace_id,
                self._extract_request_id(payload, self._trace_id),
                payload.get("source_agent"),
                payload.get("target_agent"),
                payload.get("metadata", {}).get("session_id") if isinstance(payload.get("metadata"), dict) else None,
                recursion_depth,
                recursion_max_depth,
            )

        status_code, response_payload = self.runtime.handle_task_payload(payload)
        self._send_json(status_code, response_payload)

    def log_message(self, format: str, *args) -> None:
        # Keep container logs concise and structured.
        print(f"[{self.runtime.agent_name}] {self.address_string()} - {format % args}")


def make_handler(runtime: AgentRuntime):
    class _Handler(AgentHTTPHandler):
        pass

    _Handler.runtime = runtime
    return _Handler


def parse_peers(peers_json: str) -> Dict[str, str]:
    if not peers_json.strip():
        return {}
    obj = json.loads(peers_json)
    if not isinstance(obj, dict):
        raise ValueError("AGENT_PEERS_JSON must be a JSON object")

    peers: Dict[str, str] = {}
    for k, v in obj.items():
        if not isinstance(k, str) or not k.strip() or not isinstance(v, str) or not v.strip():
            raise ValueError("AGENT_PEERS_JSON keys/values must be non-empty strings")
        peers[k.strip()] = v.strip()
    return peers


def load_peers_from_file(peers_file: str) -> Dict[str, str]:
    path = Path(peers_file)
    if not path.exists():
        raise ValueError(f"Peers config file not found: {peers_file}")
    raw = path.read_text(encoding="utf-8")
    return parse_peers(raw)


def parse_agent_specs(specs_json: str) -> List[AgentSpec]:
    if not specs_json.strip():
        raise ValueError("Agent specs config is empty")

    obj = json.loads(specs_json)
    if not isinstance(obj, list):
        raise ValueError("Agent specs must be a JSON array")

    parsed_specs: List[AgentSpec] = []
    seen_names: set[str] = set()
    for index, item in enumerate(obj):
        if not isinstance(item, dict):
            raise ValueError(f"Agent spec at index {index} must be a JSON object")

        raw_name = item.get("name")
        raw_prompt = item.get("system_prompt")
        raw_delegate_to = item.get("delegate_to")

        if not isinstance(raw_name, str) or not raw_name.strip():
            raise ValueError(f"Agent spec at index {index} has invalid 'name'")
        if not isinstance(raw_prompt, str) or not raw_prompt.strip():
            raise ValueError(f"Agent spec '{raw_name}' has invalid 'system_prompt'")

        name = raw_name.strip()
        if name in seen_names:
            raise ValueError(f"Duplicate agent spec name: '{name}'")
        seen_names.add(name)

        delegate_to: Optional[List[str]] = None
        if raw_delegate_to is not None:
            if not isinstance(raw_delegate_to, list):
                raise ValueError(f"Agent spec '{name}' field 'delegate_to' must be an array when provided")
            delegate_to = []
            for target in raw_delegate_to:
                if not isinstance(target, str) or not target.strip():
                    raise ValueError(f"Agent spec '{name}' contains invalid delegate target")
                delegate_to.append(target.strip())

        parsed_specs.append(
            AgentSpec(
                name=name,
                system_prompt=raw_prompt.strip(),
                local_tools=get_agent_tools(name),
                delegate_to=delegate_to,
            )
        )

    if not parsed_specs:
        raise ValueError("Agent specs config must contain at least one agent")

    return parsed_specs


def load_agent_specs_from_file(agent_specs_file: str) -> List[AgentSpec]:
    path = Path(agent_specs_file)
    if not path.exists():
        raise ValueError(f"Agent specs config file not found: {agent_specs_file}")
    raw = path.read_text(encoding="utf-8")
    return parse_agent_specs(raw)


def main() -> None:
    parser = argparse.ArgumentParser(description="Run a single agent as an HTTP service.")
    parser.add_argument("--agent-name", default=os.getenv("AGENT_NAME", "it_service_desk_l1"))
    parser.add_argument("--host", default=os.getenv("AGENT_HOST", "0.0.0.0"))
    parser.add_argument("--port", type=int, default=int(os.getenv("AGENT_PORT", "8001")))
    parser.add_argument("--llm-model", default=os.getenv("AGENT_LLM_MODEL", "gpt-4o"))
    parser.add_argument("--openai-base-url", default=os.getenv("OPENAI_BASE_URL", ""))
    parser.add_argument(
        "--peers-file",
        default=os.getenv("AGENT_PEERS_FILE", "/app/config/agent_peers.json"),
        help="Path to agent peer endpoints JSON file.",
    )
    parser.add_argument(
        "--peers-json",
        default=os.getenv(
            "AGENT_PEERS_JSON",
            "",
        ),
        help="Legacy fallback JSON for agent peers.",
    )
    parser.add_argument(
        "--agent-specs-file",
        default=os.getenv("AGENT_SPECS_FILE", "/app/config/agent_specs.json"),
        help="Path to agent specs JSON file.",
    )
    parser.add_argument(
        "--agent-specs-json",
        default=os.getenv("AGENT_SPECS_JSON", ""),
        help="Legacy fallback JSON for agent specs.",
    )
    parser.add_argument(
        "--max-recursion-depth",
        type=int,
        default=int(os.getenv("AGENT_MAX_RECURSION_DEPTH", "3")),
    )
    parser.add_argument(
        "--memory-window-size",
        type=int,
        default=int(os.getenv("AGENT_MEMORY_WINDOW_SIZE", "6")),
        help="Deprecated (legacy option).",
    )
    parser.add_argument(
        "--run-task",
        default="",
        help="Optional local entry task. If set, executes once and exits without starting HTTP server.",
    )
    parser.add_argument(
        "--redis-url",
        default=os.getenv("REDIS_URL", ""),
        help="Redis URL for cross-agent shared session_mcp_bindings.",
    )
    parser.add_argument(
        "--session-bindings-prefix",
        default=os.getenv("AGENT_SESSION_BINDINGS_PREFIX", "company-agent:session-bindings"),
        help="Redis key prefix for shared session_mcp_bindings.",
    )
    parser.add_argument(
        "--session-bindings-ttl-seconds",
        type=int,
        default=int(os.getenv("AGENT_SESSION_BINDINGS_TTL_SECONDS", "86400")),
        help="TTL for session_mcp_bindings in Redis (0 means no expiration).",
    )
    parser.add_argument(
        "--debug",
        action="store_true",
        default=str(os.getenv("AGENT_DEBUG", "0")).strip().lower() in {"1", "true", "yes", "on"},
        help="Enable verbose debug logs for delegation/runtime steps.",
    )
    parser.add_argument(
        "--debug-max-chars",
        type=int,
        default=int(os.getenv("AGENT_DEBUG_MAX_CHARS", "99999")),
        help="Max chars per debug field before truncation.",
    )
    parser.add_argument(
        "--http-timeout-seconds",
        type=int,
        default=int(os.getenv("AGENT_HTTP_TIMEOUT_SECONDS", "300")),
        help="HTTP timeout in seconds for inter-agent delegation calls.",
    )
    parser.add_argument(
        "--mcp-auth-config-file",
        default=os.getenv("MCP_AUTH_CONFIG_FILE", "/app/config/mcp_auth_by_agent.json"),
        help="Agent-level MCP auth config file. Format: {agent_name: {server: token_or_headers}}",
    )
    parser.add_argument(
        "--mcp-auth-config-json",
        default=os.getenv("MCP_AUTH_CONFIG_JSON", ""),
        help="Agent-level MCP auth config JSON string. Used only when --mcp-auth-config-file is empty.",
    )
    parser.add_argument(
        "--summary-enabled",
        action="store_true",
        default=str(os.getenv("AGENT_SUMMARY_ENABLED", "1")).strip().lower() in {"1", "true", "yes", "on"},
        help="Enable short-term memory summarization middleware.",
    )
    parser.add_argument(
        "--summary-model",
        default=os.getenv("AGENT_SUMMARY_MODEL", "gpt-4o-mini"),
        help="Model used by summarization middleware.",
    )
    parser.add_argument(
        "--summary-trigger-tokens",
        type=int,
        default=int(os.getenv("AGENT_SUMMARY_TRIGGER_TOKENS", "28000")),
        help=(
            "Summarize when total message tokens reach this threshold. "
            "If both token and message thresholds are > 0, either one can trigger summarization."
        ),
    )
    parser.add_argument(
        "--summary-trigger-messages",
        type=int,
        default=int(os.getenv("AGENT_SUMMARY_TRIGGER_MESSAGES", "10")),
        help="Summarize when message count reaches this threshold.",
    )
    parser.add_argument(
        "--summary-keep-messages",
        type=int,
        default=int(os.getenv("AGENT_SUMMARY_KEEP_MESSAGES", "3")),
        help="Keep this many recent messages after summarization.",
    )
    args = parser.parse_args()

    if not os.getenv("OPENAI_API_KEY"):
        raise EnvironmentError("Please set OPENAI_API_KEY before running this service.")

    if args.peers_file:
        peers = load_peers_from_file(args.peers_file)
    else:
        peers = parse_peers(args.peers_json)

    if args.agent_specs_file:
        agent_specs = load_agent_specs_from_file(args.agent_specs_file)
    else:
        agent_specs = parse_agent_specs(args.agent_specs_json)

    agent_mcp_auth_map = _load_agent_mcp_auth_map(
        config_file=args.mcp_auth_config_file,
        config_json=args.mcp_auth_config_json,
    )
    fixed_mcp_auth_headers = agent_mcp_auth_map.get(args.agent_name, {})

    if args.redis_url.strip():
        try:
            session_binding_store = RedisSessionBindingStore(
                redis_url=args.redis_url.strip(),
                key_prefix=args.session_bindings_prefix,
                ttl_seconds=args.session_bindings_ttl_seconds,
            )
            session_binding_store.client.ping()
            print(
                f"[{args.agent_name}] session binding store: redis "
                f"url={args.redis_url.strip()} prefix={args.session_bindings_prefix} "
                f"ttl={args.session_bindings_ttl_seconds}"
            )
        except Exception as exc:
            print(
                f"[{args.agent_name}] WARNING: failed to connect Redis ({exc}), "
                "fallback to in-memory session binding store."
            )
            session_binding_store = InMemorySessionBindingStore()
    else:
        print(f"[{args.agent_name}] session binding store: in-memory (REDIS_URL not set)")
        session_binding_store = InMemorySessionBindingStore()

    runtime = AgentRuntime(
        agent_name=args.agent_name,
        llm_model=args.llm_model,
        base_url=args.openai_base_url,
        peers=peers,
        max_recursion_depth=args.max_recursion_depth,
        memory_window_size=args.memory_window_size,
        agent_specs=agent_specs,
        session_binding_store=session_binding_store,
        debug=args.debug,
        debug_max_chars=args.debug_max_chars,
        http_timeout_seconds=args.http_timeout_seconds,
        fixed_mcp_auth_headers=fixed_mcp_auth_headers,
        summary_enabled=args.summary_enabled,
        summary_model=args.summary_model,
        summary_trigger_tokens=args.summary_trigger_tokens,
        summary_trigger_messages=args.summary_trigger_messages,
        summary_keep_messages=args.summary_keep_messages,
    )

    if args.run_task:
        response = runtime.invoke_as_entrypoint(args.run_task)
        print(response["result"])
        return

    server = ThreadingHTTPServer((args.host, args.port), make_handler(runtime))
    print(
        f"[{args.agent_name}] listening on {args.host}:{args.port}, peers={json.dumps(peers, ensure_ascii=False)}"
    )
    server.serve_forever()


if __name__ == "__main__":
    main()