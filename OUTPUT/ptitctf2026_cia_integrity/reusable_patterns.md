# Reusable patterns

## Integrity-hash password oracle
When a zip password equals `sha256(flag).hexdigest()`, the flag is the string
whose SHA-256 equals the recovered password. SHA-256 preimages cannot be forged,
so a candidate flag matching the hash is cryptographically verified.

## Factoring 280-bit RSA (140-bit primes)
- Pure Python (sympy.factorint) too slow.
- GMP-ECM is the right tool; on Kali without root, extract from Debian .deb:
  `gmp-ecm_7.0.4+ds-5_amd64.deb` + `libecm1_7.0.4+ds-5_amd64.deb`, run with LD_LIBRARY_PATH.
- Own C ECM with GMP: stage1 (Montgomery/Suyama) + stage2 (Brent-Suyama continuation).
  Precompute the stage-2 prime list ONCE; reusing across curves is essential.
  Correct Montgomery addition needs the P1-P2 difference point (baby steps use
  prev/cur recurrence with difference = Q).

## Nested AES-zip layers
Open with standard Python `zipfile` + `pwd=bytes(password,'ascii')`; read nested
zips from memory with `io.BytesIO`.

## Sub-challenge plaintexts as reversed hex fragments
Some challenges output a hex string that decodes to a reversed flag fragment:
`bytes.fromhex(m.decode())` then `[::-1]`. Watch for this "route from last mark
back to first" pattern.

## Hastad / Rabin / batch-gcd
- Hastad e=3: CRT combine then `gmpy2.iroot(C,3)`.
- Rabin: `pow(c,(p+1)//4,p)` + CRT (p,q = 3 mod 4); pick ASCII candidate.
- Batch-gcd: skip self-comparison (gcd==n) to avoid ZeroDivision.
