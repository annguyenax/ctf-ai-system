# Playbook — DOM/CSS media-query extraction

## Trigger signals

- Runes depict screen ratio, pointer, printer, orientation, monochrome, or pixel density.
- A page contains a grid of apparently random characters.
- CSS has rare media queries sharing a highlight style.

## Workflow

1. Preserve the original artifact and SHA-256.
2. Run shallow image checks; cap unsupported QR/stego paths.
3. Inspect HTML, route manifests and client chunks for clue-like names.
4. Archive the component and CSS before hashed assets disappear.
5. Build an `element-id -> character` map.
6. Extract IDs selected by each relevant media query.
7. Translate each ordered ID list into a segment.
8. Derive segment order and preserve literal delimiters drawn in the clue.
9. Verify offline and save stdout plus hashes.

## Minimal tool whitelist (≤5)

1. Browser developer tools
2. `curl`
3. `rg`
4. Python standard library
5. `exiftool` for initial shallow artifact checks

Alternative: browser device emulation and print preview can reveal cells manually,
but static parsing is faster and avoids feature-support differences. Never run
network/vulnerability scans for this client-asset extraction pattern.
