# Reusable Patterns

- For safe-linking, freeing a chunk whose `next` is NULL reveals `chunk >> 12` in its first qword.
- If two same-size chunks are adjacent and share a page, the encoded forward pointer from the older chunk can be XORed with that page key to recover the newer chunk address.
- A stale-pointer edit can poison the tcache list with `target ^ (freed_chunk >> 12)`; allocate once for the original chunk and again for the target.
- Derive heap-relative offsets from the actual service. Local stdio and launcher allocations can shift the hidden object even when the binary is identical.
- If a flag crosses read boundaries, concatenate raw bytes from contiguous windows before applying the flag regex.
- For remote captures, preserve exact bytes and distinguish a successful service read from portal acceptance.
