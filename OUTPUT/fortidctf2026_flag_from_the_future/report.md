# Flag from the Future — FortID CTF 2026

Status: solved, platform-confirmed 2026-10-11.
Flag: FortID{R3al_L1f3_H45_N0_R3w1nd_Bu7t0n}

- Misc/reverse-transformation: flag typed into a Conway's Game-of-Life text
  renderer, then evolved N generations; only the final board screenshot is given.
- Grid extraction: exact 36x382 binary board; live cells are 6x6 blocks in 8x8
  tiles starting at (7,0) -> solve/current_grid_exact.txt.
- Joint unknowns: renderer model + generation count N. Fixed by local search:
  DejaVuSansMono-Bold.ttf @16px, threshold >=128, B3/S23, N=18.
- Critical subtlety: the font hmtx advance 1233/2048 em = 9.6328125 px breaks
  after ~15 chars. The real advance is the browser's 1/64-px quantization:
  round(616.5)/64 = 617/64 = 9.640625 px (Math.round half-up). With it, one
  continuous text run matches the whole board.
- Solve: left-to-right beam over printable ASCII, render candidate -> evolve 18
  gens -> compare causally-safe left window; deterministic verify solve/solve.py
  reproduces all 909 live cells with 0 mismatches.
- Solver: CTFTimeWriteup/FortIDCTF2026/Misc/Flag from the Future/solve/solve.py.
