# Reusable patterns — RSA Eclipse

- **Inspect N in hex/binary first** for "weird" RSA: long 0xFF/0x00 runs ⇒ primes near powers of two.
- **Near-power-of-two primes:** `p=2^bp-a, q=2^bq-b` ⇒ `a*b = N mod 2^bq`, `b=(2^(bp+bq)-N)>>bp`.
  See `PLAYBOOKS/crypto_rsa_near_power_of_two.md`.
- **Unbalanced primes ⇒ Fermat is useless**; look for structure instead of brute factoring.
- **Don't trust pre-seeded `solve/` files** — verify independently (this one's old stub only built a pub.key).
