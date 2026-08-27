# Playbook: PNG/DEFLATE repair when bytes were periodically inserted

## Trigger
- A PNG (or other zlib-compressed artifact) won't open; zlib raises
  `invalid literal/lengths set` / `incorrect data check`.
- Challenge text hints at a marker/word; a short byte pattern repeats at a
  FIXED spacing inside the file.

## Preconditions
- Signature + IHDR intact (dimensions/color type readable).
- Damage is INSERTION of a fixed marker (reversible), not overwrite (lossy).
  Signal: the marker bytes appear at offsets `start + k*stride`, equal spacing.

## Minimal method
1. Parse chunks; verify which CRCs fail; note declared IDAT length L.
2. Find the repeating marker bytes (`rg`/regex) and confirm equal spacing S.
   Original block size = S - len(marker).
3. Rebuild: walk the file, keep `block` bytes, skip the marker when it matches:
   ```python
   out=bytearray(); i=0
   while i<len(d):
       out+=d[i:i+BLOCK]; i+=BLOCK
       if d[i:i+M]==MARKER: i+=M
   ```
4. Take IDAT (original length L) from the rebuilt bytes; `zlib.decompress`.
5. Sanity: decompressed size must equal `h*(1 + w*channels)` (color type →
   channels: 0→1, 2→3, 3→1(palette), 4→2, 6→4).
6. Repackage IHDR+IDAT+IEND with correct CRCs; render to read the flag.

## Verification
- Decompressed raw size == exact expected scanline size.
- Deterministic: re-running the strip yields the identical image.

## Pitfalls
- Repetitive compressed bytes can be legitimate deflate of a flat-color region.
- A dynamic-Huffman block is atomic: you cannot partial-decompress past the
  first corrupted byte — repair the stream first.
- Distinguish per-scanline PNG filters if later variants scramble filter bytes
  (see faulty_image_2/3/4 for pixel/filter-level tampering).

## Faster path next time
Grep the hinted marker word as bytes first; if equally spaced, strip on stride
before any deep DEFLATE analysis.
