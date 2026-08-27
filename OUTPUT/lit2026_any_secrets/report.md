# lit2026_any_secrets — report

- Event: LIT CTF 2026 / crypto
- Status: solved (verified)
- Flag: `LITCTF{ASCII-jUl1us-c43s4r-gewowa}`

## Signals
- Flavor "Et tu, Brute?" -> Caesar/brute.
- Ciphertext `HEP?PBw=O?EE)fQh-qo)_0/o0n)casks]y` has symbols+digits -> shift over raw ASCII bytes.

## Solve
Match cipher 'H'(72) to plain 'L'(76) => constant +4. Brute 256 shifts mod 256, keep prefix LITCTF{ ... }. Only +4 valid.

## Verification
Decrypt-then-reencrypt: shift(flag,-4) == ciphertext exactly.

## Reusable
Caesar over full byte range (mod 256), not A-Z only, when ciphertext contains non-letters.
