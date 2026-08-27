# Signaling (PTITCTF2026 / Crypto) — PAUSED

- **Status:** paused (flag not recovered; no final_flag.txt)
- **Artifact:** `D:\download\CTFTimeWriteup\PTITCTF2026\Crypto\Signaling\files\Signaling.zip` → `Signaling.mp4` (553 frames, 1080×1350, 25fps, video-only)
- **Best hypothesis:** flag is carried by the lighthouse **beam** (Morse or direction-based code).

## Evidence
1. Beam points at 4 discrete diagonal directions (SE/SW/NW/NE) forming 2 opposite axes, toggling every ~10 frames.
2. Beam-up flash signal (sky window) shows deliberate Morse-like ON/OFF: dots ≈7 frames, dashes ≈17 frames, gaps ≈3/13/23.
3. Morse decode of beam-up signal → `EIUEE ?EEE NA EE ?` (grid search → `EETEETETETE ?`); not a readable flag.
4. Direction sequence (31 runs) + durations extracted (see writeup).
5. Base-4 (hex/bits/bytes) with all permutations → no ASCII. Direct substitution to `PTITCTF{...}` impossible (4 symbols).

## 2026-08-22 resumed analysis

- Corrected the visual model: this is a clock with a long hand (~164 px), a short hand (~114 px), and static ticks starting near 171 px.
- Mid-hold ray sampling recovers 47 ordered hand pairs without the previous tick contamination.
- One fixed transform (rotate +45 degrees, mirror) maps all 47 pairs to standard semaphore letters:
  `HWRNUQZQKJEXRMUWBKRIUPFCRMUJHNXWMRLNHUCVOTMOLRK`.
- The outer ring supplies 42 real two-sector pairs. It is not a direct semaphore plaintext, fixed-lag copy, simple 6-bit XOR/add/subtract key, coordinate-wise angle offset, or fixed cross-pairing with the hands.
- MP4 shallow triage found only normal `ftyp/mdat/moov` atoms, no appended flag/text, and no convincing LSB payload.
- External research confirms that ABM's `次元通信 (Signaling)` MV intentionally uses semaphore and hidden messages, but no public decode matching this clip was found.

## Next 3 actions
1. Recover the exact two-channel semaphore convention from the original MV/creator context.
2. Treat the outer pair as a constrained per-symbol reference frame and test dihedral transformations against language/flag structure.
3. Verify any candidate by deterministic replay from the 47 ordered hand pairs; do not guess a flag.

## Files
- Writeup: `D:\download\CTFTimeWriteup\PTITCTF2026\Crypto\Signaling\writeup\writeup.md`
- Solvers: `solve\morse_decode.py`, `solve\morse_grid.py`
