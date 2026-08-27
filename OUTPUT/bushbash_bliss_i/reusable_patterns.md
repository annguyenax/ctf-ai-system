# Reusable pattern — frontend media queries as a character oracle

1. Bound ordinary image hypotheses with quick metadata/decoder checks.
2. Inspect page HTML and client route manifests for clue-like paths.
3. Archive the route component and linked CSS before infrastructure disappears.
4. Extract DOM nodes pairing stable IDs with characters or tiles.
5. Search CSS for rare features: aspect ratio, pointer, orientation, monochrome,
   and device pixel ratio.
6. Collect selected IDs and map them back to DOM text.
7. Use the visual clue—not stylesheet order unless justified—to order segments.
8. Preserve every drawn delimiter from the clue; here the three hyphens between
   the four inner pictograms are literal flag characters.
9. Verify with a static parser; preserve stdout and asset hashes.

Detection signal: random character cells plus multiple rare media queries sharing
a highlight declaration. Pitfalls include forcing a QR interpretation, relying
on one device, and failing to archive hashed assets.

Time heuristic: after two failed shallow image paths, spend five minutes on page
source, routes, JS strings and `@media`. See
`PLAYBOOKS/misc_css_media_query_extraction.md`.
