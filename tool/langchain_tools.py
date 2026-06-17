from __future__ import annotations

import json
import os
import sys
from langchain_core.tools import tool

from tool.tool_executor import ToolExecutionError, execute_tool
from tool.mcp_bridge import MCP_SERVER_PORTS


def _get_container_agent_name() -> str:
    """
    Read agent name from --agent-name CLI argument or AGENT_NAME env var.
    Each container runs: python agent.py --agent-name {name} --port {port}
    """
    # Try CLI args first (most reliable)
    args = sys.argv
    for i, arg in enumerate(args):
        if arg == "--agent-name" and i + 1 < len(args):
            return args[i + 1].strip()
    # Fallback to env var
    return os.getenv("AGENT_NAME", "").strip()

_CONTAINER_AGENT_NAME: str = _get_container_agent_name() 


def _schema_context_mode() -> str:
    mode = os.getenv("MCP_SCHEMA_CONTEXT_MODE", "full").strip().lower()
    if mode not in {"full", "compact", "placeholder"}:
        return "full"
    return mode


def _parse_json_obj(raw: str) -> object:
    text = (raw or "").strip()
    if not text:
        return None
    try:
        return json.loads(text)
    except Exception:
        return None


def _compact_list_tools_output(server: str, raw: str) -> str:
    mode = _schema_context_mode()
    if mode == "full":
        return raw
    obj = _parse_json_obj(raw)
    names: list[str] = []
    if isinstance(obj, list):
        for item in obj:
            if isinstance(item, dict):
                name = str(item.get("tool_name") or item.get("name") or "").strip()
                if name:
                    names.append(name)
    elif isinstance(obj, dict):
        # Compatibility fallback for non-list payloads.
        for k in ("tool_name", "name"):
            name = str(obj.get(k) or "").strip()
            if name:
                names.append(name)
                break
    names = list(dict.fromkeys(names))
    if mode == "placeholder":
        return json.dumps(
            {
                "server": server,
                "event": "mcp_list_tools",
                "tool_count": len(names),
                "data": "<omitted>",
            },
            ensure_ascii=False,
        )
    return json.dumps(
        {
            "server": server,
            "event": "mcp_list_tools",
            "tool_count": len(names),
            "tool_names": names[:60],
            "truncated": len(names) > 60,
        },
        ensure_ascii=False,
    )


def _compact_get_schema_output(server: str, tool_name: str, raw: str) -> str:
    mode = _schema_context_mode()
    if mode == "full":
        return raw
    obj = _parse_json_obj(raw)
    resolved_tool_name = tool_name
    required: list[str] = []
    properties: list[str] = []
    if isinstance(obj, dict):
        resolved_tool_name = str(obj.get("tool_name") or resolved_tool_name).strip() or tool_name
        schema = obj.get("inputSchema")
        if isinstance(schema, dict):
            req = schema.get("required")
            if isinstance(req, list):
                required = [str(x) for x in req if isinstance(x, (str, int, float))]
            props = schema.get("properties")
            if isinstance(props, dict):
                properties = [str(k) for k in props.keys()]
    if mode == "placeholder":
        return json.dumps(
            {
                "server": server,
                "event": "mcp_get_tool_schema",
                "tool_name": resolved_tool_name,
                "data": "<omitted>",
            },
            ensure_ascii=False,
        )
    return json.dumps(
        {
            "server": server,
            "event": "mcp_get_tool_schema",
            "tool_name": resolved_tool_name,
            "required_fields": required[:40],
            "property_names": properties[:120],
            "property_count": len(properties),
            "truncated": len(properties) > 120,
        },
        ensure_ascii=False,
    )


@tool
def mcp_hr_get_role(employee_name: str) -> str:
    """Look up an employee's role and department."""
    try:
        return execute_tool("hr.get_role", {"employee_name": employee_name})
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


@tool
def mcp_engineer_check_system(system_name: str) -> str:
    """Check a system's runtime status."""
    try:
        return execute_tool("engineer.check_system", {"system_name": system_name})
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


@tool
def mcp_finance_check_budget(department: str) -> str:
    """Check the remaining budget for a department."""
    try:
        return execute_tool("finance.check_budget", {"department": department})
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


@tool
def tool_calculator_add(a: float, b: float) -> str:
    """Add two numbers and return the result."""
    try:
        return execute_tool("common.calc_add", {"a": a, "b": b})
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


@tool
def tool_current_time(timezone: str = "UTC") -> str:
    """Get the current time for a timezone (for example: UTC, Asia/Shanghai)."""
    try:
        return execute_tool("common.current_time", {"timezone": timezone})
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


@tool
def tool_workspace_list_files(relative_dir: str = ".") -> str:
    """List entries under AGENT_WORKSPACE_DIR/relative_dir (default relative_dir: '.')."""
    try:
        return execute_tool("common.workspace_list_files", {"relative_dir": relative_dir})
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


@tool
def tool_workspace_read_file(file_path: str) -> str:
    """Read a file at AGENT_WORKSPACE_DIR/file_path. `file_path` must be workspace-relative."""
    try:
        return execute_tool("common.workspace_read_file", {"file_path": file_path})
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


@tool
def tool_workspace_write_file(file_path: str, content: str, append: bool = False) -> str:
    """Write a file in the agent workspace (supports append mode)."""
    try:
        return execute_tool(
            "common.workspace_write_file",
            {"file_path": file_path, "content": content, "append": append},
        )
    except ToolExecutionError as exc:
        return f"Tool error: {exc}"


