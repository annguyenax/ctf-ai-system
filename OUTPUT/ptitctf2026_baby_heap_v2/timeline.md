# Timeline — ptitctf2026_baby_heap_v2

- TRIAGE: PIE/Full RELRO, glibc 2.35, counters 6/3/4, UAF free without NULL, Edit maps check, alarm 60s.
- TEST: tcache fd leak (page) + unsorted libc-0x21ace0 confirmed on remote.
- TEST: poison fd sticks (UAF Read after Edit). Menu still prints after FSOP write because it uses write(2).
- FAIL: apple2 on stdout — puts("Session closed") crashes, never reaches exit() flush.
- EXPLOIT: apple2 on stderr; stdout intact; wait SIGALRM; cat /flag.txt.
- VERIFY: remote output `Session closed\nPTITCTF{...}\ncat: /home/ctf/flag.txt: No such file or directory`
