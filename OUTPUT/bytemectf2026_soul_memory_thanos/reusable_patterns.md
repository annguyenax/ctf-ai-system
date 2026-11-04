# Reusable Patterns

- A freed heap slot that is not cleared remains a usable alias. Check every operation that frees an object for updates to all owning arrays and caches.
- If a later operation allocates the same size and accepts structured input, a stale slot can alias the new object without tcache poisoning.
- For a stale object with an indirect callback, inspect the call site to identify the controlled offset and argument registers. Here the callback at +0x38 is invoked with the object pointer in RDI.
- A callback address printed for a PIE object can disclose the PIE base when the matching symbol offset is known. Validate page alignment before deriving another target.
- Callback gates may depend on exact global counters and a per-object magic value. Plan object creation, one-time operations, and frees as a state sequence before the remote run.
- A bundled loader/libc crash can be a local artifact mismatch. Compare with the host runtime before treating it as evidence that the exploit sequence is wrong.
- A stale pointer plus same-size record allocation can be simpler than tcache poisoning when the allocation immediately reuses the most recently freed chunk.