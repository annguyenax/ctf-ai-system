# Fortune Teller — FortID CTF 2026

Status: scoreboard confirmed SOLVED on 2026-10-10.

Flag: `FortID{Fortun3_Fav0r5_Th3_b0ld_bu7_al50_Th05e_Th4t_C4n_Expl0i7_F0rma7_Str1ng_VulnZZ_02d63a5fba}`

## Intake

- Category: Pwn.
- Challenge ID: `fortune-teller`.
- Source: `CTFTimeWriteup/FortIDCTF2026/Pwn/Fortune Teller/files/chall.c`.
- Binary: `CTFTimeWriteup/FortIDCTF2026/Pwn/Fortune Teller/files/fortune`.
- The ingested metadata listed no instance; an existing solver contains the live service endpoint and exploit.

## Vulnerability

The oracle reads a question and calls `printf(question)`, allowing a format-string exploit. A format-string write can set the global `blessing` variable to `0x1337`; choosing “Receive blessing” then calls `win()`, which prints the local flag file.

## Verification and limits

The local flag matches the challenge writeup and format, and a read-only status.py query listed Fortune Teller as SOLVED. The existing network solver was not rerun in this verification pass. Evidence: `CTFTimeWriteup/FortIDCTF2026/Pwn/Fortune Teller/solve/evidence/verification.txt`.
