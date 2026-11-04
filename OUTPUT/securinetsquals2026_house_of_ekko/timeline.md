# Timeline - securinetsquals2026_house_of_ekko

| Time | Phase | Observation / decision | Evidence |
|---|---|---|---|
| 2026-10-18 | TRIAGE | Menu UAF, two slots, handout glibc 2.43. Early notes guessed Full RELRO and live tcache. | `notes/ANALYSIS.md` |
| 2026-10-18 | TEST | Freed `malloc(0x50)` shows smallbin `libc+0x1d1cb8`. `JUMP_SLOT` is outside `GNU_RELRO`. No `BIND_NOW`. | `notes/ANALYSIS_SESSION2.md` |
| 2026-10-18 | TEST | Overlap marker, pop2 `double free or corruption (out)`, and remote `puts` of ` id` then `free(): invalid pointer`. | scratch `exploit_local.py` modes |
| 2026-10-18 | EXPLOIT | `setcontext+4` ORW prints `root:` locally and returns an empty body remotely. | session 2 notes |
| 2026-10-18 | TEST | libc note has IBT+SHSTK. `puts` is `endbr64`. `0x40e34` is not. No `mov rsp,[rdi]`. | objdump / readelf |
| 2026-10-18 | EXPLOIT | Call `setcontext` at `0x40e30`. Local still prints `root:`. | `pivot` rest 80 bytes |
| 2026-10-18 | VERIFY | One remote run prints the flag. Portal status `correct`. | `final_flag.txt` |
