# Timeline

- 2026-10-10 — Static analysis identified the DOS text-mode Ctrl-Z check, binary-mode reread, unbounded `%[^ ]s` write, and 16-bit stack wrap.
- 2026-10-10 — Payload redirected the near return to DOS file-copy shellcode; the instance returned `FLAG.TXT` through `OUTPUT.TXT`.
- 2026-10-10 — FortID accepted the flag. The temporary instance was stopped.
- 2026-10-11 — Restored the missing canonical `final_flag.txt` and marked the board entry as scoreboard-solved. No new submission was made.
