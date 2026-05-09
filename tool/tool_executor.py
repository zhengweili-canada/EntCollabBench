from __future__ import annotations

from datetime import datetime
from pathlib import Path
from zoneinfo import ZoneInfo
from typing import Any, Dict, List, Optional
import json
import os
from contextvars import ContextVar, Token

from tool.mcp_bridge import MCP_BRIDGE, MCPBridgeError, MCP_SERVER_PORTS


class ToolExecutionError(ValueError):
    """Raised when tool input validation or execution fails."""


_TOOL_RUNTIME_CONTEXT: ContextVar[Optional[Dict[str, Any]]] = ContextVar(
    "tool_runtime_context",
    default=None,
)


# Servers that should carry an explicit user identity token/header for stable, reproducible behavior.
SERVER_REQUIRED_AUTH_HEADER: Dict[str, str] = {
    "calendar": "x-calendar-user-token",
    "csm": "x-user-email",
    "drive": "x-gdrive-user-token",
    "email": "x-email-user-token",
    "gitea": "authorization",
    "hr": "x-hr-user-token",
    "itsm": "x-itsm-user-token",
    "teams": "x-teams-access-token",
}


def set_tool_runtime_context(context: Dict[str, Any]) -> Token:
    if not isinstance(context, dict):
        raise ValueError("tool runtime context must be a dict")
    return _TOOL_RUNTIME_CONTEXT.set(context)


def reset_tool_runtime_context(token: Token) -> None:
    _TOOL_RUNTIME_CONTEXT.reset(token)


def _get_tool_runtime_context() -> Dict[str, Any]:
    context = _TOOL_RUNTIME_CONTEXT.get()
    if context is None:
        return {}
    return context


def _require_str(payload: Dict[str, Any], key: str) -> str:
    value = payload.get(key)
    if not isinstance(value, str) or not value.strip():
        raise ToolExecutionError(f"'{key}' must be a non-empty string")
    return value


def _require_number(payload: Dict[str, Any], key: str) -> float:
    value = payload.get(key)
    if not isinstance(value, (int, float)):
        raise ToolExecutionError(f"'{key}' must be a number")
    return float(value)


def _require_bool(payload: Dict[str, Any], key: str, default: bool = False) -> bool:
    if key not in payload:
        return default
    value = payload.get(key)
    if not isinstance(value, bool):
        raise ToolExecutionError(f"'{key}' must be a boolean")
    return value


def _optional_str(payload: Dict[str, Any], key: str) -> Optional[str]:
    if key not in payload:
        return None
    value = payload.get(key)
    if not isinstance(value, str):
        raise ToolExecutionError(f"'{key}' must be a string")
    value = value.strip()
    return value or None


def _optional_positive_int(payload: Dict[str, Any], key: str) -> Optional[int]:
    if key not in payload:
        return None
    value = payload.get(key)
    if isinstance(value, bool) or not isinstance(value, int):
        raise ToolExecutionError(f"'{key}' must be an integer")
    if value <= 0:
        raise ToolExecutionError(f"'{key}' must be > 0")
    return int(value)


# Knowledge-only allowlist for KB maintainer role.
# Source: scripts/output/mcp_tools_all.md (itsm/hr/csm sections).
KNOWLEDGE_TOOL_ALLOWLIST: Dict[str, set[str]] = {
    "csm": {
        "retrieve_knowledge",
        "find_case_knowledge_linkages",
        "create_knowledge",
        "update_knowledge",
        "link_case_knowledge",
        "updated_linked_case_knowledge",
        "delete_case_knowledge_linkages",
    },
    "hr": {
        "retrieve_knowledge_articles",
        "create_knowledge_article",
        "update_knowledge_article",
        "link_knowledge_to_hr_case",
        "find_hr_case_knowledge_links",
        "remove_knowledge_link_to_hr_case",
    },
    "itsm": {
        "retrieve_knowledge_articles",
        "create_knowledge_article",
        "update_knowledge_article",
        "find_incident_knowledge_links",
        "link_knowledge_to_incident",
        "remove_knowledge_link_to_incident",
    },
}


def _get_workspace_root() -> Path:
    root = os.getenv("AGENT_WORKSPACE_DIR", "/app/workspace").strip() or "/app/workspace"
    return Path(root).resolve()


