# bushbash_the_eye stack evaluation

## Scores (1–5)

| Dimension | Score | Evidence |
|---|---:|---|
| Discoverability | 4 | Canonical sibling layout and `PROJECTS.md` made the stack easy to locate. |
| Knowledge retrieval | 4 | OSINT playbook, source index, tool matrix, and anti-patterns constrained the investigation effectively. |
| Capture completeness | 5 | Writeup, solver, flag, attempts, reusable pattern, timeline, raw evidence, card, and source-index entry are captured. |
| HexStrike fit | 2 | Useful for archive/file/metadata triage; it lacked a working astrometric plate solver and did not solve the core image-registration problem. |
| Friction | 3 | MCP/API connectivity worked, but tool availability was partial and cross-environment file transfer/astronomy tooling added overhead. |
| Safety | 5 | Hypothesis-only whitelist, no full scan, read-only OSINT checks, and cryptographic flag verification. |
| Reuse | 4 | The label-association and AES-oracle lessons generalize to annotated maps and dense-image OSINT. |

## What would have been missed without the stack

- The requirement to preserve artifact hashes and distinguish verified plaintext from padding-only false positives.
- The bounded HexStrike workflow that quickly rejected archive steganography and metadata hypotheses.
- Durable capture of failed hypotheses, especially the nearest-centroid trap, for future image-registration challenges.

## Top three improvements

1. Add an astrometry/plate-solving wrapper (`solve-field` or a documented remote solver) with explicit scale bounds.
2. Add a star-label association helper that models text baselines, overlapping halos, and multiple nearby sources instead of plain nearest-neighbor matching.
3. Add a single capture command that validates required OUTPUT/card/index fields and copies evidence to canonical sibling paths.

## Category tool whitelist (≤5)

`file`, `binwalk`, `exiftool`, `execute_command`, `execute_python_script`.

## HexStrike health and usefulness

At final verification, `http://192.168.77.138:8888/health` was **healthy/up**, version 6.0.0, with all 8 essential tools and 60/127 total tools available. It was useful for artifact triage and evidence, but not for the decisive constellation registration.

## Grade

**B** — disciplined and reusable stack with good safety/capture, limited here by missing astrometry support and image-label association tooling.
