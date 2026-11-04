# ptitctf2026ck_stranger_papers_revenge — report
- PTIT CTF 2026 (Chung kết) / crypto ; solved via cover acrostic -> filing word "UPSIDE".
- Flag: PTITCTF{UPSIDE}

## Signals
Cover (1.jpg) has exactly 6 instruction sentences. First letters: Under/Papers/Subject/
Internal/Do/Entry -> U P S I D E = "UPSIDE" (matches "six-letter filing word").
Instructions (2.jpg): 67-tooth correction wheel, mod 67, base64 catalog (A-Z a-z 0-9 / + =),
"shuffled by the filing word". Ledgers (3-7.jpg): 3-digit "scars".

## Exploit
Acrostic on the cover gives the filing word = flag. Number layer = mod 67 -> catalog ->
base64 -> hidden message (secondary confirmation).

## Verification
solve.py deterministically asserts filing_word == "UPSIDE". Theme: "Thế giới ngược"
= The Upside Down = UPSIDE(+DOWN).

## Reusable
Acrostic detection on cover/intro pages; modular-wheel + base64 catalog pattern.
