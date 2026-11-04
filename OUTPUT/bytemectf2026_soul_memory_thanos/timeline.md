# Timeline

- Intake: confirmed the scoped host, archive, flag format, and ELF64 PIE binary.
- Static analysis: found a stale archive pointer after merge_souls frees its source; transfer_soul allocates a same-sized record and controls the indirect callback.
- Runtime check: the bundled loader/libc pair aborted on input; the WSL system runtime ran the binary.
- Local verification: leaked inspect_human, calculated the PIE base, met the counters, reclaimed the final source chunk, and obtained the exact flag.
- Remote verification: one connection to the challenge service returned the same exact flag.
- Portal: left OPEN; no submission was performed.