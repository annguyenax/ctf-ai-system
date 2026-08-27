# Reusable patterns — bushbash_vault3

- **Signal:** binary says something like "Securely storing password in
  memory..." instead of a `.rodata` constant → password lives on a
  heap/pool that user-facing commands (write/edit/delete-style messages)
  may also touch. Check for a custom allocator before assuming the
  password is unreachable.
- **Bug class:** custom sbrk/pool allocators that recycle freelist nodes by
  availability flag only, without re-checking the original chunk's size
  class, let an attacker free a small object then write a larger one into
  the same slot — overflowing into whatever was `sbrk`'d immediately after
  it (allocation order == memory order for a bump allocator).
- **Precision trick:** when the overflow length is derived from
  `strlen(attacker_input)` (e.g. via `strncpy(dst, src, strlen(src)+1)`),
  embed a literal NUL byte in the raw payload at the exact target offset
  to stop the copy there — `strlen` stops at the first NUL in your own
  buffer, so you can land a clean, exactly-terminated overwrite without
  spilling into whatever comes after your target.
- **Workflow note:** stripped binaries under ~15 KB with no relocation
  noise are fast to read in raw `objdump -d -M intel` output by hand when
  Ghidra/HexStrike isn't reachable — walk from `main`'s first two/three
  `call`s (init helpers) before the command-read loop.