def _resolve_workspace_path(path_value: str) -> Path:
    root = _get_workspace_root()
    candidate = (root / path_value.strip()).resolve()
    if candidate == root:
        return candidate
    if root not in candidate.parents:
        raise ToolExecutionError("Workspace path escapes AGENT_WORKSPACE_DIR")
    return candidate


def _list_workspace_files(relative_dir: str) -> str:
    target = _resolve_workspace_path(relative_dir)
    if not target.exists():
        return json.dumps({"path": str(target), "exists": False, "entries": []}, ensure_ascii=False)
    if not target.is_dir():
        raise ToolExecutionError("'relative_dir' must point to a directory")

    entries = []
    for item in sorted(target.iterdir(), key=lambda p: p.name):
        rel = item.relative_to(_get_workspace_root()).as_posix()
        entries.append(
            {
                "path": rel,
                "type": "dir" if item.is_dir() else "file",
                "size_bytes": item.stat().st_size if item.is_file() else None,
            }
        )
    return json.dumps({"path": target.relative_to(_get_workspace_root()).as_posix(), "exists": True, "entries": entries}, ensure_ascii=False)


def _read_workspace_file(file_path: str) -> str:
    target = _resolve_workspace_path(file_path)
    if not target.exists() or not target.is_file():
        raise ToolExecutionError("Workspace file does not exist")
    max_bytes = int(os.getenv("AGENT_WORKSPACE_READ_MAX_BYTES", str(8 * 1024 * 1024)))
    file_size = target.stat().st_size
    if file_size > max_bytes:
        raise ToolExecutionError(
            f"Workspace file is too large ({file_size} bytes). "
            f"Limit is {max_bytes} bytes (AGENT_WORKSPACE_READ_MAX_BYTES)."
        )

    # Fast path for common UTF-8 text files.
    text_exts = {
        ".txt", ".md", ".json", ".yaml", ".yml", ".toml", ".ini", ".csv",
        ".tsv", ".xml", ".html", ".htm", ".py", ".js", ".ts", ".java",
        ".go", ".rs", ".sh", ".sql", ".log", ".rtf",
    }
    suffix = target.suffix.lower()
    if suffix == ".pdf":
        return _read_pdf_with_fallback(target)

    if suffix in text_exts:
        try:
            return _read_workspace_text_with_limits(target, suffix)
        except UnicodeDecodeError:
            # Fall through to unstructured for non-utf8 / mixed encodings.
            pass

    return _read_workspace_file_with_unstructured(target)


def _truncate_workspace_read_output(content: str) -> str:
    max_chars = int(os.getenv("AGENT_WORKSPACE_READ_MAX_CHARS", "20000"))
    if max_chars < 1024:
        max_chars = 1024
    if len(content) <= max_chars:
        return content
    return (
        content[:max_chars]
        + "\n\n[TRUNCATED] Output exceeded AGENT_WORKSPACE_READ_MAX_CHARS="
        + str(max_chars)
    )


def _read_workspace_text_with_limits(target: Path, suffix: str) -> str:
    max_chars = int(os.getenv("AGENT_WORKSPACE_READ_MAX_CHARS", "20000"))
    if max_chars < 1024:
        max_chars = 1024
    head_lines = int(os.getenv("AGENT_WORKSPACE_READ_HEAD_LINES", "200"))
    if head_lines < 1:
        head_lines = 1
    large_file_bytes = int(os.getenv("AGENT_WORKSPACE_READ_LARGE_FILE_BYTES", str(1024 * 1024)))
    if large_file_bytes < 1024:
        large_file_bytes = 1024

    use_head_only = suffix in {".csv", ".tsv"} or target.stat().st_size >= large_file_bytes
    if not use_head_only:
        text = target.read_text(encoding="utf-8")
        return _truncate_workspace_read_output(text)

    lines: List[str] = []
    chars_used = 0
    with target.open("r", encoding="utf-8", errors="replace") as f:
        for idx, line in enumerate(f):
            if idx >= head_lines:
                break
            if chars_used >= max_chars:
                break
            remaining = max_chars - chars_used
            if len(line) > remaining:
                lines.append(line[:remaining])
                chars_used += remaining
                break
            lines.append(line)
            chars_used += len(line)

    content = "".join(lines)
    return (
        content
        + f"\n\n[TRUNCATED] Large/text-heavy file; returned head only "
          f"(max_lines={head_lines}, max_chars={max_chars})."
    )


