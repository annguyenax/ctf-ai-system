# Stranger Papers — report

- **Event:** PTITCTF2026
- **Category:** Crypto (monoalphabetic substitution)
- **Status:** solved
- **Flag:** `PTITCTF{21.0286_105.8356}`

## TL;DR

502 photos → 22 unique folded-paper glyphs → 502-symbol substitution cipher. The plaintext is
**Vietnamese** (22-letter no-diacritics alphabet, spaces removed), not English. A Vietnamese
char-quadgram model + simulated annealing recovers a paragraph describing
**Văn Miếu – Quốc Tử Giám** (Temple of Literature, Hà Nội). Its coordinates are the flag.

## Key evidence

- `seq.txt`: 502 symbols over 22 glyphs (labels A=U00 … V=U21).
- IC = 0.078 → too concentrated for English prose (0.066), matches Vietnamese.
- 22 glyphs == the exact 22-letter Vietnamese alphabet without diacritics.
- Decoded paragraph (diacritics restored) names *Khuê Văn Các*, the *turtle steles*,
  the *three-entrance gate*, and *hiếu học* — unambiguous for Văn Miếu.

## Files

- `raw/plaintext_vi.txt` — recovered Vietnamese plaintext (diacritics stripped).
- `raw/key.json` — cipher-symbol → plaintext-letter mapping.
- writeup: `D:/download/CTFTimeWriteup/PTITCTF2026/Crypto/Stranger Papers/writeup/writeup.md`
- solver: `D:/download/CTFTimeWriteup/PTITCTF2026/Crypto/Stranger Papers/solve/solve.py`
