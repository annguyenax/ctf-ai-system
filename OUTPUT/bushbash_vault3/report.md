# Report — bushbash_vault3

## Goal

Open remote vault (`Hack The Vault III`, 34.40.133.67:6002) — third in the
Moss Man series, custom "hardened" vault (no plaintext password in
`.rodata` this time).

## Enumeration

`strings vault` — no plaintext password, but "Securely storing password in
memory..." + `write`/`delete`/`auth` command set + `password.txt`/`flag.txt`
filenames. `objdump -d -M intel` of the ~14 KB stripped ELF (small enough to
read by hand) reveals a custom sbrk-based pool allocator shared between
startup decoy chunks, the password buffer, and user `write` messages.

## Exploitation

Startup allocates 3 contiguous chunks in order: A (0x38/0x20 data, freed),
B (0x58/0x40 data, freed), C (0x38/0x20 data = password, never freed).
`write`'s allocator reuses ANY freed node regardless of its original size,
then `strncpy(chunk, input, strlen(input)+1)` — no bounds check. First
`write` reuses A; a message ≥144 bytes overflows A → B-header → B-data →
C-header, landing in C's data (the live password buffer). Embedding a NUL
right after the chosen replacement password bounds the overflow exactly
(strlen/strncpy stop at first NUL in the attacker's own input).

Payload: `b"A"*144 + b"pwn3d" + b"\x00\n"` via `write`, then `auth` with
`pwn3d`.

## Flag

`bushbash{th1rd-times-th3-chArM!}`

## Note

Series continues: Vault I (rev/strings, plaintext password) → Vault III
(rev/heap, custom allocator size-confusion overflow). Vault II not
attempted/present in this workspace.
