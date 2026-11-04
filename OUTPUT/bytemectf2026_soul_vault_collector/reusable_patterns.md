# Reusable patterns

- A global table that is not cleared after `free()` exposes a stale alias for later inspection and rename operations.
- For glibc tcache, the freed `fd` is stored as `next ^ (chunk >> 12)`. A freed first entry leaks the page key; a neighboring encoded pointer can recover low heap bits when allocation stride is known.
- Reusing a 0x40 chunk for both a structure request and a 48-byte buffer request allows an adjacent-field overlap. Track the exact allocation order: the structure allocation consumes the poisoned chunk, then the buffer allocation consumes the fake next entry.
- A `%s` read through a pointer that aliases a callback field can disclose a PIE address. Subtract the known callback offset and verify page alignment; locally compare with `/proc/<pid>/maps`.
- When a hidden gate depends on contiguous writable counters, a tcache poison can turn a normal bounded input into a multi-counter write. Account for the allocator clearing the first two words of a returned tcache entry before the program reads user data.
- Binary line-based readers treat `0x0a` as a terminator. Check encoded pointers and leak-pointer payload bytes before sending; choose another suitable heap candidate when a payload contains a line feed.
- A recovered flag does not imply portal acceptance. Keep challenge metadata OPEN until the platform accepts a submission.
