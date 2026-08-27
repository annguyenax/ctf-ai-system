# Playbook: scanf("%s") null-write + length-field leak past a canary

**Trigger:** A CTF binary that (a) reads with `scanf("%s", buf)` (or `%s` family),
(b) stores a length/count field near a buffer and later prints an array of that many
elements, and (c) has PIE + stack canary + a `win()`/backdoor. Classic "calculator"/"bignum".

## Two primitives

1. **scanf("%s") stops at WHITESPACE, not NUL.** Send a token containing an embedded
   `\x00`: any parser that scans the buffer until `\x00` stops early, but `scanf` has
   already written the WHOLE token (including bytes after the NUL) to `buf`, overflowing
   into adjacent stack (length field, arrays, canary, saved rbp, return). => **arbitrary
   contiguous stack write with exact bytes** (constraint: no whitespace bytes 0x09-0x0d,0x20).

2. **Corrupt the length/count field** that governs a "print N elements" routine so it
   reads PAST the initialized data into stale stack (canary, saved rbp, return address),
   which then gets printed (as a big number / hexdump / list). => **info leak of canary+PIE**.

## Method

1. **Leak:** with primitive (2), set the count so the print routine reads through the
   return address. Keep the buffer's real values intact where the canary/return live
   (end your write before them; or use an identity operation like multiply-by-1). Parse
   the printed output to recover the canary and a return address; `pie = ret - <ret_off>`,
   `win = pie + <win_off>` (get offsets from `objdump`/`nm`).
2. **Write:** with primitive (1), in the SAME connection, overwrite `[... canary(exact) ...
   saved_rbp(any) ... return=win ...]`. Set the length field to a SANE value so any
   post-parse loop doesn't run wild.
3. **Return:** trigger the function's normal return (e.g. send "quit"); the canary matches
   (we wrote the leaked value) and control flows to `win()`.

## Pitfalls

- Bytes of canary/win that are whitespace break scanf -> reconnect (fresh canary/PIE).
- Re-set the length field in the write stage too, or a length-driven loop segfaults.
- Do NOT try to make a *computed value* (e.g. a bignum product) equal the return address —
  the write primitive is scanf, the bignum is only the leak oracle.
- Recv sync: prompts may arrive glued to the previous output; read until the prompt marker
  each iteration.

## Solved with this playbook

- L3akCTF2026 / Rudimentary Calculator — `cards/l3akctf_rudcalc.yaml`
