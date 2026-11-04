# Reusable patterns

- Inspect local symbols and `.rodata` before building a generic exploit; a hidden function may print the secret directly.
- For a `gets()` buffer at `[rbp-N]`, the saved-RIP offset is `N + pointer_size`; verify it from disassembly.
- Use a Linux local run with a captured binary output when a Windows console cannot represent echoed control bytes from an address overwrite.
