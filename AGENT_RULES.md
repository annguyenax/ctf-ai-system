# Agent rules

## Budget and stopping

- Default budget: 25 minutes unless the user sets another limit.
- Initial triage/research: target 10%, hard cap 20%.
- Keep at most five active hypotheses; normally start with three.
- Stop a path after three failed discriminative tests unless new evidence changes the model.
- After 12 command blocks or 50% of the time budget, run `PROMPTS/critic_prompt.md`.
- Do not confuse long tasks with useful tasks: reassess before scans, brute force, full decompilation, symbolic execution, or model downloads.

## Tool-call contract

Before a non-trivial tool call write:

```text
Question: ...
Expected positive signal: ...
Expected negative signal: ...
Budget: time/output limit ...
```

Afterward save raw output and record the conclusion. If output is large, search/filter it on disk rather than injecting it into context.

## Research and CVE freshness

- Fingerprint product, version, commit, protocol, compiler/runtime, or distinctive text locally first.
- Prefer primary sources: vendor/upstream advisory, NVD, CISA KEV, GitHub Advisory Database, OSV, official changelog.
- Record `source_url`, publication/update date, affected range, fixed range, and why the artifact matches.
- A CVE generator produces a draft PoC, never verification.
- Do not maintain a "latest CVEs" list in prompts; query live sources when the version evidence warrants it.

## HexStrike

- Check `server_health` before selecting a HexStrike tool.
- HexStrike tools run on Kali. Confirm artifact locality and transfer/create only
  the minimum file in a per-challenge Kali scratch path; Windows paths are not
  automatically visible to the server.
- Use exact MCP tool names from `KNOWLEDGE/tools_matrix.md`; do not assume conceptual options such as a global `enabled_tools[]` exist.
- Select one focused tool per question. Maximum five tools per hypothesis.
- The client default request timeout may exceed CTF needs; constrain tool-specific parameters and terminate long processes when supported.
- For long/asynchronous jobs, use process status/termination tools instead of
  launching duplicate scans. Meta-tools may propose a shortlist, but the agent
  must approve each specialist call against the current hypothesis.
- If unavailable/degraded, record it once and use local tools. Do not repeatedly health-check.
- Never use comprehensive/autorecon/masscan/all-template modes as first actions.

## Evidence and verification

- Every conclusion cites a file, command output, offset, packet/request, model tensor, or source URL.
- Preserve artifact hashes and key raw evidence.
- Mark candidate status as `none`, `candidate`, `probable`, or `verified`.
- Create `final_flag.txt` only at `verified`.
- Public flags, LLM generations, OCR guesses, and visual similarity are not sufficient alone.

## Capture

Required for solved challenges:

- `report.md`, `timeline.md`, `attempts.json`, `reusable_patterns.md`, `raw/`, `final_flag.txt`;
- event writeup and deterministic solver/notes;
- knowledge card using `KNOWLEDGE/card_template.yaml`;
- row/router update in `KNOWLEDGE/sources_index.md`;
- successful `scripts/Test-CtfAiSystem.ps1 -ChallengeId <id>`.

For unsolved/paused work, omit `final_flag.txt`, set card status honestly, and preserve the best next actions.

## Storage contract: SHOW / LEARN / DISPOSABLE

- **SHOW - CTFTimeWriteup:** one original artifact copy, deterministic solver,
  minimal dependencies, readable writeup, evidence manifest and only the small
  evidence directly supporting claims.
- **LEARN - ctf-ai-system:** concise report/timeline/attempts, card, reusable
  pattern and playbook. Link to event artifacts; do not duplicate them.
- **DISPOSABLE - `D:\download\ctf-scratch\<id>`:** extracted copies, fuzz output,
  payload permutations, decompiler projects, browser profiles, common wordlists,
  model/package caches, venv/vendor/node_modules, intermediate images and logs.

Default generated-evidence budget is 10 MiB per challenge. Keep only decisive
10-40 line excerpts, the final payload, and at most one failed payload that
teaches a reusable pitfall. Every retained evidence file must appear in a
manifest with claim, source/tool, reproduction command, hash and retention reason.

Before completion, size-review and delete the challenge scratch directory after
verifying its resolved path. Never recursively delete a repository/event root,
home directory, or unresolved variable. Report retained and reclaimed sizes.

## Safety

CTF/owned/authorized scope only. Avoid denial of service, persistence, credential stuffing, indiscriminate scanning, and excessive queries to shared infrastructure.
