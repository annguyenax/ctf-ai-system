---
name: ctf-ai-system
description: Evidence-first, token-efficient CTF solving and knowledge capture for authorized challenges.
---

# CTF AI System

Use this skill for solving, reviewing, or documenting CTF challenges.

## Minimal load order

1. Read `ROUTER.md`.
2. Read `SYSTEM_PROMPT.md` and `AGENT_RULES.md` once per solve session.
3. Read exactly one primary `SKILLS/<CATEGORY>.md` file. Add a second only when the challenge is genuinely hybrid.
4. Read at most two routed playbooks/cards before the first discriminative test.
5. Read `KNOWLEDGE/tools_matrix.md` only if HexStrike or a heavy tool may help.

Do not preload every skill, playbook, card, or raw output. Search the index first and expand context only when evidence requires it.

## Required solve lifecycle

`INTAKE -> TRIAGE -> HYPOTHESES -> TEST -> EXPLOIT -> VERIFY -> CAPTURE`

- Keep no more than five active hypotheses.
- Every tool call must answer a stated question.
- A candidate flag is not solved until independently verified.
- Store concise evidence excerpts and paths, not entire noisy logs in context.
- After completion run `scripts/Test-CtfAiSystem.ps1 -ChallengeId <id>`.

## Durable outputs

1. Event writeup under `D:\download\CTFTimeWriteup\<Event>\...`
2. `OUTPUT/<id>/` with report, timeline, attempts, reusable patterns, and raw evidence
3. `KNOWLEDGE/cards/<id>.yaml`
4. Update `KNOWLEDGE/sources_index.md`
5. Create `final_flag.txt` only after verification

## Safety

Only work on CTFs, owned labs, or explicitly authorized targets. Never fabricate flags. Avoid broad scans and online brute force unless the challenge scope and a written hypothesis require them.
