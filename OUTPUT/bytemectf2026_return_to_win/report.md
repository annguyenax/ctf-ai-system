# ByteMe CTF 2026 — Return to Win

Status: **solved and remotely verified**. Flag: `OWASP{g3ts_1s_4_s3cur1ty_n1ghtm4r3}`. Portal submission: **not attempted**.

`hello()` reads into a 10-byte local buffer at `[rbp-0xa]` with `gets`. The saved RIP offset is 18 bytes. The non-PIE ELF exposes `win()` at `0x40125e`; NX is enabled and there is no stack canary. The payload is 18 padding bytes followed by the little-endian `win()` address.

The local binary printed a scratch-only debug flag. One connection to the challenge-provided service then returned the real flag. Details and hashes are in:

`D:/download/CTFTimeWriteup/ByteMeCTF2026/Binary Exploitation/Return to Win/solve/evidence/recovery.json`

Reproduce the payload locally with `python solve/solve.py`. `python solve/solve.py --remote` makes a single connection and prints the service response.
