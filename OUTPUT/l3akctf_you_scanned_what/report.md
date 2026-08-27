# Report — L3akCTF2026 / You Scanned WHAT?!?

- **Status:** solved (verified)
- **Category:** forensics / computed tomography
- **Artifact:** `scan.7z` (SHA-256 `e45a1da91290e654002c5c1ea49e5bf3caaad0e073dd76d848c2c2b6b955a92c`)

## Signal → approach

The archive contains one healthy SQLite database. Its `projections` table has
180 integer angles and variable-length JSON detector vectors. Detector lengths
vary with the rotated bounding box, while values behave as column means.

Recover line integrals by multiplying each mean vector by the rotated canvas
height, inferred from `detector_count` at angle +90 degrees. Center-pad to a
common detector axis and run filtered backprojection (`iradon`, ramp filter).

## Verification

Two clean solver runs from the original archive produced byte-identical PNGs
(SHA-256 `aabee2bc31d0fca483346ed663ce37e9ecfd2d8b2fff8fc7cabd7bfd9cf2fdba`).
The reconstructed text was visually checked after correcting axis orientation.
Per workspace policy, the flag and image evidence remain only in the event
writeup/evidence layer, not this knowledge output.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Forensics/You Scanned WHAT_!_/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Forensics/You Scanned WHAT_!_/solve/solve.py`
- Playbook: `PLAYBOOKS/forensics_variable_width_radon.md`
