# Timeline

- Inspected the ELF and confirmed stale freed pointers plus UAF read/write.
- Recovered safe-linked pointers from two adjacent freed chunks.
- Confirmed the primitive locally with a temporary marker under Kali WSL.
- Rejected two remote offset assumptions after a process close and a zero-filled read.
- Scanned the leaked heap page, then joined adjacent windows at offsets `0x240` and `0x2b0`.
- Matched the exact flag from remote bytes. Portal submission was not performed.
