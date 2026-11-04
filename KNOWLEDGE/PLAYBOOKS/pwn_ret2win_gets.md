# Ret2win from an unbounded `gets`

## Trigger

An ELF has an unbounded input such as `gets`, plus a reachable `win()`/`print_flag()` function.

## Preconditions

- Confirm architecture and ABI.
- Confirm the target address is stable (typically no PIE).
- Check for a stack canary and the memory-execution policy; ret2win does not need executable stack when returning into existing code.
- Identify the actual buffer address in the vulnerable function's frame.

## Minimal method

1. Disassemble the vulnerable function and compute `offset = buffer-to-saved-RBP distance + pointer size`.
2. Construct padding followed by the target function address in native little-endian order on x86-64.
3. Test locally with a scratch-only `flag.txt` if the target function reads a file.
4. Make one connection to the explicitly scoped CTF service and send the tested payload.

## Verification

Require the local target function to print a known marker, then require the scoped service to return a flag-shaped string. Preserve the exact binary hash, address/offset evidence, and remote response excerpt.

## Pitfalls

- Do not use the buffer's declared size as the offset without checking compiler padding.
- Stack alignment can matter when the target function calls libc; verify the exact payload locally.
- Use `readelf` and `objdump` if `checksec` or pwntools is missing.
- Do not create an official-looking flag from a local debug marker.

## Faster path

If symbols are present, find `win()` first. For a non-PIE binary with no canary, a direct ret2win is cheaper than building a libc ROP chain.