def _read_pdf_with_fallback(target: Path) -> str:
    # Prefer lightweight pure-Python extraction first to avoid heavy optional deps.
    try:
        from pypdf import PdfReader

        reader = PdfReader(str(target))
        parts: List[str] = []
        max_pages = int(os.getenv("AGENT_WORKSPACE_READ_PDF_MAX_PAGES", "20"))
        if max_pages < 1:
            max_pages = 1
        for idx, page in enumerate(reader.pages):
            if idx >= max_pages:
                break
            text = page.extract_text() or ""
            text = text.strip()
            if text:
                parts.append(text)
        if parts:
            return _truncate_workspace_read_output("\n\n".join(parts))
    except Exception:
        # Fall through to unstructured for PDFs where direct extraction fails.
        pass
    return _read_workspace_file_with_unstructured(target)


def _read_workspace_file_with_unstructured(target: Path) -> str:
    try:
        from unstructured.partition.auto import partition
    except Exception as exc:
        raise ToolExecutionError(
            "Failed to load unstructured parser. Ensure dependencies are installed."
        ) from exc

    kwargs: Dict[str, Any] = {}
    # Force OCR-capable strategy for scanned PDFs and image files.
    ocr_exts = {".pdf", ".png", ".jpg", ".jpeg", ".tif", ".tiff", ".bmp", ".webp"}
    if target.suffix.lower() in ocr_exts:
        kwargs["strategy"] = "hi_res"
        kwargs["languages"] = ["eng", "chi_sim"]

    try:
        elements = partition(filename=str(target), **kwargs)
    except TypeError:
        # Some file types/backends may not accept strategy/languages kwargs.
        elements = partition(filename=str(target))
    except Exception as exc:
        raise ToolExecutionError(f"Failed to parse file via unstructured: {exc}") from exc

    texts: List[str] = []
    for element in elements:
        value = getattr(element, "text", "")
        if isinstance(value, str):
            value = value.strip()
            if value:
                texts.append(value)

    if not texts:
        raise ToolExecutionError(
            "No readable text extracted. File may be empty, unsupported, or OCR dependencies are missing."
        )
    return _truncate_workspace_read_output("\n\n".join(texts))


def _write_workspace_file(file_path: str, content: str, append: bool) -> str:
    target = _resolve_workspace_path(file_path)
    target.parent.mkdir(parents=True, exist_ok=True)
    mode = "a" if append else "w"
    with target.open(mode, encoding="utf-8") as f:
        f.write(content)
    rel = target.relative_to(_get_workspace_root()).as_posix()
    return json.dumps({"path": rel, "written_bytes": len(content.encode("utf-8")), "append": append}, ensure_ascii=False)


def _get_runtime_mcp_bindings() -> Dict[str, str]:
    context = _get_tool_runtime_context()
    bindings = context.get("mcp_db_bindings", {})
    if not isinstance(bindings, dict):
        bindings = {}
        context["mcp_db_bindings"] = bindings
    return bindings


def _get_runtime_mcp_auth_headers(server: str) -> Dict[str, str]:
    context = _get_tool_runtime_context()
    auth_headers = context.get("mcp_auth_headers", {})
    if not isinstance(auth_headers, dict):
        return {}
    per_server = auth_headers.get(server)
    if not isinstance(per_server, dict):
        return {}

    resolved: Dict[str, str] = {}
    for key, value in per_server.items():
        if (
            isinstance(key, str)
            and key.strip()
            and isinstance(value, str)
            and value.strip()
        ):
            resolved[key.strip()] = value.strip()
    return resolved


def _get_runtime_mcp_auth_token(server: str) -> Optional[str]:
    context = _get_tool_runtime_context()
    tokens = context.get("mcp_auth_tokens", {})
    if not isinstance(tokens, dict):
        return None
    value = tokens.get(server)
    if isinstance(value, str) and value.strip():
        return value.strip()
    return None


def _resolve_mcp_database_id(server: str, payload: Dict[str, Any]) -> Optional[str]:
    db_id = _optional_str(payload, "database_id")
    if db_id:
        return db_id
    bindings = _get_runtime_mcp_bindings()
    bound = bindings.get(server)
    if isinstance(bound, str) and bound.strip():
        return bound.strip()
    return None


def _get_benchmark_server_allowlist() -> Optional[set[str]]:
    context = _get_tool_runtime_context()
    raw = context.get("benchmark_server_allowlist")
    if raw is None:
        return None
    if not isinstance(raw, list):
        return set()
    allowed = {
        str(server).strip()
        for server in raw
        if isinstance(server, str) and str(server).strip()
    }
    return allowed


