# Reusable patterns — Rudimentary Calculator

- **scanf("%s") stops at whitespace, not NUL:** embed `\x00` to satisfy a parser that scans
  until NUL while scanf keeps writing your exact overflow bytes. See
  `PLAYBOOKS/pwn_scanf_null_and_len_leak.md`.
- **Corrupt a length/count field -> stack leak:** a "print N array elements" routine with an
  attacker-controlled N over-reads stale stack (canary, saved rbp, return) -> leaks PIE+canary.
- **Canary between overflow and return:** leak it, write it back exactly; canary LSB is always 0x00.
- **Whitespace-constrained write:** if a needed byte (canary/addr) is whitespace, reconnect for a
  fresh canary/PIE (~75% success/try).
- **Don't force a computed value to be the target address** — use the raw-write primitive (scanf);
  the computed structure (bignum) is only the leak oracle.
- Develop pwn directly against the live instance when local run is unavailable — pure python ssl
  + struct suffices for read/write oracles.
