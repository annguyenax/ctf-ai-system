# Old Calculator — solve report

## Summary
- **Event:** Securinets CTF Quals 2026 (Crypto, challenge 24, 500 pts)
- **Flag:** `Securinets{ed9a482110a5a6936482e700155f811742f97a04decfa75d3cee28bca77239c1}`
- **Status:** verified
- **Service:** `calculator-crypto.securinets.tn:4873`

## Vulnerability
Sixteen rounds of a hidden affine map `F(t)=a*t+b`. The tables satisfy `y[i]=a*x[i]+b`. The only value read is one non-negative cell of at most 8 bits, and it is revealed together with the challenge input `R`.

## Attack chain
1. Weighted sum of eight pair-deltas so the denominator stays nonzero.
2. Float Newton reciprocal, 40 iterations from `d/2^32`.
3. `b = y[0] - a*x[0]`.
4. Submit the float `a + b/256`, decode it, answer `a*R+b`.
5. Repeat until round 16 returns the flag JSON.

## Verification
Two separate connections both finished round 16 with the same flag. A wrong answer on an earlier build leaked `Expected` and matched `a*R+b` except when `b>=16` was packed into a nibble.

## Artifacts
- Solver: `D:\download\CTFTimeWriteup\SecurinetsQuals2026\Crypto\Old Calculator\solve\solve.py`
- Writeup: `D:\download\CTFTimeWriteup\SecurinetsQuals2026\Crypto\Old Calculator\writeup\writeup.md`
