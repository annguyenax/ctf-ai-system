# Reusable patterns

- Decimal directory components can encode an ASCII path; decode each component only after validating its numeric range.
- When many PNGs differ only in metadata, compare IHDR/PLTE/IDAT instead of whole-file hashes to group their actual image payloads.
- A unique image fingerprint can disambiguate a large set of flag-shaped path decoys.
- Read ZIP members in place and inspect headers/chunks; avoid bulk extraction when archive paths are deeply nested or long.