def _make_mcp_list_tool(server: str):
    def _mcp_list_tools(force_refresh: bool = False, brief: bool = True, database_id: str = "") -> str:
        try:
            payload = {"force_refresh": force_refresh, "brief": brief}
            if database_id.strip():
                payload["database_id"] = database_id.strip()
            raw = execute_tool(
                f"mcp.{server}.list_tools",
                payload,
            )
            return _compact_list_tools_output(server, raw)
        except ToolExecutionError as exc:
            return f"Tool error: {exc}"

    _mcp_list_tools.__name__ = f"mcp_{server}_list_tools"
    _mcp_list_tools.__doc__ = (
        f"List available MCP tools on server '{server}'. "
        "Returns concise tool_name+summary by default; set brief=false for full schemas."
    )
    return tool(_mcp_list_tools)


def _make_mcp_get_tool_schema_tool(server: str):
    def _mcp_get_tool_schema(tool_name: str, force_refresh: bool = False, database_id: str = "") -> str:
        try:
            payload = {"tool_name": tool_name, "force_refresh": force_refresh}
            if database_id.strip():
                payload["database_id"] = database_id.strip()
            raw = execute_tool(
                f"mcp.{server}.get_tool_schema",
                payload,
            )
            return _compact_get_schema_output(server, tool_name, raw)
        except ToolExecutionError as exc:
            return f"Tool error: {exc}"

    _mcp_get_tool_schema.__name__ = f"mcp_{server}_get_tool_schema"
    _mcp_get_tool_schema.__doc__ = (
        f"Get input schema/details for one MCP tool on server '{server}' by tool name."
    )
    return tool(_mcp_get_tool_schema)

def _make_mcp_call_tool(server: str):
    def _mcp_call_tool(tool_name: str, arguments_json: str = "{}", database_id: str = "") -> str:
        # ── Stage 3: Capability-Scoped Access ──────────────────────────────
        # Check authorization BEFORE the tool call reaches the MCP server.
        # server is captured from outer closure (e.g. "email", "itsm").
        # agent_name comes from tool runtime context set at request time.
        try:
            from my_verification.verification_pipeline import check_stage3
            from tool.tool_executor import _get_tool_runtime_context
            ctx = _get_tool_runtime_context()
            agent_name = ctx.get("agent_name", "") or _CONTAINER_AGENT_NAME
            if agent_name:
                full_tool_name = f"mcp_{server}_{tool_name}"
                _s3_error = check_stage3(
                    agent_name=agent_name,
                    tool_name=full_tool_name,
                )
                if _s3_error:
                    return _s3_error
        except Exception:
            pass  # fail open — never break execution due to Stage 3
        # ───────────────────────────────────────────────────────────────────

        try:
            args = json.loads(arguments_json)
            if not isinstance(args, dict):
                return "Tool error: arguments_json must decode to a JSON object"
            payload = {
                "tool_name": tool_name,
                "arguments": args,
            }
            if database_id.strip():
                payload["database_id"] = database_id.strip()
            return execute_tool(
                f"mcp.{server}.call_tool",
                payload,
            )
        except json.JSONDecodeError as exc:
            return f"Tool error: invalid arguments_json: {exc}"
        except ToolExecutionError as exc:
            return f"Tool error: {exc}"
    _mcp_call_tool.__name__ = f"mcp_{server}_call_tool"
    _mcp_call_tool.__doc__ = (
        f"Call a tool on MCP server '{server}'. "
        "Pass MCP tool name and arguments_json."
    )
    return tool(_mcp_call_tool)

def _make_mcp_knowledge_call_tool(server: str):
    def _mcp_call_knowledge_tool(tool_name: str, arguments_json: str = "{}", database_id: str = "") -> str:
        try:
            args = json.loads(arguments_json)
            if not isinstance(args, dict):
                return "Tool error: arguments_json must decode to a JSON object"
            payload = {
                "tool_name": tool_name,
                "arguments": args,
            }
            if database_id.strip():
                payload["database_id"] = database_id.strip()
            return execute_tool(
                f"mcp.{server}.call_tool_knowledge_only",
                payload,
            )
        except json.JSONDecodeError as exc:
            return f"Tool error: invalid arguments_json: {exc}"
        except ToolExecutionError as exc:
            return f"Tool error: {exc}"

    _mcp_call_knowledge_tool.__name__ = f"mcp_{server}_call_knowledge_tool"
    _mcp_call_knowledge_tool.__doc__ = (
        f"Call knowledge-only tools on MCP server '{server}'. "
        "Only knowledge/article/kb related MCP tool names are allowed."
    )
    return tool(_mcp_call_knowledge_tool)


LANGCHAIN_TOOL_REGISTRY = {
    "hr.get_role": mcp_hr_get_role,
    "engineer.check_system": mcp_engineer_check_system,
    "finance.check_budget": mcp_finance_check_budget,
    "common.calc_add": tool_calculator_add,
    "common.current_time": tool_current_time,
    "common.workspace_list_files": tool_workspace_list_files,
    "common.workspace_read_file": tool_workspace_read_file,
    "common.workspace_write_file": tool_workspace_write_file,
}

for _server in sorted(MCP_SERVER_PORTS.keys()):
    LANGCHAIN_TOOL_REGISTRY[f"mcp.{_server}.list_tools"] = _make_mcp_list_tool(_server)
    LANGCHAIN_TOOL_REGISTRY[f"mcp.{_server}.get_tool_schema"] = _make_mcp_get_tool_schema_tool(_server)
    LANGCHAIN_TOOL_REGISTRY[f"mcp.{_server}.call_tool"] = _make_mcp_call_tool(_server)

for _server in ["itsm", "hr", "csm"]:
    LANGCHAIN_TOOL_REGISTRY[f"mcp.{_server}.call_tool_knowledge_only"] = _make_mcp_knowledge_call_tool(_server)
