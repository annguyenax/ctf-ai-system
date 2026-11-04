# Reusable patterns

- With a non-PIE binary, no canary, a `gets` overflow, and a `win()` symbol, inspect the exact local buffer address in the vulnerable function and calculate the saved-RIP offset from the frame.
- Prove the payload against a local debug flag before making one scoped remote attempt.
- If `checksec` is unavailable, `readelf` program headers/symbols and `objdump` disassembly can answer the essential questions.
