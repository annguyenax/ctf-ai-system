# CTF AI System

An evidence-first, token-efficient research pack for authorized CTF solving and teaching.

## Start here

1. `SKILL.md` - contract and minimal load order
2. `ROUTER.md` - route signals to one category skill/playbook
3. `SYSTEM_PROMPT.md` + `AGENT_RULES.md` - solve state, budgets, evidence, safety
4. `KNOWLEDGE/sources_index.md` - compact retrieval index
5. `KNOWLEDGE/tools_matrix.md` - local/HexStrike decision matrix

The key design rule is progressive disclosure: do not load the full repository. Search the index, open only the relevant category skill plus one or two playbooks/cards, then run a discriminative test.

## Canonical layout

| Path | Role |
|---|---|
| `D:\download\CTFTimeWriteup` | event challenges, solvers, writeups |
| `D:\download\ctf-ai-system` | prompts, skills, playbooks, knowledge, solve outputs |
| `D:\download\hexstrike-ai` | Windows MCP client; Kali hosts the API/tools |

## Solve outputs

Solved work requires `report.md`, `timeline.md`, `attempts.json`, `reusable_patterns.md`, `raw/`, and a verified-only `final_flag.txt`, plus an event writeup, solver, card, and index update.

Validate with:

```powershell
.\scripts\Test-CtfAiSystem.ps1 -ChallengeId <id>
```

## Knowledge philosophy

- Router/index: short detection signals and links.
- Category skills: general decision trees.
- Playbooks: reusable technical workflows.
- Cards: challenge-specific evidence and pitfalls.
- Raw outputs: stored on disk, never preloaded into model context.

Current CVE facts are retrieved on demand from primary sources after exact fingerprinting; they are not copied into a permanently "latest" prompt.
