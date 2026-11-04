# Reusable pattern

## Trigger

A PHP migration endpoint combines raw query-string filtering, typed inputs, weak comparisons, and deserialization.

## Method

Check PHP's normalized `$_GET` keys separately from the raw query. Test whether arrays change strict type/equality outcomes while string concatenation collapses them. Look for numeric-string magic hashes under `==`, and inspect deserialization allowlists plus path checks for truthiness errors such as `strpos(...)` at offset zero.

## Verification

Reproduce each gate against the exact PHP source and preserve the final response or platform acceptance. This challenge is a chain: satisfying only the access bypass does not reach the flag read.

## Pitfalls

- `strpos` returns an integer offset; zero is false in PHP conditionals.
- Array-to-string conversion may emit a warning while still collapsing distinct arrays to the same string.
- Magic-hash behavior depends on loose comparison and the exact hash prefixes.
- Keep instance credentials in environment variables, not solver source.
