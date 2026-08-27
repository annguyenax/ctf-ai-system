# Playbook: RSA with near-power-of-two ("Mersenne-void") primes

**Trigger:** An RSA modulus whose hex/binary shows long runs of `0xFF` (or `0x00`),
or unbalanced prime bit-lengths where Fermat fails. Prompt hints at "Mersenne",
"eclipse", "penumbra", powers of two.

## Idea

Primes shaped `p = 2^bp - a`, `q = 2^bq - b` (bp >= bq), with small a, b. Then:

```
N = p*q = 2^(bp+bq) - b*2^bp - a*2^bq + a*b
```

- Everything except `a*b` is a multiple of `2^bq`, so **`a*b = N mod 2^bq`** (tiny -> exact).
- `2^(bp+bq) - N` is dominated by `b*2^bp`, so **`b = (2^(bp+bq) - N) >> bp`** (refine if off by 1).
- `a = (a*b) / b`. Rebuild `p, q`; verify `p*q == N`.

```python
ab = N % (1 << bq)
b  = ((1 << (bp+bq)) - N) >> bp
a  = ab // b
p, q = (1<<bp) - a, (1<<bq) - b
assert p*q == N
```

Then standard RSA: `d = pow(e, -1, (p-1)*(q-1))`, `m = pow(c, d, N)`.

## Variants

- Primes could be `2^n + k` (then N slightly above a power of two -> leading `0x00...01`).
- If bit-lengths unknown, read them from the hex structure (where the `0xFF` run breaks).

## Verification

`p*q == N` exactly. If it's off by a little, adjust b by +-1 or re-read the bit boundary.

## Pitfalls

- Do NOT use Fermat on unbalanced primes (they are far apart).
- General factoring / ECM won't crack a 500-bit factor — the structure is the shortcut.

## Solved with this playbook

- L3akCTF2026 / RSA Eclipse — `cards/l3akctf_rsa_eclipse.yaml`
