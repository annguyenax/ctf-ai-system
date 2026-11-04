# End of Life — FortID CTF 2026

Status: solved and accepted by the FortID portal on 2026-10-10.

The DOS program validates `INPUT.TXT` in text mode, where Ctrl-Z (`0x1a`) ends the read, then reopens the same file in binary mode and scans an unbounded token into a 17-byte stack buffer. A short lowercase prefix followed by Ctrl-Z passes validation while the full binary payload overwrites the saved near return address. The 16-bit stack wrap redirects execution to shellcode placed at `DS:0000`, which copies `FLAG.TXT` to `OUTPUT.TXT` using DOS `INT 21h` calls.

Verification: the challenge service returned the flag from `OUTPUT.TXT`, and the portal replied `Flag correct! / Challenge solved!`. The human writeup contains the layout and exploit sequence. The exact payload bytes/solver were not retained, so a full automated replay is not currently available.

Challenge writeup: `D:\download\CTFTimeWriteup\FortIDCTF2026\Pwn\End of Life\writeup\writeup.md`  
Challenge artifact: `D:\download\CTFTimeWriteup\FortIDCTF2026\Pwn\End of Life\files\handout.zip`
