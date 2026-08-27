# AGENTS.md — CTF workspace instructions

## Primary skill pack

**Load / obey:** `ctf-ai-system/` (Grok skill name: `ctf-ai-system`).

Entry files:

| File | Role |
|------|------|
| `ctf-ai-system/SKILL.md` | Skill entry + map |
| `ctf-ai-system/SYSTEM_PROMPT.md` | How to solve |
| `ctf-ai-system/AGENT_RULES.md` | Speed + evidence rules |
| `ctf-ai-system/KNOWLEDGE/sources_index.md` | What we already know |

## Event writeups

`BushBash2026/`, `jailCTF2026/` — per-challenge `writeup/` + `solve/`.

## After every solve

1. Event writeup path  
2. `ctf-ai-system/OUTPUT/<id>/`  
3. `ctf-ai-system/KNOWLEDGE/cards/<id>.yaml`  
4. Update `sources_index.md`  

## Do not

- Full-scan with HexStrike by default  
- Fabricate flags  
- Skip knowledge capture  
