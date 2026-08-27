# SKILL — PWN

## Triage signals

| Signal | Likely |
|--------|--------|
| Binary + nc service | stack/heap/fmt/logic |
| `checksec`: NX/PIE/Canary/RelRO | exploit constraints |
| Format strings in output | fmt leak/write |
| Menu / heap notes | heap exploitation |
| Login + “offline BF” | hash leak / weak auth (not classic memcorr) |
| Java `Integer`/`Long` compared with `==` | Integer cache / boxing bug |
| Kernel / driver | separate advanced path |

## Fast path checklist

1. `file`, `checksec`, `strings` (flag-ish, interesting funcs).  
2. Run locally with same libc if provided.  
3. Crash classification: RIP control? partial overwrite?  
4. Leak → defeat ASLR → ROP/shell.  
5. One-shot remote only after local reliability.  
6. Java boxed `==` → values in **[-128,127]** only (`PLAYBOOKS/pwn_java_integer_cache.md`).

## Discriminative tests

- Cyclic pattern → offset.  
- Format `%p.%p.%p` if fmt suspected.  
- Overflow length sweep (powers of 2) for canary crash vs clean exit.

## Tool whitelist

`checksec`, `gdb`/`pwndbg`/`gef`, `pwntools`, `ROPgadget`/`ropper`, `one_gadget`, `readelf`/`objdump`.

## Avoid early

Blind remote heap spray, endless remote reconnect BF without leak model.

## Deliverables

- Vulnerability class + offset  
- Exploit script path  
- libc/leak chain  
- Flag evidence  
