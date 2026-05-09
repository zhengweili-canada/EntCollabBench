from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List

from tool.mcp_bridge import MCP_SERVER_PORTS


@dataclass(frozen=True)
class ToolMeta:
    key: str
    domain: str
    summary: str


TOOLS: Dict[str, ToolMeta] = {
    "hr.get_role": ToolMeta(
        key="hr.get_role",
        domain="hr",
        summary="Get employee role",
    ),
    "engineer.check_system": ToolMeta(
        key="engineer.check_system",
        domain="engineer",
        summary="Check system status",
    ),
    "finance.check_budget": ToolMeta(
        key="finance.check_budget",
        domain="finance",
        summary="Check department budget",
    ),
    "common.calc_add": ToolMeta(
        key="common.calc_add",
        domain="common",
        summary="Add two numbers",
    ),
    "common.current_time": ToolMeta(
        key="common.current_time",
        domain="common",
        summary="Get current time",
    ),
    "common.workspace_list_files": ToolMeta(
        key="common.workspace_list_files",
        domain="common",
        summary="List agent workspace files/directories",
    ),
    "common.workspace_read_file": ToolMeta(
        key="common.workspace_read_file",
        domain="common",
        summary="Read agent workspace file content",
    ),
    "common.workspace_write_file": ToolMeta(
        key="common.workspace_write_file",
        domain="common",
        summary="Write agent workspace file content",
    ),
}

for _server in sorted(MCP_SERVER_PORTS.keys()):
    TOOLS[f"mcp.{_server}.list_tools"] = ToolMeta(
        key=f"mcp.{_server}.list_tools",
        domain="mcp",
        summary=f"List available MCP tools on {_server} (compact)",
    )
    TOOLS[f"mcp.{_server}.get_tool_schema"] = ToolMeta(
        key=f"mcp.{_server}.get_tool_schema",
        domain="mcp",
        summary=f"Get MCP tool schema on {_server}",
    )
    TOOLS[f"mcp.{_server}.call_tool"] = ToolMeta(
        key=f"mcp.{_server}.call_tool",
        domain="mcp",
        summary=f"Call MCP tool on {_server}",
    )

for _server in ["itsm", "hr", "csm"]:
    TOOLS[f"mcp.{_server}.call_tool_knowledge_only"] = ToolMeta(
        key=f"mcp.{_server}.call_tool_knowledge_only",
        domain="mcp",
        summary=f"Call knowledge-base MCP tools only on {_server}",
    )


def list_tool_keys() -> List[str]:
    """Return all registered tool keys."""
    return list(TOOLS.keys())


def get_langchain_tool(tool_key: str):
    """Get a LangChain tool object by key."""
    if tool_key not in TOOLS:
        raise KeyError(f"Unknown tool key: {tool_key}")
    # Lazy import to avoid hard dependency on langchain in listing-only flows.
    from tool.langchain_tools import LANGCHAIN_TOOL_REGISTRY

    return LANGCHAIN_TOOL_REGISTRY[tool_key]
