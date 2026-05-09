from __future__ import annotations

from typing import Dict, List

from tool.mcp_bridge import MCP_SERVER_PORTS
from tool.tool_registry import get_langchain_tool


def _mcp_tool_keys_for_servers(servers: List[str]) -> List[str]:
    tool_keys: List[str] = []
    for server in servers:
        tool_keys.append(f"mcp.{server}.list_tools")
        tool_keys.append(f"mcp.{server}.get_tool_schema")
        tool_keys.append(f"mcp.{server}.call_tool")
    return tool_keys


def _mcp_knowledge_only_tool_keys_for_servers(servers: List[str]) -> List[str]:
    tool_keys: List[str] = []
    for server in servers:
        tool_keys.append(f"mcp.{server}.list_tools")
        tool_keys.append(f"mcp.{server}.get_tool_schema")
        tool_keys.append(f"mcp.{server}.call_tool_knowledge_only")
    return tool_keys


SPECIALIZED_MCP_SERVERS = {"itsm", "hr", "csm", "gitea"}
COMMON_MCP_SERVERS = sorted([s for s in MCP_SERVER_PORTS.keys() if s not in SPECIALIZED_MCP_SERVERS])

# Small groups (by domain capability)
DOMAIN_TOOLSETS: Dict[str, List[str]] = {
    "domain.common.basic": [
        "common.workspace_list_files",
        "common.workspace_read_file"
    ],
    # Common MCP: excludes role-specialized itsm/hr/csm/gitea
    "domain.mcp.common": _mcp_tool_keys_for_servers(COMMON_MCP_SERVERS),
    "domain.mcp.itsm": _mcp_tool_keys_for_servers(["itsm"]),
    "domain.mcp.hr": _mcp_tool_keys_for_servers(["hr"]),
    "domain.mcp.csm": _mcp_tool_keys_for_servers(["csm"]),
    "domain.mcp.gitea": _mcp_tool_keys_for_servers(["gitea"]),
    # Knowledge-base specialist: allow only KB-related ITSM/HR/CSM interfaces
    "domain.mcp.kb_cross": _mcp_knowledge_only_tool_keys_for_servers(
        ["itsm", "hr", "csm"]
    ),
}


def _with_common_mcp(extra_groups: List[str]) -> List[str]:
    return ["domain.mcp.common", *extra_groups]


# Large groups (by agent role responsibility)
# Note: keys keep English role aliases for direct use in agent_specs.json.
AGENT_TOOLSET_KEYS: Dict[str, List[str]] = {
    # IT service desk L1 engineer
    "it_service_desk_l1": _with_common_mcp(["domain.mcp.itsm"]),

    # IT problem/change engineer
    "it_change_engineer": _with_common_mcp(["domain.mcp.itsm"]),

    # HR service specialist
    "hr_service_specialist": _with_common_mcp(["domain.mcp.hr"]),

    # Customer support specialist
    "customer_support_specialist": _with_common_mcp(["domain.mcp.csm"]),

    # Knowledge-base specialist (cross ITSM/HR/CSM, interface-level restrictions)
    "knowledge_base_specialist": _with_common_mcp(["domain.mcp.kb_cross"]),

    # Collaboration operations specialist (common MCP only)
    "collaboration_ops_specialist": _with_common_mcp([]),

    # Developer engineer
    "developer_engineer": _with_common_mcp(["domain.mcp.gitea"]),

    # QA/test engineer
    "qa_test_engineer": _with_common_mcp(["domain.mcp.gitea"]),

    # Finance approval specialist (basic local capabilities only)
    "finance_approval_specialist": ["domain.common.basic"],

    # Legal approval specialist (basic local capabilities only)
    "legal_approval_specialist": ["domain.common.basic"],

    # Procurement approval specialist (basic local capabilities only)
    "procurement_approval_specialist": ["domain.common.basic"],
}
def resolve_tool_keys_from_groups(group_keys: List[str]) -> List[str]:
    all_tool_keys: List[str] = []
    for group_key in group_keys:
        if group_key not in DOMAIN_TOOLSETS:
            raise KeyError(f"Unknown tool group: {group_key}")
        all_tool_keys.extend(DOMAIN_TOOLSETS[group_key])

    # De-duplicate while preserving order
    seen = set()
    deduped = []
    for key in all_tool_keys:
        if key not in seen:
            seen.add(key)
            deduped.append(key)
    return deduped


def get_agent_tools(agent_name: str):
    """Return the currently visible tool set for an agent (LangChain tool objects)."""
    if agent_name not in AGENT_TOOLSET_KEYS:
        raise KeyError(f"Unknown agent toolset: {agent_name}")

    tool_keys = resolve_tool_keys_from_groups(AGENT_TOOLSET_KEYS[agent_name])
    return [get_langchain_tool(k) for k in tool_keys]
