# Timeline — lit2026_double_disguise

1. Read challenge.md: base64-looking string, title "double disguise".
2. Base64 decode -> 22 non-printable bytes -> second layer expected.
3. XOR decoded bytes with LITCTF{ -> constant key 0x2A -> single-byte XOR.
4. XOR all -> LITCTF{F1fa_W0rld_cup}.
5. Verified via re-encrypt (xor+base64) == original.
6. Wrote solver, evidence manifest, writeup, card, OUTPUT.
