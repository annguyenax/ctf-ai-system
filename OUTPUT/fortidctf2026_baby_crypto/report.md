# Baby Crypto — FortID CTF 2026

Status: scoreboard confirmed solved on 2026-10-10.

## Intake

- Category: Intro / crypto.
- Artifact: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Crypto/files/chall.py
- Source SHA-256: 312C2DCE27157EEBCFFF119ACC4D6D5BADA2BFB02A2804A51FF42AAC03612DD6
- No connection information was present in the ingested metadata; a live instance solver and endpoint later appeared in the challenge folder.

## Attack

The vault encrypts each value using AES-CTR with nonce equal to the first eight bytes of the plaintext. The flag is inserted first. User-chosen entries are also encrypted under the same random key for that process. Guess the flag's eighth byte after the fixed FortID{ prefix, submit chosen plaintext with that same first-eight-byte prefix, then XOR known plaintext and ciphertext to recover the matching flag keystream.

An existing solver in solve/solve.py implements the remote attack. I did not rerun it in this pass. The local flag is 70 characters, has the expected format, and matches the writeup. A read-only status.py query reported Baby Crypto as SOLVED.

## Evidence and limits

- Event evidence: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Crypto/solve/evidence/verification.txt
- Manifest: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Crypto/solve/evidence/manifest.md

The scoreboard response verifies the challenge status. The raw live ciphertext exchange is not present in this workspace, so this report does not claim to independently replay the remote exploit. There is also a reproducibility mismatch: the existing solver uses ssl.create_default_context(), while the writeup says the endpoint has a self-signed certificate and TLS verification was disabled. The live exploit was not rerun to resolve this.
