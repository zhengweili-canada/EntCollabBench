"""
scripts/analyze_results.py

Analyzes ENTCOLLABBENCH result JSONL files across all phases and task sets.
Automatically works with whatever files you have — missing files are skipped.

Usage examples:
    # Analyze everything available (auto-detects what exists)
    python scripts/analyze_results.py

    # Specify only the files you have
    python scripts/analyze_results.py \
        --orig-baseline      scripts/result/result_20.jsonl \
        --orig-stage2        scripts/result/result_stage2.jsonl \
        --orig-stage5        scripts/result/result_stage5.jsonl \
        --orig-stage5only    scripts/result/result_orig20_stage5only.jsonl \
        --new40-baseline     scripts/result/result_new40_baseline.jsonl \
        --new40-stage2       scripts/result/result_new40_stage2.jsonl \
        --new40-stage5       scripts/result/result_new40_stage5.jsonl \
        --new40-stage5only   scripts/result/result_new40_stage5only.jsonl

All arguments are optional. Any file not provided (or not found on disk)
is simply skipped — the script always prints whatever it has.

Supported phases:
    Phase 1  baseline       — no intervention
    Phase 2  stage2         — Stage 2 Pre-Delegation Check only
    Phase 3  stage2_stage5  — Stage 2 + Stage 5 Post-Audit
    Phase 4  stage5_only    — Stage 5 Post-Audit only, no Stage 2
"""

import argparse
import json
from pathlib import Path
from collections import defaultdict


# ── Default file paths ────────────────────────────────────────────────────────

BASE = Path(__file__).resolve().parent   # scripts/
RESULT_DIR = BASE / "result"

DEFAULTS = {
    # Ablation subsets (seed=42 and seed=99, both subsets of mcp_tasks_160.json)
    "orig_baseline":    RESULT_DIR / "result_20.jsonl",
    "orig_stage2":      RESULT_DIR / "result_stage2.jsonl",
    "orig_stage5":      RESULT_DIR / "result_stage5.jsonl",
    "orig_stage5only":  RESULT_DIR / "result_orig20_stage5only.jsonl",
    "new40_baseline":   RESULT_DIR / "result_new40_baseline.jsonl",
    "new40_stage2":     RESULT_DIR / "result_new40_stage2.jsonl",
    "new40_stage5":     RESULT_DIR / "result_new40_stage5.jsonl",
    "new40_stage5only": RESULT_DIR / "result_new40_stage5only.jsonl",
    # Primary evaluation files
    "primary_160_baseline":    RESULT_DIR / "result_160_baseline.jsonl",
    "primary_160_stage5only":  RESULT_DIR / "result_160_stage5only.jsonl",
    "primary_multi40_baseline":   RESULT_DIR / "result_multi40_baseline.jsonl",
    "primary_multi40_stage5only": RESULT_DIR / "result_multi40_stage5only.jsonl",
}


# ── Helpers ───────────────────────────────────────────────────────────────────

def load_jsonl(path):
    """Load a JSONL file. Returns [] if path is None or file does not exist."""
    if path is None:
        return []
    p = Path(path)
    if not p.exists():
        return []
    records = []
    with open(p) as f:
        for line in f:
            line = line.strip()
            if line:
                try:
                    records.append(json.loads(line))
                except json.JSONDecodeError:
                    pass
    return records


def is_passed(record: dict) -> bool:
    """Detect pass/fail across all known ENTCOLLABBENCH schema variants."""
    if "task_passed" in record:
        val = record["task_passed"]
        if isinstance(val, bool): return val
        if isinstance(val, (int, float)): return val >= 1
        if isinstance(val, str): return val.lower() in ("true", "1", "pass", "passed", "ok")
    if "passed" in record:
        val = record["passed"]
        if isinstance(val, bool): return val
        if isinstance(val, (int, float)): return val >= 1
        if isinstance(val, str): return val.lower() in ("true", "1", "pass", "passed", "ok")
    if "judge" in record:
        val = record["judge"]
        if isinstance(val, dict):
            if "passed" in val:
                v = val["passed"]
                if isinstance(v, bool): return v
                if isinstance(v, (int, float)): return v >= 1
                if isinstance(v, str): return v.lower() in ("true", "1", "pass", "passed")
            if "result" in val:
                r = str(val["result"]).upper()
                if "PASS" in r or "DONE" in r: return True
                if "FAIL" in r or "ERROR" in r: return False
    if "score" in record:
        val = record["score"]
        if isinstance(val, (int, float)): return val >= 1.0
    if "status" in record:
        return str(record["status"]).lower() in ("pass", "passed", "ok", "success")
    if "result" in record:
        r = str(record["result"]).upper()
        if "PASS" in r or "DONE" in r: return True
        if "FAIL" in r or "ERROR" in r: return False
    return False


