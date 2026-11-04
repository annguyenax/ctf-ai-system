# Timeline — ptitctf2026ck_stranger_papers_revenge
1. INTAKE: extract chall (3).zip -> 7 images (cover, instructions, 5 ledgers).
2. TRIAGE: category=crypto; OCR cover + instructions.
3. HYPOTHESES: H1 acrostic on cover (chosen); H2 numbers->mod67->base64->message (secondary).
4. EXPLOIT: cover 6 sentences' first letters U P S I D E -> UPSIDE = six-letter filing word.
5. VERIFY: solve.py replay asserts UPSIDE; "Thế giới ngược" = Upside Down theme match.
6. CAPTURE: writeup, solver, card, sources_index updated.
