# ByteMe CTF 2026 — Soul's Weakness

Status: **solved locally / verified**. Flag: `OWASP{S0ul_St0ne_Buff3r_0v3rfl0w}`. Remote confirmation and portal acceptance: **unverified**.

`vault()` reads with `gets()` into a 32-byte buffer at `[rbp-0x20]`. The saved-RIP offset is 40 bytes. The non-PIE, no-canary ELF has `soul_stone()` at `0x4011b6`, and that function prints the flag literal from `.rodata`.

The offset-40 payload was run against the supplied ELF in Kali WSL; the target function printed the exact flag before the process faulted on return. Evidence and hashes are in:

`D:/download/CTFTimeWriteup/ByteMeCTF2026/Binary Exploitation/Soul's Weakness/solve/evidence/recovery.json`

Reproduce with `python3 solve/solve.py --local` under Linux/WSL. One remote attempt could not be captured because Windows console encoding rejected a control byte; no remote result is claimed and no retry was made.
