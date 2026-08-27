# Report - ptitctf2026_nhh

## Goal

Decrypt AES-CBC whose key is `sha256(str(p))` from the special RSA in `enc.sage`.

## Exploitation

CF on `e/N` → primes `u,v`. Recover `K` in a ~200-candidate family. Brent ρ extracts sixteen 31–32-bit primes; `A=(∏p_i)<<9` is 512 bits. Howgrave-Graham `f(x)=x+A` (sympy LLL) yields 78-bit `s`; `p=A+s` factors `N`.

## Verification

`p` divides `N`; AES-CBC plaintext is `PTITCTF{7h47_5h0uld_b3_nhh,_h0ld1n9_y0ur_h4nd}`.

## Failed paths

- Treating `8F3K`-style tiny trial division as enough for `A`.
- Python-Fraction LLL (does not terminate).
- Padding `A` with the wrong extra 22/25-bit factors.