def get_task_id(record: dict) -> str:
    for k in ("task_id", "id", "task", "name"):
        if k in record:
            return str(record[k])
    return "unknown"


def get_begin_agent_from_judge(record: dict) -> str:
    rs = record.get("runtime_summary")
    if isinstance(rs, dict):
        for k in ("begin_agent", "starting_agent", "agent"):
            if k in rs:
                return str(rs[k])
    j = record.get("judge")
    if isinstance(j, dict):
        for k in ("begin_agent", "starting_agent", "agent"):
            if k in j:
                return str(j[k])
    return None


def get_begin_agent(record: dict) -> str:
    for k in ("begin_agent", "starting_agent", "agent", "source_agent"):
        if k in record:
            return str(record[k])
    nested = get_begin_agent_from_judge(record)
    if nested:
        return nested
    rta = record.get("run_tokens_by_agent")
    if isinstance(rta, dict) and rta:
        return list(rta.keys())[0]
    return "unknown"


def score_set(records: list) -> tuple:
    """Returns (passed, total, pct)"""
    if not records:
        return 0, 0, 0.0
    passed = sum(1 for r in records if is_passed(r))
    total = len(records)
    return passed, total, passed / total * 100


def row(label, records, width=30):
    p, t, r = score_set(records)
    status = f"  ({t} tasks)" if t > 0 else "  (not available)"
    print(f"  {label:<{width}} {p:>6}/{t:<6}  {r:>7.1f}%{status}")


def diff_table(label, baseline, compare, compare_name):
    """Print per-task diff between baseline and one other phase."""
    if not baseline or not compare:
        return
    print(f"\n── Per-Task Diff: {label} — Baseline vs {compare_name} ──")
    bmap = {get_task_id(r): r for r in baseline}
    cmap = {get_task_id(r): r for r in compare}
    all_ids = sorted(set(bmap) | set(cmap))
    changed, same_pass, same_fail = [], 0, 0
    for tid in all_ids:
        b = is_passed(bmap[tid]) if tid in bmap else None
        c = is_passed(cmap[tid]) if tid in cmap else None
        if b != c:
            changed.append((tid, b, c))
        elif b is True:
            same_pass += 1
        elif b is False:
            same_fail += 1
    print(f"  Unchanged PASS: {same_pass}  |  Unchanged FAIL: {same_fail}  |  Changed: {len(changed)}")
    if changed:
        for tid, b, c in changed:
            b_str = "PASS" if b else ("FAIL" if b is False else "N/A")
            c_str = "PASS" if c else ("FAIL" if c is False else "N/A")
            arrow = "FAIL->PASS ✓" if c else "PASS->FAIL ✗"
            print(f"    {tid:<20}  {b_str} -> {c_str}  ({arrow})")
    else:
        print("  No tasks changed.")


def agent_breakdown(label, records):
    """
    Print subtask-level pass rate per agent.

    Definition: For each agent A,
        subtask_pass_rate(A) = (subtask evaluations where A.passed = True)
                               / (total subtask evaluations involving A)

    Each agent is counted once per subtask evaluation, independent of
    whether the overall task passed or failed. This isolates each agent's
    own performance from its neighbors in the delegation chain.

    NOTE: This is NOT the beginning-agent pass rate. Every agent that
    appears anywhere in the subtask chain is counted here.
    """
    if not records:
        return
    agent_pass  = defaultdict(int)
    agent_total = defaultdict(int)
    for r in records:
        for subtask in r.get("judge", {}).get("task", {}).get("subtasks", []):
            for agent in subtask.get("agents", []):
                name = agent.get("agent_name", "unknown")
                agent_total[name] += 1
                if agent.get("passed", False):
                    agent_pass[name] += 1
    if not agent_total:
        return
    print(f"\n\u2500\u2500 Agent Breakdown: {label} (subtask-level pass rate) \u2500\u2500")
    print(f"  {'Agent':<42} {'Pass':>5} {'Total':>6} {'Rate':>7}")
    print(f"  {'-'*60}")
    for name in sorted(agent_total):
        t = agent_total[name]
        p = agent_pass[name]
        rate = p / t * 100 if t > 0 else 0
        print(f"  {name:<42} {p:>5} {t:>6} {rate:>6.0f}%")


