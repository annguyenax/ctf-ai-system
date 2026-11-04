# Report - securinetsquals2026_house_of_ekko

## Goal

Read the flag from the House of ekko service (`nc pwn2.securinets.tn 7001`) and submit it.

## Environment and artifact hashes

- Challenge 16, 500 points, dynamic. Flag format `Securinets{...}`.
- Attachment `files/to_give.zip` SHA-256 `0a7805cdb7d3a4f0c06fff1ecc8e819822ce6b8695b5e0622a50f9eae101e708`.
- Handout binary, libc, and loader extracted under `D:\download\ctf-scratch\securinets-houseofekko\`. Local runs use that loader, not the system libc.
- HexStrike was not used.

## Enumeration and decisive signals

- Two slots, UAF on `free`, signed size, `fgets` stops at newline.
- Runtime free of a small chunk returns a smallbin pointer (`libc+0x1d1cb8`), so tcache is off despite the glibc 2.43 strings.
- `GNU_RELRO` is `[0x3dc0, 0x4000)`. `JUMP_SLOT` is at `0x4000–0x4038`. `FLAGS_1` has no `BIND_NOW`. Partial RELRO.
- libc's GNU property note lists IBT and SHSTK. `chall` does not.
- `puts` (`libc+0x76ab0`) begins with `endbr64`. `setcontext` begins with `endbr64` at `libc+0x40e30`. The next instruction, `0x40e34`, is `push rdi`.

## Exploitation / recovery

Smallbin leak, overlap of the wide chunk onto the other slot, arena image written through `last_remainder`, unsorted insert of a poisoned smallbin that links a fake `FILE` into `_IO_list_all`. Exit flushes it. The wide vtable calls `setcontext` at `0x40e30`. The pivot is `pop rsp` (`0x25401`) into `openat` / `read` / `write`. The first path is `/app/flag.txt`.

## Verification

Local `pivot` prints `root:x:0:0:root:/root:/bin/bash` from `/etc/passwd`. One `pivotremote` printed `Securinets{lets_hope_i_dont_push_the_revenge}` (libc `0x70c18cebf000`, wchunk `0x5e84c751c030`, 320 bytes). `submit_flag.py "House of ekko"` returned `correct` for id 16 and wrote `final_flag.txt`.

## Failed paths and why

- tcache poison / safe-linking, inferred from the version string. The running allocator never fills a tcache.
- Full RELRO, inferred from the `GNU_RELRO` segment. The function GOT is writable and was not the bug.
- `system(" sh")` closes with no abort and no output.
- `setcontext+4` reads `/etc/passwd` locally and returns an empty body on the service in about 0.25s. The indirect call misses `endbr`.

## Lessons and faster path

Run `readelf -n` and one `free` of a small chunk before writing a heap plan. If a libc hook works for `puts` and dies for an interior gadget, compare the target with `endbr64` before debugging the syscall inside that gadget.

## Alternative approaches

A `mov rdx, rdi; jmp 0x40f56` gadget would also skip `rt_sigprocmask`. This libc does not have one. It was not required once the call landed on `endbr`.
