# PTITCTF2026-CK — digest (batch 9, partial: 3 of this event's challenges)

Recurring techniques observed in this subset (not confirmed to cover the full event):
- Fully statically-solvable binaries (symbols intact, no live randomness) that nonetheless gate submission on an ambiguous answer-encoding hint, under a tight attempt budget.
- Layered reverse challenges deliver their real validation logic as a scrambled/obfuscated secondary artifact (custom bytecode program) that must be unscrambled via a separate, deterministic, offline-replayable transform before it can be parsed.
- Pwn challenges in this event again show truncated-size-vs-actual-write mismatches, this time blocking the second (control-flow-hijack) stage after a first (info-leak) stage already succeeded live.

| path | category | one-line technique or pitfall | status | card id |
|---|---|---|---|---|
| Reverse/Escape maze | Reverse | Fully static deterministic maze (recover layout/edges from .rdata, BFS shortest path, RLE-encode per prompt's example); answer format ambiguous due to two deliberate prompt typos with 3+ mutually exclusive hint readings, under a hard 5-submission limit | needs_verification | ptitctf2026ck_escape_maze |
| Reverse/💸Racing Monster💸 | Reverse | Scrambled bytecode buffer unscrambled by a deterministic, iteration-seeded transform replayed 80x offline; decoded VM's repeating 14-byte units directly yield each flag byte via xor/subtract, confirmed by VM replay | solved | ptitctf2026ck_racing_monster |
| Pwn/InfosecPTIT Code CLI | Pwn | Markdown-table renderer's truncated column-count field enables a live libc-base leak (confirmed); a second overflow meant to smash a guard/FP field falls short of the actual offset and its bytes are uncontrolled allocator pointers, blocking RCE | paused | ptitctf2026ck_infosecptit_code_cli |
