from __future__ import annotations

import json
import os
import random
import string
import tempfile
from pathlib import Path
from threading import Lock
from time import time
from datetime import datetime
from typing import Any, Dict, List, Optional
from urllib import request as urlrequest
from urllib import error as urlerror

import anyio
from mcp import ClientSession
from mcp.client.sse import sse_client
from mcp.client.streamable_http import streamablehttp_client
from tool.gitea_isolation import GITEA_ISOLATION_MANAGER, GiteaIsolationError


MCP_SERVER_PORTS: Dict[str, int] = {
    "calendar": 8003,
    "csm": 8001,
    "drive": 8009,
    "email": 8004,
    "gitea": 8011,
    "hr": 8010,
    "itsm": 8006,
    "teams": 8002,
}


def _default_mcp_endpoints() -> Dict[str, str]:
    host = os.getenv("MCP_HOST", "host.docker.internal")
    return {name: f"http://{host}:{port}/mcp" for name, port in MCP_SERVER_PORTS.items()}


def _parse_endpoint_json(raw: str, source_name: str) -> Dict[str, str]:
    parsed = json.loads(raw)
    if not isinstance(parsed, dict):
        raise ValueError(f"{source_name} must be a JSON object")

    endpoints: Dict[str, str] = {}
    for k, v in parsed.items():
        if not isinstance(k, str) or not k.strip() or not isinstance(v, str) or not v.strip():
            raise ValueError(f"{source_name} keys/values must be non-empty strings")
        endpoints[k.strip()] = v.strip()
    return endpoints


def load_mcp_endpoints() -> Dict[str, str]:
    endpoints_file = os.getenv("MCP_ENDPOINTS_FILE", "/app/config/mcp_endpoints.json").strip()
    if endpoints_file:
        path = Path(endpoints_file)
        if path.exists():
            raw = path.read_text(encoding="utf-8")
            return _parse_endpoint_json(raw, "MCP endpoints file")

    raw = os.getenv("MCP_ENDPOINTS_JSON", "").strip()
    if not raw:
        return _default_mcp_endpoints()
    return _parse_endpoint_json(raw, "MCP_ENDPOINTS_JSON")


class MCPBridgeError(RuntimeError):
    pass


