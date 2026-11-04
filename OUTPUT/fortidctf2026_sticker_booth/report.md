# Sticker Booth — FortID CTF 2026

Status: solved, platform-confirmed 2026-10-10.
Flag: FortID{I_h0p3_Y0u_W1ll_Pu7_Th15_5t1ck3r_0n_Y0ur_L4p70p_a763247af7}

- Pwn; binary: custom pool allocator (0x4000) + items[32]; builtin print = file-dump
  primitive gated by per-process booth_ticket stored in the same pool.
- Bug: mono photo render row loop off-by-one (h+1 rows) zeroes the header of the
  next pool block; captions with equal text share a refcounted block -> zero the
  refcount -> remove frees block while second caption dangles.
- Chain: fake caption header len=0x300 via upload -> print dangling caption leaks
  pool incl. 8-byte ticket -> upload fake builtin {kind=2, flag=1, ticket,
  path="flag.txt"} -> print dumps flag.
- Solver: CTFTimeWriteup/FortIDCTF2026/Pwn/Sticker Booth/solve/solve.py (stdlib-only,
  local|remote modes). Writeup: same folder writeup/writeup.md.
- Verification: local flag.txt dump reproduced; remote TLS instance dump; platform accepted.
