# Reusable patterns
1. Life-renderer inversion: extract exact grid first, fix (font, size, threshold,
   pen model) by search, then beam-search the text against the FINAL board using
   causally-safe windows (left region is unaffected by future characters).
2. Browser font rasterization: never trust raw font advance widths; browsers
   quantize to 1/64 px with half-up rounding (Math.round). A 0.008 px difference
   derails long text reconstruction.
3. Generation-count recovery: sweep N forward from the seed; only the true N
   keeps the causal window stable while extending characters.
