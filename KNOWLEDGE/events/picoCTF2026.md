# picoCTF2026 — Batch 7 digest

Covers 7 entries from this batch (not necessarily the event's full challenge set), spanning Crypto/Forensics/General/Pwn.

Recurring techniques in this batch:
- Several "General Skills" challenges are stacked/keyless encoding puzzles (base64/hex/url/rot13) or require replicating a known external tool's exact wordlist-generation algorithm (CUPP) against provided personal details.
- A couple of challenge folders here ship only `files/` + `final_flag.txt` with no solver/writeup at all — flag text present but no recorded derivation.
- One "Binary Exploitation" challenge is actually a static-analysis knowledge quiz rather than a live exploit.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Crypto/Shared Secrets | Crypto | DH shared secret from a leaked private exponent -> single-byte XOR key | solved | picoctf2026_shared_secrets |
| Crypto/StegoRSA | Crypto | no source (only files present: image.jpg, private.pem, flag.enc; no solver/writeup) | needs_verification | - |
| Forensics/Binary Digits | Forensics | ASCII '0'/'1' text decoded to bytes -> embedded JPEG with flag as image text | solved | picoctf2026_binary_digits |
| General/MultiCode | General | trivial stacked keyless encoding (base64->hex->urldecode->rot13) | solved | - |
| General/Password Profiler | General | CUPP-style wordlist generation from OSINT personal details + SHA-1 crack | solved | picoctf2026_password_profiler |
| General/Undo | General | no source (only chalenge.md + final_flag.txt; no files/solver/writeup) | needs_verification | - |
| Pwn/Quizploit | Pwn | static ELF-analysis knowledge quiz answered and scripted over the socket | solved | picoctf2026_quizploit |