class MCPBridge:
    def __init__(self, cache_ttl_seconds: int = 30):
        self.cache_ttl_seconds = cache_ttl_seconds
        self._cache_lock = Lock()
        self._tool_cache: Dict[str, Dict[str, Any]] = {}

    def _get_endpoint(self, server: str) -> str:
        endpoints = load_mcp_endpoints()
        endpoint = endpoints.get(server)
        if not endpoint:
            raise MCPBridgeError(f"Unknown MCP server '{server}' or missing endpoint config")
        return endpoint

    @staticmethod
    def _extract_database_id(headers: Optional[Dict[str, str]]) -> str:
        if not headers:
            return ""
        value = headers.get("x-database-id", "")
        if isinstance(value, str):
            return value.strip()
        return ""

    def _resolve_endpoint_for_request(
        self,
        server: str,
        headers: Optional[Dict[str, str]] = None,
    ) -> str:
        if server == "gitea":
            db_id = self._extract_database_id(headers)
            if db_id:
                endpoint = GITEA_ISOLATION_MANAGER.get_endpoint(db_id)
                if not endpoint:
                    raise MCPBridgeError(
                        f"Unknown gitea database_id '{db_id}'. "
                        "Please seed first via mcp.gitea.seed_database."
                    )
                return endpoint.rstrip("/")
        return self._get_endpoint(server).rstrip("/")

    @staticmethod
    def _format_exception(exc: Exception) -> str:
        # Python 3.11+ ExceptionGroup can be deeply nested and opaque by default.
        if hasattr(exc, "exceptions"):
            sub_errors: List[str] = []

            def _flatten(err: Exception) -> None:
                if hasattr(err, "exceptions"):
                    for sub in getattr(err, "exceptions", []):
                        _flatten(sub)
                    return
                sub_errors.append(f"{type(err).__name__}: {err}")

            _flatten(exc)
            if sub_errors:
                return f"{type(exc).__name__}: " + " | ".join(sub_errors)
        return f"{type(exc).__name__}: {exc}"

    @staticmethod
    def _post_json(url: str, payload: Dict[str, Any], headers: Dict[str, str], timeout: int = 20):
        req = urlrequest.Request(
            url=url,
            data=json.dumps(payload).encode("utf-8"),
            headers=headers,
            method="POST",
        )
        try:
            with urlrequest.urlopen(req, timeout=timeout) as resp:
                body = resp.read().decode("utf-8")
                return resp, json.loads(body) if body else {}
        except urlerror.HTTPError as exc:
            try:
                body = exc.read().decode("utf-8")
            except Exception:
                body = ""
            raise MCPBridgeError(f"HTTP {exc.code} from {url}: {body}") from exc

    @staticmethod
    def _get_json(url: str, headers: Dict[str, str], timeout: int = 20) -> Dict[str, Any]:
        req = urlrequest.Request(
            url=url,
            headers=headers,
            method="GET",
        )
        try:
            with urlrequest.urlopen(req, timeout=timeout) as resp:
                body = resp.read().decode("utf-8")
                obj = json.loads(body) if body else {}
                if not isinstance(obj, dict):
                    raise MCPBridgeError(f"GET {url} returned non-object payload")
                return obj
        except urlerror.HTTPError as exc:
            try:
                body = exc.read().decode("utf-8")
            except Exception:
                body = ""
            raise MCPBridgeError(f"HTTP {exc.code} from {url}: {body}") from exc

    def _jsonrpc_initialize_headers(
        self, mcp_url: str, extra_headers: Optional[Dict[str, str]] = None
    ) -> Dict[str, str]:
        headers = {
            "Content-Type": "application/json",
            "Accept": "application/json, text/event-stream",
        }
        if extra_headers:
            headers.update(extra_headers)

        init_payload = {
            "jsonrpc": "2.0",
            "id": 1,
            "method": "initialize",
            "params": {
                "protocolVersion": "2024-11-05",
                "capabilities": {"tools": {}},
                "clientInfo": {"name": "company-agentteam-bridge", "version": "1.0.0"},
            },
        }
        resp, _ = self._post_json(mcp_url, init_payload, headers=headers)
        session_id = resp.headers.get("mcp-session-id")
        if session_id:
            headers["mcp-session-id"] = session_id

        notif_payload = {
            "jsonrpc": "2.0",
            "method": "notifications/initialized",
            "params": {},
        }
        try:
            self._post_json(mcp_url, notif_payload, headers=headers)
        except Exception:
            pass
        return headers

    def _list_tools_jsonrpc_fallback(
        self,
        mcp_url: str,
        headers: Optional[Dict[str, str]] = None,
    ) -> List[Dict[str, Any]]:
        headers = self._jsonrpc_initialize_headers(mcp_url, extra_headers=headers)
        list_payload = {
            "jsonrpc": "2.0",
            "id": 2,
            "method": "tools/list",
            "params": {},
        }
        _, data = self._post_json(mcp_url, list_payload, headers=headers)
        tools = data.get("result", {}).get("tools", [])
        if not isinstance(tools, list):
            raise ValueError(f"Invalid tools/list result: {data}")
        return tools

    def _call_tool_jsonrpc_fallback(
        self,
        mcp_url: str,
        tool_name: str,
        arguments: Dict[str, Any],
        headers: Optional[Dict[str, str]] = None,
    ) -> str:
        headers = self._jsonrpc_initialize_headers(mcp_url, extra_headers=headers)
        call_payload = {
            "jsonrpc": "2.0",
            "id": 3,
            "method": "tools/call",
            "params": {
                "name": tool_name,
                "arguments": arguments,
            },
        }
        _, data = self._post_json(mcp_url, call_payload, headers=headers)

        if "error" in data:
            raise MCPBridgeError(json.dumps(data["error"], ensure_ascii=False))

        result = data.get("result", {})
        if result.get("structuredContent") is not None:
            return json.dumps(result["structuredContent"], ensure_ascii=False)

        texts: List[str] = []
        for item in result.get("content", []) or []:
            if isinstance(item, dict) and item.get("type") == "text":
                text = item.get("text", "")
                if text:
                    texts.append(str(text))
            else:
                texts.append(json.dumps(item, ensure_ascii=False))

        payload = "\n".join(texts).strip()
        if result.get("isError"):
            raise MCPBridgeError(payload or f"MCP tool '{tool_name}' returned error")
        return payload or ""

    @staticmethod
    def _candidate_endpoints(endpoint: str) -> List[str]:
        endpoint = endpoint.rstrip("/")
        candidates: List[str] = [endpoint]

        root = endpoint
        if endpoint.endswith("/mcp"):
            root = endpoint[:-4]
            candidates.extend([root, root + "/sse"])
        elif endpoint.endswith("/sse"):
            root = endpoint[:-4]
            candidates.extend([root, root + "/mcp"])
        else:
            root = endpoint
            candidates.extend([root + "/mcp", root + "/sse"])

        # dedupe while preserving order
        seen = set()
        deduped: List[str] = []
        for c in candidates:
            c = c.rstrip("/")
            if c not in seen:
                seen.add(c)
                deduped.append(c)
        return deduped

    async def _list_tools_via_streamable(
        self,
        endpoint: str,
        headers: Optional[Dict[str, str]] = None,
    ) -> List[Dict[str, Any]]:
        tools: List[Dict[str, Any]] = []
        async with streamablehttp_client(endpoint, headers=headers) as (
            read_stream,
            write_stream,
            _,
        ):
            async with ClientSession(read_stream, write_stream) as session:
                await session.initialize()
                cursor = None
                while True:
                    result = await session.list_tools(cursor=cursor)
                    for t in result.tools:
                        tools.append(
                            {
                                "name": t.name,
                                "title": t.title,
                                "description": t.description,
                                "inputSchema": t.inputSchema,
                            }
                        )
                    cursor = result.nextCursor
                    if not cursor:
                        break
        return tools

    async def _list_tools_via_sse(
        self,
        endpoint: str,
        headers: Optional[Dict[str, str]] = None,
    ) -> List[Dict[str, Any]]:
        tools: List[Dict[str, Any]] = []
        async with sse_client(endpoint, headers=headers) as (read_stream, write_stream):
            async with ClientSession(read_stream, write_stream) as session:
                await session.initialize()
                cursor = None
                while True:
                    result = await session.list_tools(cursor=cursor)
                    for t in result.tools:
                        tools.append(
                            {
                                "name": t.name,
                                "title": t.title,
                                "description": t.description,
                                "inputSchema": t.inputSchema,
                            }
                        )
                    cursor = result.nextCursor
                    if not cursor:
                        break
        return tools

    async def _call_tool_via_streamable(
        self,
        endpoint: str,
        tool_name: str,
        arguments: Dict[str, Any],
        headers: Optional[Dict[str, str]] = None,
    ):
        async with streamablehttp_client(endpoint, headers=headers) as (
            read_stream,
            write_stream,
            _,
        ):
            async with ClientSession(read_stream, write_stream) as session:
                await session.initialize()
                return await session.call_tool(tool_name, arguments)

    async def _call_tool_via_sse(
        self,
        endpoint: str,
        tool_name: str,
        arguments: Dict[str, Any],
        headers: Optional[Dict[str, str]] = None,
    ):
        async with sse_client(endpoint, headers=headers) as (read_stream, write_stream):
            async with ClientSession(read_stream, write_stream) as session:
                await session.initialize()
                return await session.call_tool(tool_name, arguments)

    async def _list_tools_async(
        self,
        server: str,
        headers: Optional[Dict[str, str]] = None,
    ) -> List[Dict[str, Any]]:
        endpoint = self._resolve_endpoint_for_request(server, headers=headers)
        errors: List[str] = []
        for candidate in self._candidate_endpoints(endpoint):
            try:
                if candidate.endswith("/sse"):
                    return await self._list_tools_via_sse(candidate, headers=headers)
                return await self._list_tools_via_streamable(candidate, headers=headers)
            except Exception as exc:
                errors.append(f"{candidate} -> {self._format_exception(exc)}")
                if candidate.endswith("/mcp"):
                    try:
                        return self._list_tools_jsonrpc_fallback(candidate, headers=headers)
                    except Exception as sub_exc:
                        errors.append(
                            f"{candidate} -> JSONRPCFallbackError: {self._format_exception(sub_exc)}"
                        )
        raise MCPBridgeError(" ; ".join(errors))

    async def _call_tool_async(
        self,
        server: str,
        tool_name: str,
        arguments: Dict[str, Any],
        headers: Optional[Dict[str, str]] = None,
    ) -> str:
        endpoint = self._resolve_endpoint_for_request(server, headers=headers)
        result = None
        errors: List[str] = []
        for candidate in self._candidate_endpoints(endpoint):
            try:
                if candidate.endswith("/sse"):
                    result = await self._call_tool_via_sse(
                        candidate,
                        tool_name,
                        arguments,
                        headers=headers,
                    )
                else:
                    result = await self._call_tool_via_streamable(
                        candidate,
                        tool_name,
                        arguments,
                        headers=headers,
                    )
                break
            except Exception as exc:
                errors.append(f"{candidate} -> {self._format_exception(exc)}")
                if candidate.endswith("/mcp"):
                    try:
                        return self._call_tool_jsonrpc_fallback(
                            mcp_url=candidate,
                            tool_name=tool_name,
                            arguments=arguments,
                            headers=headers,
                        )
                    except Exception as sub_exc:
                        errors.append(
                            f"{candidate} -> JSONRPCFallbackError: {self._format_exception(sub_exc)}"
                        )
        if result is None:
            raise MCPBridgeError(" ; ".join(errors))

        if result.structuredContent is not None:
            return json.dumps(result.structuredContent, ensure_ascii=False)

        texts: List[str] = []
        for item in result.content:
            if getattr(item, "type", "") == "text":
                text = getattr(item, "text", "")
                if text:
                    texts.append(str(text))
            else:
                texts.append(json.dumps(item.model_dump(), ensure_ascii=False))

        payload = "\n".join(texts).strip()
        if result.isError:
            raise MCPBridgeError(payload or f"MCP tool '{tool_name}' returned error")
        return payload or ""

    @staticmethod
    def _base_url_from_endpoint(endpoint: str) -> str:
        endpoint = endpoint.rstrip("/")
        if endpoint.endswith("/mcp"):
            return endpoint[:-4]
        if endpoint.endswith("/sse"):
            return endpoint[:-4]
        return endpoint

    @staticmethod
    def _generate_database_id() -> str:
        timestamp = int(time() * 1000)
        suffix = "".join(random.choices(string.ascii_lowercase + string.digits, k=9))
        return f"db_{timestamp}_{suffix}"

    def seed_database(
        self,
        server: str,
        *,
        sql_content: Optional[str] = None,
        sql_file_path: Optional[str] = None,
        repos_tar_path: Optional[str] = None,
        database_id: Optional[str] = None,
        name: Optional[str] = None,
        description: Optional[str] = None,
        timeout: Optional[int] = None,
    ) -> str:
        if sql_content and sql_file_path:
            raise MCPBridgeError("Provide only one of sql_content or sql_file_path")
        if not sql_content and not sql_file_path:
            raise MCPBridgeError("One of sql_content or sql_file_path is required")

        db_id = (database_id or "").strip() or self._generate_database_id()

        if server == "gitea":
            tmp_path: Optional[Path] = None
            sql_path = sql_file_path
            if not sql_path:
                assert sql_content is not None
                fd, tmp_name = tempfile.mkstemp(prefix=f"{db_id}_", suffix=".sql")
                os.close(fd)
                tmp_path = Path(tmp_name)
                tmp_path.write_text(sql_content, encoding="utf-8")
                sql_path = str(tmp_path)
            try:
                runtime = GITEA_ISOLATION_MANAGER.create_runtime(
                    database_id=db_id,
                    sql_file_path=sql_path,
                    repos_tar_path=repos_tar_path,
                )
                return runtime.database_id
            except GiteaIsolationError as exc:
                raise MCPBridgeError(f"Failed to seed gitea runtime: {exc}") from exc
            finally:
                if tmp_path:
                    try:
                        tmp_path.unlink(missing_ok=True)
                    except Exception:
                        pass

        if sql_file_path:
            path = Path(sql_file_path)
            if not path.exists() or not path.is_file():
                raise MCPBridgeError(f"SQL file not found: {sql_file_path}")
            sql_content = path.read_text(encoding="utf-8")

        assert sql_content is not None  # for type checker
        payload = {
            "database_id": db_id,
            "name": name or f"Auto DB {datetime.now().strftime('%Y%m%d_%H%M%S')}",
            "description": description or "Seeded by CompanyAgentTeam MCP bridge",
            "sql_content": sql_content,
        }

        endpoint = self._get_endpoint(server)
        seed_url = f"{self._base_url_from_endpoint(endpoint)}/api/seed-database"
        headers = {"Content-Type": "application/json", "Accept": "application/json"}
        seed_timeout = int(timeout) if isinstance(timeout, int) and timeout > 0 else 1200
        try:
            _, response = self._post_json(seed_url, payload, headers=headers, timeout=seed_timeout)
        except Exception as exc:
            raise MCPBridgeError(f"Failed to seed database on '{server}': {exc}") from exc

        if isinstance(response, dict):
            returned_id = response.get("database_id")
            if isinstance(returned_id, str) and returned_id.strip():
                return returned_id.strip()
        return db_id

    def export_state(
        self,
        server: str,
        *,
        database_id: str,
        tables: Optional[List[str]] = None,
        where: Optional[Dict[str, Any]] = None,
        limit: Optional[int] = None,
    ) -> Dict[str, Any]:
        db_id = str(database_id or "").strip()
        if not db_id:
            raise MCPBridgeError("'database_id' is required for export_state")

        if server == "gitea":
            try:
                return GITEA_ISOLATION_MANAGER.export_state(
                    database_id=db_id,
                    tables=tables,
                    limit=int(limit) if isinstance(limit, int) else 2000,
                )
            except GiteaIsolationError as exc:
                raise MCPBridgeError(f"Failed to export gitea state: {exc}") from exc

        endpoint = self._get_endpoint(server)
        base = self._base_url_from_endpoint(endpoint)
        # Preferred custom endpoint (if available), with fallback to built-in database-state.
        export_url = f"{base}/api/export-state"
        payload: Dict[str, Any] = {"database_id": db_id}
        request_tables: List[str] = []
        if tables:
            request_tables = [str(t).strip() for t in tables if str(t).strip()]
            if request_tables:
                payload["tables"] = request_tables
        if where and isinstance(where, dict):
            payload["where"] = where
        if isinstance(limit, int) and limit > 0:
            payload["limit"] = int(limit)

        headers = {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "x-database-id": db_id,
        }
        try:
            _, response = self._post_json(export_url, payload, headers=headers, timeout=300)
            if not isinstance(response, dict):
                raise MCPBridgeError(f"export_state returned non-object payload on '{server}'")
            return response
        except Exception:
            pass

        state_url = f"{base}/api/database-state"
        try:
            response = self._get_json(state_url, headers=headers, timeout=120)
        except Exception as exc:
            raise MCPBridgeError(f"Failed to export state on '{server}': {exc}") from exc
        if not isinstance(response, dict):
            raise MCPBridgeError(f"database-state returned non-object payload on '{server}'")

        # Best-effort in-client table filtering for broad compatibility.
        if request_tables:
            table_set = set(request_tables)
            if isinstance(response.get("tables"), dict):
                response = dict(response)
                response["tables"] = {
                    k: v for k, v in response["tables"].items()
                    if isinstance(k, str) and k in table_set
                }
        return response

    def delete_database(self, server: str, database_id: str) -> bool:
        if server == "gitea":
            try:
                return GITEA_ISOLATION_MANAGER.delete_runtime(database_id)
            except GiteaIsolationError as exc:
                raise MCPBridgeError(f"Failed to cleanup gitea runtime: {exc}") from exc

        endpoint = self._get_endpoint(server)
        delete_url = f"{self._base_url_from_endpoint(endpoint)}/api/delete-database"
        payload = {"database_id": database_id}
        headers = {"Content-Type": "application/json", "Accept": "application/json"}
        req = urlrequest.Request(
            url=delete_url,
            data=json.dumps(payload).encode("utf-8"),
            headers=headers,
            method="DELETE",
        )
        try:
            with urlrequest.urlopen(req, timeout=30):
                return True
        except urlerror.HTTPError as exc:
            if exc.code in (404, 405):
                return False
            try:
                body = exc.read().decode("utf-8")
            except Exception:
                body = ""
            raise MCPBridgeError(
                f"Failed to delete database on '{server}' (HTTP {exc.code}): {body}"
            ) from exc
        except Exception as exc:
            raise MCPBridgeError(f"Failed to delete database on '{server}': {exc}") from exc

    def list_tools(
        self,
        server: str,
        force_refresh: bool = False,
        brief: bool = True,
        headers: Optional[Dict[str, str]] = None,
    ) -> List[Dict[str, Any]]:
        tools = self._list_tools_full(
            server=server,
            force_refresh=force_refresh,
            headers=headers,
        )
        if not brief:
            return tools
        return [self._to_brief_tool(item) for item in tools]

    @staticmethod
    def _to_brief_tool(item: Dict[str, Any]) -> Dict[str, str]:
        name = str(item.get("name", "")).strip()
        raw_summary = item.get("description") or item.get("title") or ""
        summary = str(raw_summary).strip()
        summary = " ".join(summary.split())
        if len(summary) > 140:
            summary = summary[:137].rstrip() + "..."
        if not summary:
            summary = "No description."
        return {"tool_name": name, "summary": summary}

    def _list_tools_full(
        self,
        server: str,
        force_refresh: bool = False,
        headers: Optional[Dict[str, str]] = None,
    ) -> List[Dict[str, Any]]:
        now = time()

        cache_allowed = not headers
        if cache_allowed:
            with self._cache_lock:
                cached = self._tool_cache.get(server)
                if (
                    cached
                    and not force_refresh
                    and (now - float(cached["time"])) <= self.cache_ttl_seconds
                ):
                    return list(cached["tools"])

        try:
            tools = anyio.run(self._list_tools_async, server, headers)
        except Exception as exc:
            raise MCPBridgeError(f"Failed to list MCP tools for '{server}': {exc}") from exc

        if cache_allowed:
            with self._cache_lock:
                self._tool_cache[server] = {"time": now, "tools": list(tools)}
        return tools

    def get_tool_schema(
        self,
        server: str,
        tool_name: str,
        *,
        force_refresh: bool = False,
        headers: Optional[Dict[str, str]] = None,
    ) -> Dict[str, Any]:
        target_name = str(tool_name).strip()
        if not target_name:
            raise MCPBridgeError("'tool_name' must be a non-empty string")

        tools = self._list_tools_full(
            server=server,
            force_refresh=force_refresh,
            headers=headers,
        )
        for item in tools:
            if str(item.get("name", "")).strip() == target_name:
                return {
                    "tool_name": target_name,
                    "title": item.get("title"),
                    "description": item.get("description"),
                    "inputSchema": item.get("inputSchema"),
                }
        raise MCPBridgeError(f"Tool '{target_name}' not found on MCP server '{server}'")

    def call_tool(
        self,
        server: str,
        tool_name: str,
        arguments: Dict[str, Any],
        headers: Optional[Dict[str, str]] = None,
    ) -> str:
        try:
            return anyio.run(self._call_tool_async, server, tool_name, arguments, headers)
        except Exception as exc:
            raise MCPBridgeError(
                f"Failed MCP call: server='{server}', tool='{tool_name}', error={exc}"
            ) from exc


MCP_BRIDGE = MCPBridge()
