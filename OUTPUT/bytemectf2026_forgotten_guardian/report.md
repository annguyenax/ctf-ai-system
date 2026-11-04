# ByteMe CTF 2026 — The Forgotten Guardian

Status: **solved locally / verified**. Flag: `OWASP{VOR}`. Portal submission: **not attempted**.

## Evidence

The social cache gives archive number 27. The archive table has exactly one row for 27, mapping to `VOR`. The curator says the guardian mark is the record key, and the social clue specifies a three-letter mark. The local solver enforces those joins and uniqueness checks, then records the exact lines and SHA-256 hashes in:

`D:/download/CTFTimeWriteup/ByteMeCTF2026/OSINT/The Forgotten Guardian/solve/evidence/recovery.json`

Reproduce with `python solve/solve.py` from the challenge directory. The two original files remain only in the event workspace; this report does not duplicate them.

## Verification limits

The result is a deterministic local reconstruction from the provided artifacts and required flag format. The portal was not accessed or submitted to, so scoreboard acceptance is unverified.
