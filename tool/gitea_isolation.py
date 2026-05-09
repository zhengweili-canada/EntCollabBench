from __future__ import annotations

import hashlib
import json
import os
import random
import re
import shutil
import socket
import string
import subprocess
import tarfile
import time
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from threading import Lock, Semaphore
from typing import Any, Dict, List, Optional
from urllib import request as urlrequest

try:
    import redis  # type: ignore
except Exception:
    redis = None


class GiteaIsolationError(RuntimeError):
    pass


def _rand_secret(length: int = 24) -> str:
    chars = string.ascii_letters + string.digits
    return "".join(random.choice(chars) for _ in range(max(8, length)))


def _safe_name(value: str, max_len: int = 24) -> str:
    value = value.lower().strip()
    value = re.sub(r"[^a-z0-9]+", "-", value).strip("-")
    if not value:
        value = "default"
    return value[:max_len].rstrip("-") or "default"


def _stable_runtime_name(value: str, *, max_len: int = 32) -> str:
    """
    Build a docker-safe runtime suffix that stays readable while avoiding
    collisions caused by naive prefix truncation.
    """
    safe = _safe_name(value, max_len=max(8, max_len))
    digest = hashlib.sha1(str(value).encode("utf-8")).hexdigest()[:10]
    reserve = len(digest) + 1
    prefix_len = max(8, max_len - reserve)
    prefix = safe[:prefix_len].rstrip("-") or "runtime"
    return f"{prefix}-{digest}"


def _find_free_port() -> int:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind(("127.0.0.1", 0))
        return int(s.getsockname()[1])


def _looks_like_port_publish_error(message: str) -> bool:
    text = (message or "").lower()
    return (
        "ports are not available" in text
        or "port is already allocated" in text
        or "address already in use" in text
        or "/forwards/expose" in text
    )


def _looks_like_transient_postgres_error(message: str) -> bool:
    text = (message or "").lower()
    return any(
        token in text
        for token in (
            "the database system is shutting down",
            "the database system is starting up",
            "server closed the connection unexpectedly",
            "terminating connection due to administrator command",
            "could not connect to server",
            "connection refused",
            "connection to server on socket",
        )
    )


DEFAULT_GITEA_MCP_READY_TIMEOUT_SECONDS = 30
DEFAULT_GITEA_MCP_START_TIMEOUT_SECONDS = 30


@dataclass
class GiteaRuntime:
    database_id: str
    network_name: str
    postgres_container: str
    gitea_container: str
    mcp_container: str
    gitea_volume: str
    gitea_port: int
    gitea_ssh_port: int
    mcp_port: int
    mcp_endpoint: str
    root_dir: str
    gitea_data_dir: str
    postgres_password: str
    mcp_token: str
    created_at: float

    def to_dict(self) -> Dict[str, Any]:
        return {
            "database_id": self.database_id,
            "network_name": self.network_name,
            "postgres_container": self.postgres_container,
            "gitea_container": self.gitea_container,
            "mcp_container": self.mcp_container,
            "gitea_volume": self.gitea_volume,
            "gitea_port": self.gitea_port,
            "gitea_ssh_port": self.gitea_ssh_port,
            "mcp_port": self.mcp_port,
            "mcp_endpoint": self.mcp_endpoint,
            "root_dir": self.root_dir,
            "gitea_data_dir": self.gitea_data_dir,
            "postgres_password": self.postgres_password,
            "mcp_token": self.mcp_token,
            "created_at": self.created_at,
        }

    @classmethod
    def from_dict(cls, d: Dict[str, Any]) -> "GiteaRuntime":
        return cls(
            database_id=str(d.get("database_id", "")).strip(),
            network_name=str(d.get("network_name", "")).strip(),
            postgres_container=str(d.get("postgres_container", "")).strip(),
            gitea_container=str(d.get("gitea_container", "")).strip(),
            mcp_container=str(d.get("mcp_container", "")).strip(),
            gitea_volume=str(d.get("gitea_volume", "")).strip(),
            gitea_port=int(d.get("gitea_port", 0)),
            gitea_ssh_port=int(d.get("gitea_ssh_port", 0)),
            mcp_port=int(d.get("mcp_port", 0)),
            mcp_endpoint=str(d.get("mcp_endpoint", "")).strip(),
            root_dir=str(d.get("root_dir", "")).strip(),
            gitea_data_dir=str(d.get("gitea_data_dir", "")).strip(),
            postgres_password=str(d.get("postgres_password", "")).strip(),
            mcp_token=str(d.get("mcp_token", "")).strip(),
            created_at=float(d.get("created_at", 0.0)),
        )


