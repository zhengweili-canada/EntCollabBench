from __future__ import annotations

import json
from threading import Lock
from typing import Dict, Optional

try:
    import redis  # type: ignore
except Exception:  # pragma: no cover
    redis = None


class SessionBindingStore:
    def merge_bindings(self, session_id: str, incoming: Dict[str, str]) -> Dict[str, str]:
        raise NotImplementedError

    def get_bindings(self, session_id: str) -> Dict[str, str]:
        raise NotImplementedError

    def set_bindings(self, session_id: str, bindings: Dict[str, str]) -> None:
        raise NotImplementedError

    def clear_bindings(self, session_id: str) -> None:
        raise NotImplementedError


class InMemorySessionBindingStore(SessionBindingStore):
    def __init__(self):
        self._data: Dict[str, Dict[str, str]] = {}
        self._lock = Lock()

    def merge_bindings(self, session_id: str, incoming: Dict[str, str]) -> Dict[str, str]:
        with self._lock:
            current = dict(self._data.get(session_id, {}))
            current.update(incoming)
            self._data[session_id] = current
            return dict(current)

    def get_bindings(self, session_id: str) -> Dict[str, str]:
        with self._lock:
            return dict(self._data.get(session_id, {}))

    def set_bindings(self, session_id: str, bindings: Dict[str, str]) -> None:
        with self._lock:
            self._data[session_id] = dict(bindings)

    def clear_bindings(self, session_id: str) -> None:
        with self._lock:
            self._data.pop(session_id, None)


class RedisSessionBindingStore(SessionBindingStore):
    def __init__(self, redis_url: str, key_prefix: str, ttl_seconds: int = 86400):
        if redis is None:
            raise RuntimeError("redis package is not installed")
        self.redis_url = redis_url
        self.key_prefix = key_prefix.rstrip(":")
        self.ttl_seconds = max(0, int(ttl_seconds))
        self.client = redis.Redis.from_url(redis_url, decode_responses=True)

    def _key(self, session_id: str) -> str:
        return f"{self.key_prefix}:{session_id}"

    @staticmethod
    def _loads(raw: Optional[str]) -> Dict[str, str]:
        if not raw:
            return {}
        try:
            parsed = json.loads(raw)
        except Exception:
            return {}
        if not isinstance(parsed, dict):
            return {}
        out: Dict[str, str] = {}
        for k, v in parsed.items():
            if isinstance(k, str) and k.strip() and isinstance(v, str) and v.strip():
                out[k.strip()] = v.strip()
        return out

    def merge_bindings(self, session_id: str, incoming: Dict[str, str]) -> Dict[str, str]:
        key = self._key(session_id)
        while True:
            with self.client.pipeline() as pipe:
                try:
                    pipe.watch(key)
                    current = self._loads(pipe.get(key))
                    current.update(incoming)
                    payload = json.dumps(current, ensure_ascii=False)
                    pipe.multi()
                    if self.ttl_seconds > 0:
                        pipe.set(key, payload, ex=self.ttl_seconds)
                    else:
                        pipe.set(key, payload)
                    pipe.execute()
                    return current
                except redis.WatchError:
                    continue

    def get_bindings(self, session_id: str) -> Dict[str, str]:
        return self._loads(self.client.get(self._key(session_id)))

    def set_bindings(self, session_id: str, bindings: Dict[str, str]) -> None:
        payload = json.dumps(bindings, ensure_ascii=False)
        if self.ttl_seconds > 0:
            self.client.set(self._key(session_id), payload, ex=self.ttl_seconds)
        else:
            self.client.set(self._key(session_id), payload)

    def clear_bindings(self, session_id: str) -> None:
        self.client.delete(self._key(session_id))
