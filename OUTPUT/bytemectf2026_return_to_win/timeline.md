# Timeline — 2026-10-09 (Asia/Saigon)

1. Inspected the ELF and attachment archive.
2. Read ELF headers/symbols and disassembled `hello()`/`win()`; derived offset 18 and target `0x40125e`.
3. Verified the payload locally using a scratch-only debug flag.
4. Used one scoped connection to the challenge endpoint; the service returned the flag.
5. Captured evidence and left portal submission untouched.