class GiteaIsolationManager:
    def __init__(self):
        self.enabled = os.getenv("GITEA_ISOLATION_ENABLED", "1").strip().lower() not in {
            "0",
            "false",
            "no",
        }
        self.root = self._resolve_root_dir()
        self.state_file = Path(
            os.getenv("GITEA_ISOLATION_STATE_FILE", str(self.root / "state.json"))
        ).resolve()
        self.gitea_image = os.getenv("GITEA_IMAGE", "docker.gitea.com/gitea:latest").strip()
        self.gitea_mcp_image = os.getenv(
            "GITEA_MCP_IMAGE", "docker.gitea.com/gitea-mcp-server:latest"
        ).strip()
        self.postgres_image = os.getenv("GITEA_POSTGRES_IMAGE", "postgres:16-alpine").strip()
        self.shared_network_name = (
            os.getenv("GITEA_ISOLATION_SHARED_NETWORK", "companyagent-gitea-shared").strip()
            or "companyagent-gitea-shared"
        )
        self.admin_user = os.getenv("GITEA_MCP_ADMIN_USER", "mcp_admin").strip() or "mcp_admin"
        self.admin_email = os.getenv("GITEA_MCP_ADMIN_EMAIL", "mcp_admin@example.com").strip()
        self.redis_key_prefix = (
            os.getenv("GITEA_ISOLATION_REDIS_PREFIX", "company-agent:gitea-runtime").strip()
            or "company-agent:gitea-runtime"
        )
        self._redis_client = None
        self._redis_url = ""
        self._lock = Lock()
        self._create_runtime_slots = Semaphore(self._resolve_create_runtime_concurrency())
        self._state: Dict[str, GiteaRuntime] = {}
        self._load_state()

    @staticmethod
    def _read_int_env(name: str, default: int) -> int:
        raw = os.getenv(name, "").strip()
        if not raw:
            return default
        try:
            value = int(raw)
        except Exception:
            return default
        return value

    def _resolve_create_runtime_concurrency(self) -> int:
        # Seeding a runtime is expensive: postgres boot, SQL import, gitea init,
        # and MCP startup all hit the same Docker daemon. Keep this serialized by
        # default so benchmark batch concurrency does not overload Docker.
        return max(1, self._read_int_env("GITEA_ISOLATION_MAX_CONCURRENT_CREATES", 1))

    @staticmethod
    def _resolve_root_dir() -> Path:
        configured = os.getenv("GITEA_ISOLATION_ROOT", "").strip()
        if configured:
            return Path(configured).expanduser().resolve()

        repo_root = Path(__file__).resolve().parents[1]
        return (repo_root / "Arena" / "mcp-gitea").resolve()

    def _ensure_root_dir(self) -> None:
        self.root.mkdir(parents=True, exist_ok=True, mode=0o700)
        try:
            os.chmod(self.root, 0o700)
        except Exception:
            pass
        if not os.access(self.root, os.R_OK | os.W_OK | os.X_OK):
            raise GiteaIsolationError(
                f"Gitea isolation root is not writable: {self.root}. "
                "Set GITEA_ISOLATION_ROOT to a writable directory."
            )

    def _load_state(self) -> None:
        with self._lock:
            self._state = {}
            if not self.state_file.exists():
                return
            try:
                raw = self.state_file.read_text(encoding="utf-8")
                obj = json.loads(raw) if raw.strip() else {}
            except Exception:
                return
            if not isinstance(obj, dict):
                return
            for k, v in obj.items():
                if not isinstance(k, str) or not isinstance(v, dict):
                    continue
                rt = GiteaRuntime.from_dict(v)
                if rt.database_id:
                    self._state[k.strip()] = rt

    def _persist_state(self) -> None:
        self._ensure_root_dir()
        self.state_file.parent.mkdir(parents=True, exist_ok=True)
        payload = {k: v.to_dict() for k, v in self._state.items()}
        tmp = self.state_file.with_suffix(".tmp")
        tmp.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
        tmp.replace(self.state_file)

    @staticmethod
    def _run(
        args: list[str],
        *,
        input_bytes: Optional[bytes] = None,
        timeout: int = 120,
    ) -> str:
        try:
            proc = subprocess.run(
                args,
                input=input_bytes,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                timeout=timeout,
                check=False,
            )
        except FileNotFoundError as exc:
            raise GiteaIsolationError(f"Command not found: {args[0]}") from exc
        except subprocess.TimeoutExpired as exc:
            raise GiteaIsolationError(f"Command timed out: {' '.join(args)}") from exc

        out = (proc.stdout or b"").decode("utf-8", errors="replace").strip()
        err = (proc.stderr or b"").decode("utf-8", errors="replace").strip()
        if proc.returncode != 0:
            msg = err or out or f"exit code {proc.returncode}"
            raise GiteaIsolationError(f"Command failed ({' '.join(args)}): {msg}")
        return out

    def _docker(self, *args: str, timeout: int = 120, input_bytes: Optional[bytes] = None) -> str:
        return self._run(["docker", *args], timeout=timeout, input_bytes=input_bytes)

    def _current_redis_url(self) -> str:
        return (
            os.getenv("GITEA_ISOLATION_REDIS_URL", "").strip()
            or os.getenv("REDIS_URL", "").strip()
        )

    def _ensure_redis_client(self):
        if redis is None:
            return None
        url = self._current_redis_url()
        if not url:
            return None
        if self._redis_client is not None and self._redis_url == url:
            return self._redis_client
        try:
            client = redis.Redis.from_url(url, decode_responses=True)
            client.ping()
            self._redis_client = client
            self._redis_url = url
            return self._redis_client
        except Exception:
            self._redis_client = None
            self._redis_url = ""
            return None

    def _redis_key(self, database_id: str) -> str:
        return f"{self.redis_key_prefix}:{database_id}"

    def _redis_get_runtime(self, database_id: str) -> Optional[GiteaRuntime]:
        client = self._ensure_redis_client()
        if client is None:
            return None
        try:
            raw = client.get(self._redis_key(database_id))
            if not raw:
                return None
            obj = json.loads(raw)
            if not isinstance(obj, dict):
                return None
            rt = GiteaRuntime.from_dict(obj)
            return rt if rt.database_id else None
        except Exception:
            return None

    def _redis_set_runtime(self, runtime: GiteaRuntime) -> None:
        client = self._ensure_redis_client()
        if client is None:
            return
        try:
            ttl = int(os.getenv("GITEA_ISOLATION_REDIS_TTL_SECONDS", "86400"))
        except Exception:
            ttl = 86400
        try:
            payload = json.dumps(runtime.to_dict(), ensure_ascii=False)
            if ttl > 0:
                client.set(self._redis_key(runtime.database_id), payload, ex=ttl)
            else:
                client.set(self._redis_key(runtime.database_id), payload)
        except Exception:
            pass

    def _redis_delete_runtime(self, database_id: str) -> None:
        client = self._ensure_redis_client()
        if client is None:
            return
        try:
            client.delete(self._redis_key(database_id))
        except Exception:
            pass

    def _docker_exec_gitea(self, container: str, args: list[str], timeout: int = 90) -> str:
        # Gitea admin CLI must not run as root.
        try:
            return self._docker("exec", "--user", "git", container, *args, timeout=timeout)
        except Exception:
            return self._docker("exec", container, *args, timeout=timeout)

    def _docker_volume_exists(self, name: str) -> bool:
        volume_name = str(name or "").strip()
        if not volume_name:
            return False
        try:
            self._docker("volume", "inspect", volume_name, timeout=20)
            return True
        except Exception:
            return False

    def _remove_volume_if_exists(self, name: str) -> None:
        volume_name = str(name or "").strip()
        if not volume_name or not self._docker_volume_exists(volume_name):
            return
        try:
            self._docker("volume", "rm", "-f", volume_name, timeout=45)
        except Exception as exc:
            raise GiteaIsolationError(
                f"Failed to remove stale gitea volume '{volume_name}': {exc}"
            ) from exc

    def _docker_container_status(self, name: str) -> str:
        container_name = str(name or "").strip()
        if not container_name:
            return ""
        try:
            return self._docker(
                "inspect",
                "--format",
                "{{.State.Status}}",
                container_name,
                timeout=20,
            ).strip()
        except Exception:
            return ""

    def _docker_logs_tail(self, name: str, tail: int = 80) -> str:
        container_name = str(name or "").strip()
        if not container_name:
            return ""
        try:
            return self._docker("logs", "--tail", str(max(1, int(tail))), container_name, timeout=20)
        except Exception:
            return ""

    def _wait_for_gitea_init_dirs(self, container: str, timeout_seconds: int = 120) -> None:
        deadline = time.time() + max(10, timeout_seconds)
        last_err = ""
        while time.time() < deadline:
            status = self._docker_container_status(container)
            if status and status not in {"created", "running"}:
                logs = self._docker_logs_tail(container, tail=80)
                details = f"status={status}"
                if logs:
                    details += f", logs_tail={logs}"
                raise GiteaIsolationError(
                    f"Gitea container '{container}' exited before initialization finished: {details}"
                )
            try:
                self._docker(
                    "exec",
                    "--user",
                    "git",
                    container,
                    "sh",
                    "-lc",
                    "mkdir -p /data/git/repositories && test -w /data/git/repositories",
                    timeout=15,
                )
                return
            except Exception as exc:
                last_err = str(exc)
                time.sleep(2)
        raise GiteaIsolationError(
            f"Timed out waiting for writable gitea data directory in container '{container}', last_error={last_err}"
        )

    def _seed_repositories_into_gitea(self, *, gitea_container: str, tar_path: Path) -> None:
        tar_bytes = tar_path.read_bytes()
        if not tar_bytes:
            return
        try:
            self._docker(
                "exec",
                "-i",
                "--user",
                "git",
                gitea_container,
                "sh",
                "-lc",
                "mkdir -p /data/git/repositories && tar -xzf - -C /data/git/repositories",
                input_bytes=tar_bytes,
                timeout=300,
            )
        except Exception as exc:
            raise GiteaIsolationError(
                f"Failed to seed gitea repositories into '{gitea_container}': {exc}"
            ) from exc

    def _docker_network_exists(self, name: str) -> bool:
        network_name = str(name or "").strip()
        if not network_name:
            return False
        try:
            self._docker("network", "inspect", network_name, timeout=20)
            return True
        except Exception:
            return False

    def _list_docker_network_names(self) -> List[str]:
        raw = self._docker("network", "ls", "--format", "{{.Name}}", timeout=30)
        return [line.strip() for line in raw.splitlines() if line.strip()]

    def _prune_unused_legacy_networks(self) -> int:
        removed = 0
        try:
            candidates = [
                name
                for name in self._list_docker_network_names()
                if name.startswith("cat-gitea-net-") and name != self.shared_network_name
            ]
        except Exception:
            return 0
        for network_name in candidates:
            try:
                self._docker("network", "rm", network_name, timeout=20)
                removed += 1
            except Exception:
                continue
        return removed

    def _ensure_shared_network(self) -> str:
        network_name = self.shared_network_name
        if self._docker_network_exists(network_name):
            return network_name
        try:
            self._docker("network", "create", network_name, timeout=30)
            return network_name
        except Exception as exc:
            if self._docker_network_exists(network_name) or "already exists" in str(exc).lower():
                return network_name
            if _looks_like_port_publish_error(str(exc)):
                raise
            if "address pools have been fully subnetted" not in str(exc).lower():
                raise
        self._prune_unused_legacy_networks()
        if self._docker_network_exists(network_name):
            return network_name
        try:
            self._docker("network", "create", network_name, timeout=30)
        except Exception as exc:
            if self._docker_network_exists(network_name) or "already exists" in str(exc).lower():
                return network_name
            raise
        return network_name

    def _load_sql_into_postgres(
        self,
        *,
        postgres_container: str,
        sql_bytes: bytes,
        max_attempts: int = 5,
    ) -> None:
        attempts = max(1, int(max_attempts))
        last_exc: Optional[Exception] = None
        for attempt in range(1, attempts + 1):
            try:
                self._wait_postgres(postgres_container, timeout_seconds=120)
                self._docker(
                    "exec",
                    "-i",
                    postgres_container,
                    "psql",
                    "-U",
                    "gitea",
                    "-d",
                    "gitea",
                    input_bytes=sql_bytes,
                    timeout=300,
                )
                return
            except Exception as exc:
                last_exc = exc
                if attempt >= attempts or not _looks_like_transient_postgres_error(str(exc)):
                    raise
                time.sleep(min(6, attempt * 2))
        if last_exc is not None:
            raise last_exc

    def _force_remove_tree(self, target: Path) -> None:
        if not target.exists():
            return
        try:
            shutil.rmtree(target)
            return
        except FileNotFoundError:
            return
        except Exception:
            pass

        parent = target.parent.resolve()
        target_name = target.name
        self._docker(
            "run",
            "--rm",
            "-e",
            f"TARGET_NAME={target_name}",
            "-v",
            f"{str(parent)}:/cleanup-parent",
            "--entrypoint",
            "sh",
            self.postgres_image,
            "-lc",
            'rm -rf -- "/cleanup-parent/$TARGET_NAME"',
            timeout=120,
        )
        if target.exists():
            raise GiteaIsolationError(f"Failed to remove stale gitea isolation directory: {target}")

    @staticmethod
    def _quote_ident(value: str) -> str:
        v = str(value or "").strip()
        if not v:
            raise GiteaIsolationError("table name cannot be empty")
        # Restrict to plain identifiers for safety.
        if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", v):
            raise GiteaIsolationError(f"unsafe table name: {value}")
        return '"' + v.replace('"', '""') + '"'

    def _postgres_query_scalar(
        self,
        *,
        runtime: GiteaRuntime,
        sql: str,
        timeout: int = 90,
    ) -> str:
        cmd = [
            "exec",
            "-e",
            f"PGPASSWORD={runtime.postgres_password}",
            runtime.postgres_container,
            "psql",
            "-U",
            "gitea",
            "-d",
            "gitea",
            "-At",
            "-v",
            "ON_ERROR_STOP=1",
            "-c",
            sql,
        ]
        return self._docker(*cmd, timeout=timeout).strip()

    def export_state(
        self,
        *,
        database_id: str,
        tables: Optional[List[str]] = None,
        limit: int = 2000,
    ) -> Dict[str, Any]:
        runtime = self.get_runtime(database_id)
        if runtime is None:
            raise GiteaIsolationError(f"Unknown gitea runtime for database_id='{database_id}'")

        row_limit = int(limit) if isinstance(limit, int) else 2000
        if row_limit <= 0:
            row_limit = 2000
        if row_limit > 10000:
            row_limit = 10000

        all_tables_raw = self._postgres_query_scalar(
            runtime=runtime,
            sql=(
                "SELECT COALESCE(string_agg(table_name, E'\\n' ORDER BY table_name), '') "
                "FROM information_schema.tables "
                "WHERE table_schema='public' AND table_type='BASE TABLE';"
            ),
            timeout=120,
        )
        all_tables = [x.strip() for x in all_tables_raw.splitlines() if x.strip()]
        table_set = set(all_tables)
        requested_tables: List[str] = []
        if tables:
            for item in tables:
                name = str(item or "").strip()
                if not name:
                    continue
                if name in table_set:
                    requested_tables.append(name)
        else:
            requested_tables = list(all_tables)

        table_counts: Dict[str, int] = {}
        table_data: Dict[str, List[Dict[str, Any]]] = {}
        for table_name in requested_tables:
            quoted = self._quote_ident(table_name)
            count_raw = self._postgres_query_scalar(
                runtime=runtime,
                sql=f"SELECT COUNT(*)::bigint FROM public.{quoted};",
                timeout=120,
            )
            try:
                table_counts[table_name] = int(count_raw.strip() or "0")
            except Exception:
                table_counts[table_name] = 0

            rows_json = self._postgres_query_scalar(
                runtime=runtime,
                sql=(
                    "SELECT COALESCE(json_agg(row_to_json(t)), '[]'::json)::text "
                    f"FROM (SELECT * FROM public.{quoted} LIMIT {row_limit}) t;"
                ),
                timeout=180,
            )
            try:
                rows_obj = json.loads(rows_json) if rows_json else []
            except Exception:
                rows_obj = []
            rows: List[Dict[str, Any]] = []
            if isinstance(rows_obj, list):
                for row in rows_obj:
                    if isinstance(row, dict):
                        rows.append(row)
            table_data[table_name] = rows

        return {
            "success": True,
            "database_id": runtime.database_id,
            "service": "gitea",
            "database_info": {
                "engine": "postgres",
                "database": "gitea",
                "postgres_container": runtime.postgres_container,
                "row_limit": row_limit,
            },
            "table_counts": table_counts,
            "table_data": table_data,
            "timestamp": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        }

    def get_runtime(self, database_id: str) -> Optional[GiteaRuntime]:
        db_id = database_id.strip()
        if not db_id:
            return None
        with self._lock:
            rt = self._state.get(db_id)
            if rt is not None:
                return rt
        rt = self._redis_get_runtime(db_id)
        if rt is not None:
            with self._lock:
                self._state[db_id] = rt
                self._persist_state()
        return rt

    def _resolve_mcp_host_for_caller(self) -> str:
        # Host process can reach mapped ports via 127.0.0.1.
        # Containers should use host.docker.internal to reach host-mapped ports.
        if os.getenv("GITEA_ISOLATION_MCP_HOST", "").strip():
            return os.getenv("GITEA_ISOLATION_MCP_HOST", "").strip()
        if Path("/.dockerenv").exists():
            return os.getenv("GITEA_ISOLATION_DOCKER_HOST", "host.docker.internal").strip()
        return os.getenv("GITEA_ISOLATION_HOST", "127.0.0.1").strip()

    def get_endpoint(self, database_id: str) -> Optional[str]:
        runtime = self.get_runtime(database_id)
        if runtime:
            if int(runtime.mcp_port or 0) > 0:
                host = self._resolve_mcp_host_for_caller()
                return f"http://{host}:{int(runtime.mcp_port)}/mcp"
            return runtime.mcp_endpoint
        return None

    def _wait_http(self, url: str, timeout_seconds: int = 180) -> None:
        deadline = time.time() + max(5, timeout_seconds)
        last_err = ""
        while time.time() < deadline:
            try:
                req = urlrequest.Request(url=url, method="GET")
                with urlrequest.urlopen(req, timeout=5):
                    return
            except Exception as exc:
                last_err = str(exc)
                time.sleep(2)
        raise GiteaIsolationError(f"Timed out waiting for HTTP service: {url}, last_error={last_err}")

    def _wait_tcp(
        self,
        host: str,
        port: int,
        timeout_seconds: int = 120,
        *,
        mcp_token: str = "",
    ) -> None:
        deadline = time.time() + max(5, timeout_seconds)
        last_err = ""
        mcp_url = f"http://{host}:{int(port)}/mcp"
        headers = {
            "content-type": "application/json",
            "accept": "application/json, text/event-stream",
        }
        if mcp_token:
            headers["authorization"] = f"Bearer {mcp_token}"
        payload = json.dumps(
            {
                "jsonrpc": "2.0",
                "id": 1,
                "method": "initialize",
                "params": {
                    "protocolVersion": "2024-11-05",
                    "capabilities": {"tools": {}},
                    "clientInfo": {
                        "name": "company-agentteam-gitea-isolation",
                        "version": "1.0.0",
                    },
                },
            }
        ).encode("utf-8")
        while time.time() < deadline:
            try:
                req = urlrequest.Request(
                    url=mcp_url,
                    data=payload,
                    headers=headers,
                    method="POST",
                )
                with urlrequest.urlopen(req, timeout=5):
                    return
            except Exception as exc:
                last_err = str(exc)
                time.sleep(1)
        raise GiteaIsolationError(
            f"Timed out waiting for MCP service: {mcp_url}, last_error={last_err}"
        )

    def _find_running_agent_container(self) -> str:
        try:
            output = self._docker("ps", "--format", "{{.Names}}", timeout=20)
        except Exception:
            return ""
        for raw_name in output.splitlines():
            name = raw_name.strip()
            if name.startswith("agent-"):
                return name
        return ""

    def _wait_mcp_from_agent_container(
        self,
        port: int,
        timeout_seconds: int = 120,
        *,
        mcp_token: str = "",
    ) -> None:
        container = self._find_running_agent_container()
        if not container:
            return

        deadline = time.time() + max(5, timeout_seconds)
        last_err = ""
        script = (
            "import json, os, sys\n"
            "from urllib import request\n"
            "url = f\"http://host.docker.internal:{sys.argv[1]}/mcp\"\n"
            "headers = {\n"
            "    'Content-Type': 'application/json',\n"
            "    'Accept': 'application/json, text/event-stream',\n"
            "}\n"
            "token = os.getenv('GITEA_MCP_TOKEN', '').strip()\n"
            "if token:\n"
            "    headers['Authorization'] = f'Bearer {token}'\n"
            "payload = json.dumps({\n"
            "    'jsonrpc': '2.0',\n"
            "    'id': 1,\n"
            "    'method': 'initialize',\n"
            "    'params': {\n"
            "        'protocolVersion': '2024-11-05',\n"
            "        'capabilities': {'tools': {}},\n"
            "        'clientInfo': {\n"
            "            'name': 'company-agentteam-gitea-isolation-agent-probe',\n"
            "            'version': '1.0.0',\n"
            "        },\n"
            "    },\n"
            "}).encode('utf-8')\n"
            "req = request.Request(url=url, data=payload, headers=headers, method='POST')\n"
            "with request.urlopen(req, timeout=5):\n"
            "    pass\n"
        )
        while time.time() < deadline:
            try:
                self._docker(
                    "exec",
                    "-e",
                    f"GITEA_MCP_TOKEN={mcp_token}",
                    container,
                    "python",
                    "-c",
                    script,
                    str(int(port)),
                    timeout=15,
                )
                return
            except Exception as exc:
                last_err = str(exc)
                time.sleep(1)
        raise GiteaIsolationError(
            "Timed out waiting for MCP service from agent container path: "
            f"container={container}, url=http://host.docker.internal:{int(port)}/mcp, "
            f"last_error={last_err}"
        )

    def _wait_mcp_ready(
        self,
        port: int,
        timeout_seconds: int = 120,
        *,
        mcp_token: str = "",
    ) -> None:
        self._wait_tcp(
            "127.0.0.1",
            port,
            timeout_seconds=timeout_seconds,
            mcp_token=mcp_token,
        )
        self._wait_mcp_from_agent_container(
            port,
            timeout_seconds=timeout_seconds,
            mcp_token=mcp_token,
        )

    def _wait_postgres(self, container: str, timeout_seconds: int = 120) -> None:
        deadline = time.time() + max(5, timeout_seconds)
        last_err = ""
        while time.time() < deadline:
            try:
                self._docker(
                    "exec",
                    container,
                    "pg_isready",
                    "-U",
                    "gitea",
                    "-d",
                    "gitea",
                    timeout=15,
                )
                return
            except Exception as exc:
                last_err = str(exc)
                time.sleep(2)
        raise GiteaIsolationError(f"Timed out waiting for postgres: {container}, last_error={last_err}")

    def _wait_gitea_container_ready(self, container: str, timeout_seconds: int = 240) -> None:
        deadline = time.time() + max(10, timeout_seconds)
        last_err = ""
        while time.time() < deadline:
            status = self._docker_container_status(container)
            if status and status not in {"created", "running"}:
                logs = self._docker_logs_tail(container, tail=80)
                details = f"status={status}"
                if logs:
                    details += f", logs_tail={logs}"
                raise GiteaIsolationError(
                    f"Gitea container '{container}' exited while waiting for readiness: {details}"
                )
            try:
                self._docker(
                    "exec",
                    container,
                    "sh",
                    "-lc",
                    "wget -q -O - http://127.0.0.1:3000/api/healthz >/dev/null",
                    timeout=20,
                )
                return
            except Exception as exc:
                last_err = str(exc)
                time.sleep(2)
        raise GiteaIsolationError(
            f"Timed out waiting for gitea in container '{container}', last_error={last_err}"
        )

    def _try_create_admin_and_token(self, gitea_container: str, database_id: str) -> str:
        password = _rand_secret(20)
        # idempotent create user
        create_cmd = [
            "gitea",
            "admin",
            "user",
            "create",
            "--username",
            self.admin_user,
            "--password",
            password,
            "--email",
            self.admin_email,
            "--admin",
            "--must-change-password=false",
        ]
        try:
            self._docker_exec_gitea(gitea_container, create_cmd, timeout=90)
        except Exception:
            # User may already exist; continue.
            pass

        token = ""
        for i in range(1, 21):
            token_name = f"mcp-{_safe_name(database_id, max_len=14)}-{i}"
            token_cmd = [
                "gitea",
                "admin",
                "user",
                "generate-access-token",
                "--username",
                self.admin_user,
                "--token-name",
                token_name,
                "--raw",
            ]
            raw = self._docker_exec_gitea(gitea_container, token_cmd, timeout=90)
            candidate = raw.strip().splitlines()[-1].strip() if raw.strip() else ""
            if candidate and "not supposed to be run as root" not in candidate:
                token = candidate
                break
            time.sleep(2)
        if not token:
            raise GiteaIsolationError("Failed to generate Gitea MCP access token")
        return token

    def create_runtime(
        self,
        *,
        database_id: str,
        sql_file_path: str,
        repos_tar_path: Optional[str] = None,
    ) -> GiteaRuntime:
        if not self.enabled:
            raise GiteaIsolationError("Gitea isolation mode is disabled (GITEA_ISOLATION_ENABLED=0)")
        db_id = database_id.strip()
        if not db_id:
            raise GiteaIsolationError("database_id is required for gitea isolation")

        sql_path = Path(sql_file_path).resolve()
        if not sql_path.exists() or not sql_path.is_file():
            raise GiteaIsolationError(f"SQL file not found: {sql_file_path}")
        tar_path = Path(repos_tar_path).resolve() if repos_tar_path else None
        if tar_path and (not tar_path.exists() or not tar_path.is_file()):
            raise GiteaIsolationError(f"repos tar file not found: {repos_tar_path}")

        with self._lock:
            existing = self._state.get(db_id)
            if existing:
                return existing

        self._create_runtime_slots.acquire()
        try:
            with self._lock:
                existing = self._state.get(db_id)
                if existing:
                    return existing

            self._ensure_root_dir()
            root_dir = (self.root / db_id).resolve()
            if root_dir.exists():
                self._force_remove_tree(root_dir)
            root_dir.mkdir(parents=True, exist_ok=True, mode=0o700)
            try:
                os.chmod(root_dir, 0o700)
            except Exception:
                pass

            if tar_path:
                with tarfile.open(tar_path, "r:*"):
                    pass

            short = _stable_runtime_name(db_id, max_len=32)
            network_name = self._ensure_shared_network()
            postgres_container = f"cat-gitea-pg-{short}"
            gitea_container = f"cat-gitea-app-{short}"
            mcp_container = f"cat-gitea-mcp-{short}"
            gitea_volume = f"cat-gitea-data-{short}"

            gitea_port = 0
            gitea_ssh_port = 0
            mcp_port = _find_free_port()
            postgres_password = _rand_secret(20)
            postgres_run_timeout = max(90, self._read_int_env("GITEA_POSTGRES_RUN_TIMEOUT_SECONDS", 180))
            gitea_run_timeout = max(120, self._read_int_env("GITEA_APP_RUN_TIMEOUT_SECONDS", 180))

            try:
                self._remove_volume_if_exists(gitea_volume)
                self._docker("volume", "create", gitea_volume, timeout=30)
                self._docker(
                    "run",
                    "-d",
                    "--name",
                    postgres_container,
                    "--network",
                    network_name,
                    "-e",
                    "POSTGRES_DB=gitea",
                    "-e",
                    "POSTGRES_USER=gitea",
                    "-e",
                    f"POSTGRES_PASSWORD={postgres_password}",
                    self.postgres_image,
                    timeout=postgres_run_timeout,
                )
                self._wait_postgres(postgres_container, timeout_seconds=120)

                sql_bytes = sql_path.read_bytes()
                self._load_sql_into_postgres(
                    postgres_container=postgres_container,
                    sql_bytes=sql_bytes,
                )

                self._docker(
                    "run",
                    "-d",
                    "--name",
                    gitea_container,
                    "--network",
                    network_name,
                    "-v",
                    f"{gitea_volume}:/data",
                    "-e",
                    "GITEA__database__DB_TYPE=postgres",
                    "-e",
                    "GITEA__database__HOST=cat-gitea-pg-" + short + ":5432",
                    "-e",
                    "GITEA__database__NAME=gitea",
                    "-e",
                    "GITEA__database__USER=gitea",
                    "-e",
                    f"GITEA__database__PASSWD={postgres_password}",
                    "-e",
                    "GITEA__security__INSTALL_LOCK=true",
                    "-e",
                    "GITEA__server__ROOT_URL=http://localhost:3000/",
                    "-e",
                    "GITEA__service__DISABLE_REGISTRATION=true",
                    self.gitea_image,
                    timeout=gitea_run_timeout,
                )
                self._wait_for_gitea_init_dirs(gitea_container, timeout_seconds=120)
                if tar_path:
                    self._seed_repositories_into_gitea(
                        gitea_container=gitea_container,
                        tar_path=tar_path,
                    )
                self._wait_gitea_container_ready(gitea_container, timeout_seconds=240)

                mcp_token = os.getenv("GITEA_MCP_ACCESS_TOKEN", "").strip()
                if not mcp_token:
                    mcp_token = self._try_create_admin_and_token(gitea_container, db_id)

                mcp_started = False
                last_mcp_err: Optional[Exception] = None
                max_attempts = max(1, int(os.getenv("GITEA_MCP_PORT_BIND_MAX_ATTEMPTS", "3")))
                mcp_ready_timeout = max(
                    5,
                    self._read_int_env(
                        "GITEA_MCP_READY_TIMEOUT_SECONDS",
                        DEFAULT_GITEA_MCP_READY_TIMEOUT_SECONDS,
                    ),
                )
                mcp_start_deadline = time.time() + max(
                    5,
                    self._read_int_env(
                        "GITEA_MCP_START_TIMEOUT_SECONDS",
                        DEFAULT_GITEA_MCP_START_TIMEOUT_SECONDS,
                    ),
                )
                for attempt in range(1, max_attempts + 1):
                    if time.time() >= mcp_start_deadline:
                        break
                    mcp_port = _find_free_port()
                    try:
                        self._docker(
                            "run",
                            "-d",
                            "--name",
                            mcp_container,
                            "--network",
                            network_name,
                            "-p",
                            f"{os.getenv('GITEA_MCP_BIND_HOST', '0.0.0.0').strip() or '0.0.0.0'}:{mcp_port}:8080",
                            self.gitea_mcp_image,
                            "/app/gitea-mcp",
                            "-t",
                            "http",
                            "--host",
                            f"http://{gitea_container}:3000",
                            "--token",
                            mcp_token,
                            "--port",
                            "8080",
                            timeout=120,
                        )
                        self._wait_mcp_ready(
                            mcp_port,
                            timeout_seconds=max(
                                5,
                                min(
                                    mcp_ready_timeout,
                                    int(max(1, mcp_start_deadline - time.time())),
                                ),
                            ),
                            mcp_token=mcp_token,
                        )
                        mcp_started = True
                        break
                    except Exception as exc:
                        last_mcp_err = exc
                        try:
                            self._docker("rm", "-f", mcp_container, timeout=45)
                        except Exception:
                            pass
                        if (
                            _looks_like_port_publish_error(str(exc))
                            and attempt < max_attempts
                            and time.time() < mcp_start_deadline
                        ):
                            time.sleep(min(4, attempt))
                            continue
                        if attempt < max_attempts and time.time() < mcp_start_deadline:
                            time.sleep(1)
                            continue
                        break
                if not mcp_started:
                    if last_mcp_err is not None:
                        raise last_mcp_err
                    raise GiteaIsolationError("Failed to start gitea MCP runtime")
            except Exception:
                # best-effort rollback
                try:
                    self._destroy_runtime(
                        GiteaRuntime(
                            database_id=db_id,
                            network_name=network_name,
                            postgres_container=postgres_container,
                            gitea_container=gitea_container,
                            mcp_container=mcp_container,
                            gitea_volume=gitea_volume,
                            gitea_port=gitea_port,
                            gitea_ssh_port=gitea_ssh_port,
                            mcp_port=mcp_port,
                            mcp_endpoint=f"http://127.0.0.1:{mcp_port}/mcp",
                            root_dir=str(root_dir),
                            gitea_data_dir="",
                            postgres_password=postgres_password,
                            mcp_token="",
                            created_at=time.time(),
                        ),
                        remove_dirs=True,
                    )
                except Exception:
                    pass
                raise
        finally:
            self._create_runtime_slots.release()

        runtime = GiteaRuntime(
            database_id=db_id,
            network_name=network_name,
            postgres_container=postgres_container,
            gitea_container=gitea_container,
            mcp_container=mcp_container,
            gitea_volume=gitea_volume,
            gitea_port=gitea_port,
            gitea_ssh_port=gitea_ssh_port,
            mcp_port=mcp_port,
            mcp_endpoint=f"http://127.0.0.1:{mcp_port}/mcp",
            root_dir=str(root_dir),
            gitea_data_dir="",
            postgres_password=postgres_password,
            mcp_token=mcp_token,
            created_at=time.time(),
        )
        with self._lock:
            self._state[db_id] = runtime
            self._persist_state()
        self._redis_set_runtime(runtime)
        return runtime

    def _destroy_runtime(self, runtime: GiteaRuntime, *, remove_dirs: bool) -> None:
        for name in [runtime.mcp_container, runtime.gitea_container, runtime.postgres_container]:
            if name:
                try:
                    self._docker("rm", "-f", name, timeout=45)
                except Exception:
                    pass
        if runtime.network_name and runtime.network_name != self.shared_network_name:
            try:
                self._docker("network", "rm", runtime.network_name, timeout=30)
            except Exception:
                pass
        if runtime.gitea_volume:
            try:
                self._docker("volume", "rm", "-f", runtime.gitea_volume, timeout=45)
            except Exception:
                pass
        if remove_dirs and runtime.root_dir:
            self._force_remove_tree(Path(runtime.root_dir).resolve())

    def delete_runtime(self, database_id: str) -> bool:
        db_id = database_id.strip()
        if not db_id:
            return False
        with self._lock:
            runtime = self._state.get(db_id)
        if runtime is None:
            runtime = self._redis_get_runtime(db_id)
        if runtime is None:
            return False
        self._destroy_runtime(runtime, remove_dirs=True)
        with self._lock:
            self._state.pop(db_id, None)
            self._persist_state()
        self._redis_delete_runtime(db_id)
        return True


GITEA_ISOLATION_MANAGER = GiteaIsolationManager()
