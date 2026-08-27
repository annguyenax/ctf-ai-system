# Reusable — glibc 2.35 tcache poison + House of Apple 2

- Preserve tcache key at freed chunk +8; zeroing it is OK for malloc but keep it to avoid surprises.
- Safe-linking encode is `target ^ (chunk >> 12)`; if the two tcache chunks share a page, the leaked `fd<<12` page is enough.
- Create/Edit that `fopen("/proc/self/maps")` allocate a `locked_FILE` (bigger than 0xe0) **before** the UAF write; poison after fclose still sticks.
- If the menu uses `write(2)` rather than `printf`, overwriting stdout does not fire until `puts`/`exit`. Smash **stderr**, leave stdout valid, trigger on `exit()` `_IO_flush_all`.
- pwncli `house_of_apple2_execmd_when_exit(fp, _IO_wfile_jumps, system, "sh")`: flags `"  sh"`, `_lock=fp-0x10`, `chain=system`, `_codecvt=fp`, `_wide_data=fp-0x48`.
- Docker `entrypoint` wrote `/flag.txt`, not `/home/ctf/flag.txt`.
