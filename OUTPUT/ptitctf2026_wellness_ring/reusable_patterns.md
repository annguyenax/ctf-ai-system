# Reusable — sentinel chunk + free-list reorder overlap

- If an allocator inserts a same-size lost chunk after the victim, OOB hits the sentinel. Free a same-size object first so the victim reuses that slot and the live object stays in the OOB window.
- Extra deref `p=*(desc+0x10); src=*p` is a pointer-to-iovec, not an inline buffer.
- glibc 2.39 Ubuntu 24.04: zip libc often `puts=0x87bd0`; live images may be `0x87cc0`. Trust the leak nibble.
- Menu that `printf`s: smash **stderr** for exit() FSOP, not stdout.
