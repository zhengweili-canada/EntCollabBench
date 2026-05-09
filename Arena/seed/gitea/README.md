# Gitea Seed Bundle Format

For each benchmark seed run you should provide:

- One SQL file under `dbs/` (exported from the same Gitea/DB version family)
- One repos tarball under `repos/` (contains bare `.git` repositories)

Example:

- `dbs/seed_v1.sql`
- `repos/seed_v1_repos.tar.gz`

Benchmark usage:

```bash
python scripts/benchmark_session_flow.py \
  --servers gitea \
  --sql-overrides-json '{"gitea":"/abs/path/to/seed_v1.sql"}' \
  --repos-overrides-json '{"gitea":"/abs/path/to/seed_v1_repos.tar.gz"}'
```

Auto-generate a minimal usable bundle (includes a tiny project codebase and push):

```bash
cd /home/aoaoder/clawbench/CompanyAgentTeam
./scripts/build_gitea_seed_bundle.sh
```

Generated outputs:

- `seed.sql`
- `repos.tar.gz`
- `sample_project/` (plain source copy for inspection)
- `check_report.json`
