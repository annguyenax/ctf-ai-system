# Stranger Papers — timeline

1. Recon: 502 photos, 22 unique hashes → 502-symbol sequence (`notes/seq.txt`).
2. IC 0.078 → monoalphabetic substitution, but NOT English (too high).
3. English quadgram/trigram/char-4gram SA + word-pattern dictionary all fail → word salad.
4. Vision models on folded glyphs fail (fold pattern confuses letter ID).
5. Pivot: 22 glyphs == Vietnamese alphabet without diacritics (no f/j/w/z); IC matches Vietnamese.
6. Build Vietnamese char-quadgram model from vi.wikipedia, run SA → coherent Vietnamese paragraph.
7. Identify place = Văn Miếu – Quốc Tử Giám → coordinates 21.0286, 105.8356 → flag.
