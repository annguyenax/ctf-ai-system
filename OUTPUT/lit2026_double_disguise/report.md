# lit2026_double_disguise — report

- Event: LIT CTF 2026 / crypto
- Status: solved (verified)
- Flag: `LITCTF{F1fa_W0rld_cup}`

## Signals
- Title "double disguise" -> two layers.
- `ZmN+aX5sUWwbTEt1fRpYRk51SV9aVw==` is Base64 (charset + `==` + len%4==0).
- base64-decoded bytes non-printable -> inner cipher.

## Solve
Base64 decode; XOR decoded bytes with known prefix LITCTF{ -> constant 0x2A -> single-byte XOR key. XOR all bytes -> flag.

## Verification
Re-encrypt: base64(xor(flag,0x2A)) == original string.

## Reusable
Base64 (encoding) wrapping single-byte XOR (cipher). Known-plaintext prefix reveals key; constant delta => single-byte XOR.
