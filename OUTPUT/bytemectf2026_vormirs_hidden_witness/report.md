# ByteMe CTF 2026 — Vormir's Hidden Witness

Status: **solved locally / cross-checked**. Flag: `OWASP{VORMIR-SOUL-UNSEEN}`. Portal submission: **not attempted**.

The board resolves `ash_17` to `mirror_04` and `silent_keeper` to archive page 77. Page 77 says the witness posted a timestamp rather than a face. Decoding `02 / 17 / 26 / 09` with the board's mapping yields `VORM`, matching the prefix of the mirror's explicit case shorthand `VORMIR-SOUL-UNSEEN`. The exact shorthand wrapped in the declared flag format gives the local result.

Reproduce with `python solve/solve.py` from the challenge folder. Evidence and input hashes are recorded in `solve/evidence/recovery.json`.