def _enforce_benchmark_mcp_server_policy(server: str, payload: Dict[str, Any]) -> None:
    allowed = _get_benchmark_server_allowlist()
    if allowed is None:
        return
    if server not in allowed:
        raise ToolExecutionError(
            f"MCP server '{server}' was not seeded for this benchmark session. "
            "This task's ground truth did not require it, so benchmark execution blocks "
            "fallback calls to shared default endpoints."
        )
    if server == "gitea" and not _resolve_mcp_database_id(server, payload):
        raise ToolExecutionError(
            "Gitea was planned for this benchmark session but no isolated database binding "
            "is available. Seed gitea for this session before making MCP gitea calls."
        )


def _resolve_mcp_headers(server: str, payload: Dict[str, Any]) -> Dict[str, str]:
    _enforce_benchmark_mcp_server_policy(server, payload)
    headers: Dict[str, str] = {}
    db_id = _resolve_mcp_database_id(server, payload)
    if db_id:
        headers["x-database-id"] = db_id

    # Fill auth headers from runtime metadata first.
    headers.update(_get_runtime_mcp_auth_headers(server))
    token = _get_runtime_mcp_auth_token(server)
    required_auth_header = SERVER_REQUIRED_AUTH_HEADER.get(server)
    if required_auth_header and required_auth_header not in headers:
        if token:
            headers[required_auth_header] = token
    if token and required_auth_header != "authorization" and "authorization" not in headers:
        headers["authorization"] = f"Bearer {token}"

    custom_headers = payload.get("headers", {})
    if custom_headers is not None:
        if not isinstance(custom_headers, dict):
            raise ToolExecutionError("'headers' must be an object")
        for key, value in custom_headers.items():
            if (
                not isinstance(key, str)
                or not key.strip()
                or not isinstance(value, str)
                or not value.strip()
            ):
                raise ToolExecutionError("'headers' keys/values must be non-empty strings")
            headers[key.strip()] = value.strip()

    # Enforce explicit identity header for servers that rely on per-user auth context.
    if required_auth_header and not headers.get(required_auth_header):
        raise ToolExecutionError(
            f"Missing required auth header for {server}: '{required_auth_header}'. "
            "Provide it via tool payload.headers, metadata.mcp_auth_headers, or metadata.mcp_auth_tokens."
        )
    return headers


