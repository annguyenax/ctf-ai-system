# Stack evaluation — bushbash_bliss_i

Overall grade: **B**.

| Dimension | Score | Evidence / rationale |
|---|---:|---|
| Discoverability | 4/5 | Clear `SKILL.md` entry and quickstart; no dedicated misc skill. |
| Knowledge retrieval | 3/5 | Compact index, but no frontend/CSS image-pivot pattern existed. |
| Capture completeness | 5/5 | Report, timeline, attempts, flag, pattern, raw, card, playbook, and writeup present. |
| HexStrike fit | 1/5 | Static JS/CSS parsing needs no security scanner. |
| Friction | 3/5 | Mandatory guidance is split; canonical `hexstrike-ai/tools_matrix.md` was absent while the matrix lives under `ctf-ai-system/KNOWLEDGE/`. |
| Safety | 5/5 | Offline-first, bounded retries, whitelist, and no-full-scan rules worked. |
| Reuse | 5/5 | Card, router row, solver, assets, and playbook make this reusable. |

Correction note: the initial capture omitted three literal hyphens visible in
`runes.png`. The solver, flag, card, report, index, and playbook were corrected
after submission rejection exposed the delimiter mistake.

Second correction: the hyphenated value was also rejected for Bliss I. The
public challenge API then established that Bliss II is chained after Bliss I;
the CSS/rune result was misattributed. The Bliss I record was downgraded to
`needs_verification` and its `final_flag.txt` removed.

## What the stack prevented from being missed

- Failed QR, bit-plane, subtraction and traversal paths are preserved as evidence.
- The media-query technique became a routed playbook/card rather than a one-off.
- Hashed client assets and solver stdout remain reproducible even if the route is later removed.

## Top three improvements

1. Add `SKILLS/MISC.md` routing image puzzles to bounded stego, web-client,
   encoding, and visual-clue branches.
2. Consolidate onboarding and fix the stale HexStrike matrix path.
3. Add a capture validator for schema, JSON/YAML, links, hashes, and solved count.

## Category tool whitelist (≤5)

Browser developer tools, `curl`, `rg`, Python standard library, `exiftool`.

## HexStrike health and usefulness

At `2026-08-01T09:17:43+07:00`, the health endpoint returned `status: healthy`,
version `6.0.0`, and “API Server is operational”. It was degraded:
`all_essential_tools_available=false`, 4/127 tools overall, 1/16 forensics, and
0/8 essential. Evidence: `../bushbash_bliss_i/raw/hexstrike_health.json`.

HexStrike was **UP but degraded** and **not useful for this challenge**. Only the
health endpoint was queried; no HexStrike tool or scan was invoked.
