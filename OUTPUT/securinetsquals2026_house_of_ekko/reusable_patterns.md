# Reusable pattern - securinetsquals2026_house_of_ekko

## Detection signals

- A heap menu whose `free` does not clear the slot, with only two indices.
- glibc is new enough to contain tcache symbols, but a freed small request shows a smallbin fd.
- `GNU_RELRO` exists and `FLAGS_1` has no `BIND_NOW`.
- The libc note lists `IBT` and the main executable does not.
- House-of-apple style flush: fake `FILE` on `_IO_list_all`, wide vtable `+0x68`.

## Decision rule

If `puts` on that vtable slot returns on the remote and `setcontext+4` does not, call the symbol that starts with `endbr64` (`setcontext`, not `setcontext+4`) before hunting a `rdx = rdi` gadget.

## Minimal workflow

1. Leak the smallbin header (`libc+0x1d1cb8` on this build) and retry on `0x0a`.
2. Confirm the overlap and the `last_remainder` write with one local and one remote probe.
3. Build the arena `FILE`, point `+0x68` at `setcontext`'s `endbr`, and pivot with `pop rsp` into `openat`/`read`/`write`.
4. Prove locally with `/etc/passwd` (`root:`), then one remote connection.

## Verification

Local stdout contains `root:`. Remote stdout contains `Securinets{`. The scoreboard returns `correct`.

## Pitfalls / non-applicable cases

- Do not treat a `GNU_RELRO` segment as Full RELRO.
- Do not treat tcache tunables in `strings` as proof the allocator uses tcache.
- `setcontext+4` is fine only when the indirect-call target is not checked for `endbr`.
- `0x40e6d` is `mov rsp, [rdx+0xa0]`. `rdx` is not the `FILE` at the wide doallocate call.
- A newline inside a leaked pointer desynchronizes `fgets`. Retry that connection only.

## Faster path next time

`readelf -n` on libc and one small `free`/`show` before any tcache or RELRO plan. If a known-good libc function returns remotely and an interior gadget does not, diff the first four bytes against `f3 0f 1e fa`.
