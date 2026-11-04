# Bounty Hunter — FortID CTF 2026

Status: scoreboard confirmed solved on 2026-10-10.

## Intake

- Category: Cryptography.
- Challenge source: CTFTimeWriteup/FortIDCTF2026/Crypto/Bounty Hunter/files/verifier.py
- Verifier SHA-256: 2A64DB6E12C17D03F7113DDB9E0DA50495BF8A0CEE1D05E4A474F393FA3AF08B
- Remote verifier and payout endpoint are used by the pre-existing solver.

## Vulnerability

The verifier checks each prover-supplied next polynomial's commitment and one evaluation, but never proves that the next polynomial is the result of folding the current polynomial. Since the prover controls both the next coefficients and their commitment, the proof can be forged round by round.

The existing solver targets report 271, field payout_authorized, claimed value 1. It obtains the public manifest and vector, computes the initial evaluations, chooses intermediate fold values, interpolates degree-one polynomials to satisfy the single checked fold equation, then uses the constant polynomial [1] in the last round.

## Evidence and limits

- Event evidence manifest: CTFTimeWriteup/FortIDCTF2026/Crypto/Bounty Hunter/solve/evidence/manifest.md
- Status and artifact checks: CTFTimeWriteup/FortIDCTF2026/Crypto/Bounty Hunter/solve/evidence/verification.txt

The existing solver submits a proof to the CTF instance. It was not rerun in this pass; no raw proof or response was retained. A read-only status.py query reported Bounty Hunter as SOLVED, and the local flag matched the writeup and format.
