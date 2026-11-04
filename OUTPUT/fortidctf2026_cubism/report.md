# Cubism — FortID CTF 2026

Status: solved, platform-confirmed 2026-10-11.
Flag: FortID{Th3_CUB3_15_47_tH3_54M3_T1M3_4_SYmB0l_0f_51Mpl1c1tY_4nD_C0Mp13Xi7y}

- Reverse (Ghidra + asm): input 21x21x21 voxel grid (<=244 solid), 6 OR-projections
  must QR-decode (quirc, 12px modules) to "SIMON SAYS GIVE ME THE FLAG".
- Key insight: quirc reads fliplr(M) as transpose(M) (top-right finder anchor), so
  the pair-of-words task = matrix M where BOTH M and M.T are valid QR codes.
  Transposed format word is rev15(w), never canonical, but BCH always corrects;
  only L1<->L4 pairs have solvable systems.
- Exact algebra (no search): bits after the 4-bit terminator are free variables;
  RS parity is GF(2)-linear -> 208 linear equations per word pair, Gaussian
  elimination gives exact solution family (kernel 21-37 dims); hill-climb kernel
  to minimize black modules.
- 3D assembly: scan light solutions, pick triples whose black fibers all have
  valid voxels, then MILP (HiGHS) picks <=244 voxels meeting 3 projections.
- Solver: CTFTimeWriteup/FortIDCTF2026/Reverse/Cubism/solve/ (solve_pair_gf2.py,
  solve_match_triples.py, solve_ilp_cube.py, cube_input.txt). Writeup in folder.
