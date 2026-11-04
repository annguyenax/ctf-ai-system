# Baby Rev — FortID CTF 2026

Status: solved and locally verified on 2026-10-10.

Flag: FortID{nokia_3310_is_still_the_most_robust_piece_of_technology_i_have_ever_owned}

## Intake

- Category: Intro / reverse engineering.
- Artifact: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Rev/files/chall.pyc
- Artifact SHA-256: 32D584F6E8FEB6F7224735F5AEBB21FA7F6DE3F622E6E3FC9F4C0EBC9626426C
- The challenge lists no remote instance.

## Solve

The bytecode constrains an 81-character FortID flag using a reversed T9 touch-tone string and a SHA-256 digest. Convert the underscore-separated words to standard phone keypad digits, reverse the resulting sequence, and compare it with the embedded tone constant. The tone sequences are ambiguous, so use the embedded SHA-256 to identify the exact phrase.

Run from the challenge directory:

    python solve/verify.py

The verifier reads chall.pyc as bytes and does not execute it. It checks the candidate's T9 transformation, the expected hash, and the presence of both constants in the original artifact.

## Evidence and limits

- Event evidence manifest: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Rev/solve/evidence/manifest.md
- Verification transcript: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Rev/solve/evidence/verification.txt

The existing writeup reported platform acceptance. A read-only status.py query on 2026-10-10 independently listed Baby Rev as SOLVED.
