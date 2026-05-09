from __future__ import annotations

from dataclasses import asdict, dataclass, field
from typing import Any, Dict, List

API_VERSION = "2026-04-04"


class ContractError(ValueError):
    """Raised when request/response payload violates the HTTP contract."""


@dataclass
class RecursionMeta:
    depth: int
    max_depth: int
    trace: List[str] = field(default_factory=list)


@dataclass
class AgentTaskRequest:
    request_id: str
    source_agent: str
    target_agent: str
    task: str
    recursion: RecursionMeta
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class AgentTaskResponse:
    request_id: str
    api_version: str
    status: str
    handled_by: str
    result: str
    recursion: RecursionMeta
    error: str = ""


def _require_non_empty_str(data: Dict[str, Any], key: str) -> str:
    value = data.get(key)
    if not isinstance(value, str) or not value.strip():
        raise ContractError(f"'{key}' must be a non-empty string")
    return value.strip()


def _parse_recursion(recursion_obj: Any) -> RecursionMeta:
    if not isinstance(recursion_obj, dict):
        raise ContractError("'recursion' must be an object")

    depth = recursion_obj.get("depth")
    max_depth = recursion_obj.get("max_depth")
    trace = recursion_obj.get("trace", [])

    if not isinstance(depth, int) or depth < 0:
        raise ContractError("'recursion.depth' must be a non-negative integer")
    if not isinstance(max_depth, int) or max_depth < 0:
        raise ContractError("'recursion.max_depth' must be a non-negative integer")
    if depth > max_depth:
        raise ContractError("'recursion.depth' cannot exceed 'recursion.max_depth'")
    if not isinstance(trace, list) or not all(isinstance(x, str) for x in trace):
        raise ContractError("'recursion.trace' must be a list of strings")

    return RecursionMeta(depth=depth, max_depth=max_depth, trace=trace)


def parse_task_request(payload: Dict[str, Any]) -> AgentTaskRequest:
    if not isinstance(payload, dict):
        raise ContractError("request payload must be an object")

    request_id = _require_non_empty_str(payload, "request_id")
    source_agent = _require_non_empty_str(payload, "source_agent")
    target_agent = _require_non_empty_str(payload, "target_agent")
    task = _require_non_empty_str(payload, "task")
    recursion = _parse_recursion(payload.get("recursion"))

    metadata = payload.get("metadata", {})
    if not isinstance(metadata, dict):
        raise ContractError("'metadata' must be an object")
    _validate_metadata(metadata)

    return AgentTaskRequest(
        request_id=request_id,
        source_agent=source_agent,
        target_agent=target_agent,
        task=task,
        recursion=recursion,
        metadata=metadata,
    )


def _validate_metadata(metadata: Dict[str, Any]) -> None:
    session_id = metadata.get("session_id")
    if session_id is not None and not isinstance(session_id, str):
        raise ContractError("'metadata.session_id' must be a string")

    bindings = metadata.get("mcp_db_bindings")
    if bindings is not None:
        if not isinstance(bindings, dict):
            raise ContractError("'metadata.mcp_db_bindings' must be an object")
        for key, value in bindings.items():
            if not isinstance(key, str) or not key.strip():
                raise ContractError("'metadata.mcp_db_bindings' keys must be non-empty strings")
            if not isinstance(value, str) or not value.strip():
                raise ContractError(
                    "'metadata.mcp_db_bindings' values must be non-empty strings"
                )


def build_success_response(request_id: str, handled_by: str, result: str, recursion: RecursionMeta) -> Dict[str, Any]:
    response = AgentTaskResponse(
        request_id=request_id,
        api_version=API_VERSION,
        status="ok",
        handled_by=handled_by,
        result=result,
        recursion=recursion,
    )
    return asdict(response)


def build_error_response(
    request_id: str,
    handled_by: str,
    error_message: str,
    recursion: RecursionMeta,
    *,
    status: str = "error",
) -> Dict[str, Any]:
    response = AgentTaskResponse(
        request_id=request_id,
        api_version=API_VERSION,
        status=status,
        handled_by=handled_by,
        result="",
        recursion=recursion,
        error=error_message,
    )
    return asdict(response)


def parse_task_response(payload: Dict[str, Any]) -> AgentTaskResponse:
    if not isinstance(payload, dict):
        raise ContractError("response payload must be an object")

    request_id = _require_non_empty_str(payload, "request_id")
    api_version = _require_non_empty_str(payload, "api_version")
    status = _require_non_empty_str(payload, "status")
    handled_by = _require_non_empty_str(payload, "handled_by")
    result = payload.get("result", "")
    error = payload.get("error", "")
    recursion = _parse_recursion(payload.get("recursion"))

    if not isinstance(result, str):
        raise ContractError("'result' must be a string")
    if not isinstance(error, str):
        raise ContractError("'error' must be a string")

    return AgentTaskResponse(
        request_id=request_id,
        api_version=api_version,
        status=status,
        handled_by=handled_by,
        result=result,
        recursion=recursion,
        error=error,
    )


def get_contract_schema() -> Dict[str, Any]:
    return {
        "api_version": API_VERSION,
        "endpoints": {
            "health": {"method": "GET", "path": "/healthz"},
            "schema": {"method": "GET", "path": "/v1/schema"},
            "task": {
                "method": "POST",
                "path": "/v1/agent/tasks",
                "request": {
                    "request_id": "string",
                    "source_agent": "string",
                    "target_agent": "string",
                    "task": "string",
                    "recursion": {
                        "depth": "int >= 0",
                        "max_depth": "int >= 0",
                        "trace": "list[string]",
                    },
                    "metadata": "object (optional)",
                    "metadata.session_id": "string (optional)",
                    "metadata.mcp_db_bindings": "object[str->string] (optional)",
                },
                "response": {
                    "request_id": "string",
                    "api_version": "string",
                    "status": "ok|error|rejected",
                    "handled_by": "string",
                    "result": "string",
                    "error": "string",
                    "recursion": {
                        "depth": "int >= 0",
                        "max_depth": "int >= 0",
                        "trace": "list[string]",
                    },
                },
            },
        },
    }
