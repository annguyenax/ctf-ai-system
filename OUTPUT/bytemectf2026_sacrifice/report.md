# ByteMe CTF 2026 — Sacrifice

Status: **solved locally / verified**. Flag: `OWASP{4_50u1_f0r_4_50u1_v0rm1r}`. Portal submission: **not attempted**.

## Finding

The PCAP contains FTP uploads over passive data streams. One stream reconstructs to a JPEG with a ZIP appended after the image. Its JPEG comment gives the ZIP passphrase. Decrypting `comms.bin` and decompressing gzip → bzip2 → gzip produces a tar archive. The log `comms/natasha_romanoff/comn.log` contains the Base64-encoded flag.

## Verification

The deterministic solver reassembles by TCP sequence, checks for conflicting overlap and gaps, verifies the expected ZIP member/tar path, validates the flag format, and matches the pre-existing `final_flag.txt`. The detailed hashes and sizes are in:

`D:/download/CTFTimeWriteup/ByteMeCTF2026/Forensics/Sacrifice/solve/evidence/recovery.json`

Reproduce with `python solve/solve.py` from the challenge directory. The original PCAP remains only in the event workspace.

## Limit

This is a local reconstruction; the scoreboard was not accessed or updated.