def schema_peek(records, label):
    if not records:
        return
    first = records[0]
    keys = list(first.keys())
    score_keys = [k for k in ("task_passed", "passed", "score", "status",
                               "result", "task_id", "begin_agent", "judge") if k in first]
    print(f"  {label}: keys={keys}")
    for k in score_keys:
        print(f"    {k} = {first[k]}")


# ── CLI ───────────────────────────────────────────────────────────────────────

def parse_args():
    p = argparse.ArgumentParser(
        description="Analyze ENTCOLLABBENCH result JSONL files.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    # Original 20 tasks
    p.add_argument("--orig-baseline",   default=None, metavar="FILE",
                   help="Orig 20-task baseline (default: result_20.jsonl)")
    p.add_argument("--orig-stage2",     default=None, metavar="FILE",
                   help="Orig 20-task Stage 2 result")
    p.add_argument("--orig-stage5",     default=None, metavar="FILE",
                   help="Orig 20-task Stage 2+5 result")
    p.add_argument("--orig-stage5only", default=None, metavar="FILE",
                   help="Orig 20-task Stage 5 only result (Phase 4)")

    # New 40 tasks
    p.add_argument("--new40-baseline",   default=None, metavar="FILE",
                   help="New 40-task baseline result")
    p.add_argument("--new40-stage2",     default=None, metavar="FILE",
                   help="New 40-task Stage 2 result")
    p.add_argument("--new40-stage5",     default=None, metavar="FILE",
                   help="New 40-task Stage 2+5 result")
    p.add_argument("--new40-stage5only", default=None, metavar="FILE",
                   help="New 40-task Stage 5 only result (Phase 4)")

    # Primary evaluation files
    p.add_argument("--primary-160-baseline",    default=None, metavar="FILE",
                   help="Primary 160-task baseline (result_160_baseline.jsonl)")
    p.add_argument("--primary-160-stage5only",  default=None, metavar="FILE",
                   help="Primary 160-task Stage 5 only (result_160_stage5only.jsonl)")
    p.add_argument("--primary-multi40-baseline",    default=None, metavar="FILE",
                   help="Primary multi-step 40-task baseline (result_multi40_baseline.jsonl)")
    p.add_argument("--primary-multi40-stage5only",  default=None, metavar="FILE",
                   help="Primary multi-step 40-task Stage 5 only (result_multi40_stage5only.jsonl)")

    # Options
    p.add_argument("--no-schema-check",    action="store_true",
                   help="Skip schema peek section")
    p.add_argument("--no-agent-breakdown", action="store_true",
                   help="Skip per-agent breakdown section")
    p.add_argument("--no-save",            action="store_true",
                   help="Do not save combined files")
    return p.parse_args()


# ── Main ──────────────────────────────────────────────────────────────────────

def main():
    args = parse_args()

    def resolve(cli_val, default_key):
        if cli_val is not None:
            return Path(cli_val)
        return DEFAULTS[default_key]

    paths = {
        "orig_baseline":    resolve(args.orig_baseline,   "orig_baseline"),
        "orig_stage2":      resolve(args.orig_stage2,     "orig_stage2"),
        "orig_stage5":      resolve(args.orig_stage5,     "orig_stage5"),
        "orig_stage5only":  resolve(args.orig_stage5only, "orig_stage5only"),
        "new40_baseline":   resolve(args.new40_baseline,  "new40_baseline"),
        "new40_stage2":     resolve(args.new40_stage2,    "new40_stage2"),
        "new40_stage5":     resolve(args.new40_stage5,    "new40_stage5"),
        "new40_stage5only": resolve(args.new40_stage5only,"new40_stage5only"),
        "primary_160_baseline":       resolve(args.primary_160_baseline,      "primary_160_baseline"),
        "primary_160_stage5only":     resolve(args.primary_160_stage5only,    "primary_160_stage5only"),
        "primary_multi40_baseline":   resolve(args.primary_multi40_baseline,  "primary_multi40_baseline"),
        "primary_multi40_stage5only": resolve(args.primary_multi40_stage5only,"primary_multi40_stage5only"),
    }

    data = {k: load_jsonl(v) for k, v in paths.items()}

    # ── Header ────────────────────────────────────────────────────────────────
    print("=" * 65)
    print("  ENTCOLLABBENCH Results Analysis")
    print("=" * 65)

    # ── Files found ───────────────────────────────────────────────────────────
    print("\n── Files Found ──────────────────────────────────────────────")
    for k, records in data.items():
        status = f"{len(records)} records" if records else "NOT FOUND / EMPTY"
        print(f"  {k:<22}  {status}")

    # ── Schema check ──────────────────────────────────────────────────────────
    if not args.no_schema_check:
        available = [(k, v) for k, v in data.items() if v]
        if available:
            print("\n── Schema Check (first available file) ──────────────────────")
            schema_peek(available[0][1], available[0][0])

    # ── Original 20 tasks ─────────────────────────────────────────────────────
    orig_keys = ("orig_baseline", "orig_stage2", "orig_stage5", "orig_stage5only")
    if any(data[k] for k in orig_keys):
        print("\n── Original 20 Tasks (seed=42) ──────────────────────────────")
        print(f"  {'Phase':<30} {'Result':>13}  {'Accuracy':>8}")
        print(f"  {'-'*57}")
        row("Phase 1 — Baseline",       data["orig_baseline"])
        row("Phase 2 — Stage 2",        data["orig_stage2"])
        row("Phase 3 — Stage 2+5",      data["orig_stage5"])
        row("Phase 4 — Stage 5 only",   data["orig_stage5only"])

    # ── New 40 tasks ──────────────────────────────────────────────────────────
    new40_keys = ("new40_baseline", "new40_stage2", "new40_stage5", "new40_stage5only")
    if any(data[k] for k in new40_keys):
        print("\n── New 40 Tasks (seed=99) ───────────────────────────────────")
        print(f"  {'Phase':<30} {'Result':>13}  {'Accuracy':>8}")
        print(f"  {'-'*57}")
        row("Phase 1 — Baseline",       data["new40_baseline"])
        row("Phase 2 — Stage 2",        data["new40_stage2"])
        row("Phase 3 — Stage 2+5",      data["new40_stage5"])
        row("Phase 4 — Stage 5 only",   data["new40_stage5only"])

    # ── Combined 60 tasks ─────────────────────────────────────────────────────
    combined = {
        "baseline":   data["orig_baseline"]   + data["new40_baseline"],
        "stage2":     data["orig_stage2"]     + data["new40_stage2"],
        "stage5":     data["orig_stage5"]     + data["new40_stage5"],
        "stage5only": data["orig_stage5only"] + data["new40_stage5only"],
    }
    if any(v for v in combined.values()):
        print("\n── Combined Tasks (seed=42 + seed=99) ───────────────────────")
        print(f"  {'Phase':<30} {'Result':>13}  {'Accuracy':>8}")
        print(f"  {'-'*57}")
        row("Phase 1 — Baseline",       combined["baseline"])
        row("Phase 2 — Stage 2",        combined["stage2"])
        row("Phase 3 — Stage 2+5",      combined["stage5"])
        row("Phase 4 — Stage 5 only",   combined["stage5only"])

    # ── Primary evaluation: 160 tasks ────────────────────────────────────────
    p160_keys = ("primary_160_baseline", "primary_160_stage5only")
    if any(data[k] for k in p160_keys):
        print("\n── Primary Evaluation: 160 Tasks (mcp_tasks_160.json) ───────")
        print(f"  {'Phase':<30} {'Result':>13}  {'Accuracy':>8}")
        print(f"  {'-'*57}")
        row("Phase 1 — Baseline",     data["primary_160_baseline"])
        row("Phase 4 — Stage 5 only", data["primary_160_stage5only"])

    # ── Primary evaluation: multi-step 40 tasks ───────────────────────────────
    pm40_keys = ("primary_multi40_baseline", "primary_multi40_stage5only")
    if any(data[k] for k in pm40_keys):
        print("\n── Primary Evaluation: Multi-Step 40 Tasks (mcp_multi_tasks_40.json) ──")
        print(f"  {'Phase':<30} {'Result':>13}  {'Accuracy':>8}")
        print(f"  {'-'*57}")
        row("Phase 1 — Baseline",     data["primary_multi40_baseline"])
        row("Phase 4 — Stage 5 only", data["primary_multi40_stage5only"])

    # ── Primary evaluation: combined 200 tasks ────────────────────────────────
    primary_baseline   = data["primary_160_baseline"]   + data["primary_multi40_baseline"]
    primary_stage5only = data["primary_160_stage5only"] + data["primary_multi40_stage5only"]
    if primary_baseline or primary_stage5only:
        print("\n── Primary Evaluation: Combined 200 Tasks ───────────────────")
        print(f"  {'Phase':<30} {'Result':>13}  {'Accuracy':>8}")
        print(f"  {'-'*57}")
        row("Phase 1 — Baseline",     primary_baseline)
        row("Phase 4 — Stage 5 only", primary_stage5only)

    # ── Primary agent breakdown (subtask-level) ───────────────────────────────
    if not args.no_agent_breakdown:
        for label, key in [
            ("160-task Baseline",     "primary_160_baseline"),
            ("160-task Stage 5 only", "primary_160_stage5only"),
            ("Multi40 Baseline",      "primary_multi40_baseline"),
            ("Multi40 Stage 5 only",  "primary_multi40_stage5only"),
        ]:
            agent_breakdown(label, data[key])

    # ── Per-task diffs ────────────────────────────────────────────────────────
    # Primary 160
    diff_table("Primary 160", data["primary_160_baseline"], data["primary_160_stage5only"], "Stage 5 only")
    # Primary multi40
    diff_table("Primary Multi40", data["primary_multi40_baseline"], data["primary_multi40_stage5only"], "Stage 5 only")

    # ── Per-task diffs ────────────────────────────────────────────────────────
    # Orig 20
    diff_table("Orig 20", data["orig_baseline"], data["orig_stage2"],     "Stage 2")
    diff_table("Orig 20", data["orig_baseline"], data["orig_stage5"],     "Stage 2+5")
    diff_table("Orig 20", data["orig_baseline"], data["orig_stage5only"], "Stage 5 only")
    # New 40
    diff_table("New 40",  data["new40_baseline"], data["new40_stage2"],     "Stage 2")
    diff_table("New 40",  data["new40_baseline"], data["new40_stage5"],     "Stage 2+5")
    diff_table("New 40",  data["new40_baseline"], data["new40_stage5only"], "Stage 5 only")
    # Stage 5 only vs Stage 2+5 (direct comparison — which approach is better?)
    diff_table("Orig 20", data["orig_stage5"],     data["orig_stage5only"], "S5only vs S2+5")
    diff_table("New 40",  data["new40_stage5"],    data["new40_stage5only"],"S5only vs S2+5")

    # ── Agent breakdown for ablation subsets ─────────────────────────────────
    if not args.no_agent_breakdown:
        for label, key in [
            ("Orig 20 — Baseline",    "orig_baseline"),
            ("Orig 20 — Stage 5 only","orig_stage5only"),
            ("New 40 — Baseline",     "new40_baseline"),
            ("New 40 — Stage 5 only", "new40_stage5only"),
        ]:
            agent_breakdown(label, data[key])

    # ── Save combined files ───────────────────────────────────────────────────
    if not args.no_save:
        print("\n── Saving Combined Files ────────────────────────────────────")
        for suffix, records in combined.items():
            if not records:
                print(f"  Skipped combined_{suffix} (no data)")
                continue
            out = RESULT_DIR / f"result_combined_{suffix}.jsonl"
            with open(out, "w") as f:
                for r in records:
                    f.write(json.dumps(r) + "\n")
            p, t, pct = score_set(records)
            print(f"  Saved result_combined_{suffix}.jsonl — {t} tasks, {p} passed ({pct:.1f}%)")

    print("\n" + "=" * 65)
    print("  Done.")
    print("=" * 65)


if __name__ == "__main__":
    main()