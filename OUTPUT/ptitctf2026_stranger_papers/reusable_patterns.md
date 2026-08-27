# Reusable patterns

## "The substitution isn't English" heuristic

When a monoalphabetic substitution won't crack with English n-grams, check the language:
- **IC** relative to English (0.066 no-space / 0.074 with-space).
- **alphabet size**: 22 symbols == Vietnamese-without-diacritics (no f/j/w/z); 26 == English;
  fewer suggests a reduced alphabet.
- Build a char-quadgram model from the target language's corpus (strip diacritics first) and run
  the same simulated-annealing substitution cracker. Swap the n-gram source, not the algorithm.

## Vietnamese substitution cracker

- Corpus: scrape `vi.wikipedia.org` (`action=query&prop=extracts&explaintext`), strip combining
  marks (`unicodedata.normalize('NFKD')`), keep only `[a-z]`.
- Alphabet: 22 letters `abcdefghijklmnopqrstuvxy` (no f/j/w/z), rough frequency order
  `nhatiuocgemrdybsvlkpqx`.
- Standard SA: swap two symbol assignments, accept by Metropolis, occasional unused-letter swap to
  explore the full 26-letter space, final greedy polish.

## Folded-paper glyphs are a distraction

If the glyphs are folded letters, you usually do NOT need to unfold/OCR them — the sequence of
distinct glyphs is a plain substitution and can be broken statistically.
