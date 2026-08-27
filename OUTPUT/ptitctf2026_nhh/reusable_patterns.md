# Reusable patterns — That Should Be nhh

- `e/N ≈ v/u` with 80–100-bit primes: continued fractions recover them even when `|eu-Nv|` looks huge (~2^{Nbit-u-v}).
- Invert `e=(Kv + u//2)//u` as `K=(eu - u//2 + ρ0 + t v)/v`, `t < u/v`.
- 32-bit smoothness of half of `K`: trial-to-2^16 is useless; Brent ρ with √(2^32) iterations and several `c`.
- Known MSBs of `p`: `f(x)=x+A`, Howgrave-Graham `X=2^{unknown}`, `β=0.5`. Use `sympy.Matrix.lll`, not a Fraction LLL.
- `smooth()` pads with `2^(bits-nbits())`; reconstruct `A` as `(∏ 31–32-bit primes)<<k` to exact 512 bits.