def execute_tool(tool_name: str, payload: Dict[str, Any]) -> str:
    """
    Unified execution entry: parameter validation + dispatch routing.
    All tool executions should pass through this function.
    """
    if not isinstance(payload, dict):
        raise ToolExecutionError("payload must be a dict")

    if tool_name == "hr.get_role":
        employee_name = _require_str(payload, "employee_name")
        database = {"Alice": "Senior Backend Engineer", "Bob": "Finance Manager"}
        return database.get(employee_name, "Employee not found.")

    if tool_name == "engineer.check_system":
        system_name = _require_str(payload, "system_name")
        if system_name == "payment_gateway":
            return "System payment_gateway is down due to a recent code merge. Needs urgent fix."
        return f"System {system_name} is running normally."

    if tool_name == "finance.check_budget":
        department = _require_str(payload, "department")
        budgets = {"Engineering": 5000, "HR": 1000}
        return f"The {department} department has ${budgets.get(department, 0)} budget remaining."

    if tool_name == "common.calc_add":
        a = _require_number(payload, "a")
        b = _require_number(payload, "b")
        return str(a + b)

    if tool_name == "common.current_time":
        timezone = payload.get("timezone", "UTC")
        if not isinstance(timezone, str) or not timezone.strip():
            raise ToolExecutionError("'timezone' must be a non-empty string")
        try:
            now = datetime.now(ZoneInfo(timezone.strip()))
        except Exception as exc:  # pragma: no cover
            raise ToolExecutionError(f"Invalid timezone: {timezone}") from exc
        return now.isoformat()

    if tool_name == "common.workspace_list_files":
        relative_dir = payload.get("relative_dir", ".")
        if not isinstance(relative_dir, str) or not relative_dir.strip():
            raise ToolExecutionError("'relative_dir' must be a non-empty string")
        return _list_workspace_files(relative_dir)

    if tool_name == "common.workspace_read_file":
        file_path = _require_str(payload, "file_path")
        return _read_workspace_file(file_path)

    if tool_name == "common.workspace_write_file":
        file_path = _require_str(payload, "file_path")
        content = payload.get("content", "")
        if not isinstance(content, str):
            raise ToolExecutionError("'content' must be a string")
        append = _require_bool(payload, "append", default=False)
        return _write_workspace_file(file_path, content, append)

    if tool_name.startswith("mcp.") and tool_name.endswith(".list_tools"):
        parts = tool_name.split(".")
        if len(parts) != 3:
            raise ToolExecutionError(f"Invalid MCP list tool name: {tool_name}")
        server = parts[1]
        if server not in MCP_SERVER_PORTS:
            raise ToolExecutionError(f"Unknown MCP server: {server}")
        force_refresh = payload.get("force_refresh", False)
        if not isinstance(force_refresh, bool):
            raise ToolExecutionError("'force_refresh' must be a boolean")
        brief = payload.get("brief", True)
        if not isinstance(brief, bool):
            raise ToolExecutionError("'brief' must be a boolean")
        headers = _resolve_mcp_headers(server, payload)
        try:
            tools = MCP_BRIDGE.list_tools(
                server=server,
                force_refresh=force_refresh,
                brief=brief,
                headers=headers or None,
            )
        except MCPBridgeError as exc:
            raise ToolExecutionError(str(exc)) from exc
        return json.dumps(tools, ensure_ascii=False)

    if tool_name.startswith("mcp.") and tool_name.endswith(".get_tool_schema"):
        parts = tool_name.split(".")
        if len(parts) != 3:
            raise ToolExecutionError(f"Invalid MCP get schema tool name: {tool_name}")
        server = parts[1]
        if server not in MCP_SERVER_PORTS:
            raise ToolExecutionError(f"Unknown MCP server: {server}")
        mcp_tool_name = _require_str(payload, "tool_name")
        force_refresh = payload.get("force_refresh", False)
        if not isinstance(force_refresh, bool):
            raise ToolExecutionError("'force_refresh' must be a boolean")
        headers = _resolve_mcp_headers(server, payload)
        try:
            schema = MCP_BRIDGE.get_tool_schema(
                server=server,
                tool_name=mcp_tool_name,
                force_refresh=force_refresh,
                headers=headers or None,
            )
        except MCPBridgeError as exc:
            raise ToolExecutionError(str(exc)) from exc
        return json.dumps(schema, ensure_ascii=False)

    if tool_name.startswith("mcp.") and tool_name.endswith(".call_tool"):
        parts = tool_name.split(".")
        if len(parts) != 3:
            raise ToolExecutionError(f"Invalid MCP call tool name: {tool_name}")
        server = parts[1]
        if server not in MCP_SERVER_PORTS:
            raise ToolExecutionError(f"Unknown MCP server: {server}")

        mcp_tool_name = _require_str(payload, "tool_name")
        arguments = payload.get("arguments", {})
        if not isinstance(arguments, dict):
            raise ToolExecutionError("'arguments' must be an object")
        headers = _resolve_mcp_headers(server, payload)
        try:
            return MCP_BRIDGE.call_tool(
                server=server,
                tool_name=mcp_tool_name,
                arguments=arguments,
                headers=headers or None,
            )
        except MCPBridgeError as exc:
            raise ToolExecutionError(str(exc)) from exc

    if tool_name.startswith("mcp.") and tool_name.endswith(".call_tool_knowledge_only"):
        parts = tool_name.split(".")
        if len(parts) != 3:
            raise ToolExecutionError(f"Invalid MCP call tool name: {tool_name}")
        server = parts[1]
        if server not in MCP_SERVER_PORTS:
            raise ToolExecutionError(f"Unknown MCP server: {server}")

        mcp_tool_name = _require_str(payload, "tool_name")
        allowed_tool_names = KNOWLEDGE_TOOL_ALLOWLIST.get(server, set())
        if mcp_tool_name not in allowed_tool_names:
            raise ToolExecutionError(
                f"MCP tool '{mcp_tool_name}' is not allowed in knowledge-only mode. "
                f"Allowed tools for {server}: {sorted(allowed_tool_names)}"
            )
        arguments = payload.get("arguments", {})
        if not isinstance(arguments, dict):
            raise ToolExecutionError("'arguments' must be an object")
        headers = _resolve_mcp_headers(server, payload)
        try:
            return MCP_BRIDGE.call_tool(
                server=server,
                tool_name=mcp_tool_name,
                arguments=arguments,
                headers=headers or None,
            )
        except MCPBridgeError as exc:
            raise ToolExecutionError(str(exc)) from exc

    if tool_name.startswith("mcp.") and tool_name.endswith(".export_state"):
        parts = tool_name.split(".")
        if len(parts) != 3:
            raise ToolExecutionError(f"Invalid MCP export tool name: {tool_name}")
        server = parts[1]
        if server not in MCP_SERVER_PORTS:
            raise ToolExecutionError(f"Unknown MCP server: {server}")

        database_id = _resolve_mcp_database_id(server, payload)
        if not database_id:
            raise ToolExecutionError(
                "'database_id' is required or must already be bound in runtime context"
            )
        tables_raw = payload.get("tables", [])
        if tables_raw is None:
            tables_raw = []
        if not isinstance(tables_raw, list):
            raise ToolExecutionError("'tables' must be an array of table names")
        tables: List[str] = []
        for item in tables_raw:
            if not isinstance(item, str) or not item.strip():
                raise ToolExecutionError("'tables' entries must be non-empty strings")
            tables.append(item.strip())
        where = payload.get("where", {})
        if where is None:
            where = {}
        if not isinstance(where, dict):
            raise ToolExecutionError("'where' must be an object")
        limit = payload.get("limit")
        if limit is None:
            limit_value: Optional[int] = None
        elif isinstance(limit, bool) or not isinstance(limit, int):
            raise ToolExecutionError("'limit' must be an integer")
        else:
            if limit <= 0:
                raise ToolExecutionError("'limit' must be > 0")
            limit_value = int(limit)

        try:
            result = MCP_BRIDGE.export_state(
                server=server,
                database_id=database_id,
                tables=tables or None,
                where=where or None,
                limit=limit_value,
            )
        except MCPBridgeError as exc:
            raise ToolExecutionError(str(exc)) from exc
        return json.dumps(result, ensure_ascii=False)

    if tool_name.startswith("mcp.") and tool_name.endswith(".seed_database"):
        parts = tool_name.split(".")
        if len(parts) != 3:
            raise ToolExecutionError(f"Invalid MCP seed tool name: {tool_name}")
        server = parts[1]
        if server not in MCP_SERVER_PORTS:
            raise ToolExecutionError(f"Unknown MCP server: {server}")

        sql_content = _optional_str(payload, "sql_content")
        sql_file_path = _optional_str(payload, "sql_file_path")
        repos_tar_path = _optional_str(payload, "repos_tar_path")
        if not sql_content and not sql_file_path:
            raise ToolExecutionError("One of 'sql_content' or 'sql_file_path' is required")
        if sql_content and sql_file_path:
            raise ToolExecutionError("Provide only one of 'sql_content' or 'sql_file_path'")

        name = _optional_str(payload, "name")
        description = _optional_str(payload, "description")
        database_id = _optional_str(payload, "database_id")
        seed_timeout = _optional_positive_int(payload, "timeout")

        try:
            created_db_id = MCP_BRIDGE.seed_database(
                server=server,
                sql_content=sql_content,
                sql_file_path=sql_file_path,
                repos_tar_path=repos_tar_path,
                database_id=database_id,
                name=name,
                description=description,
                timeout=seed_timeout,
            )
        except MCPBridgeError as exc:
            raise ToolExecutionError(str(exc)) from exc

        return json.dumps(
            {"server": server, "database_id": created_db_id, "bound_to_runtime_session": False},
            ensure_ascii=False,
        )

    if tool_name.startswith("mcp.") and tool_name.endswith(".delete_database"):
        parts = tool_name.split(".")
        if len(parts) != 3:
            raise ToolExecutionError(f"Invalid MCP delete tool name: {tool_name}")
        server = parts[1]
        if server not in MCP_SERVER_PORTS:
            raise ToolExecutionError(f"Unknown MCP server: {server}")

        database_id = _resolve_mcp_database_id(server, payload)
        if not database_id:
            raise ToolExecutionError(
                "'database_id' is required or must already be bound in runtime context"
            )

        try:
            deleted = MCP_BRIDGE.delete_database(server=server, database_id=database_id)
        except MCPBridgeError as exc:
            raise ToolExecutionError(str(exc)) from exc

        return json.dumps(
            {"server": server, "database_id": database_id, "deleted": deleted},
            ensure_ascii=False,
        )

    raise ToolExecutionError(f"Unknown tool: {tool_name}")
