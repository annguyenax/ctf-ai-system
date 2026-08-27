# Report — L3akCTF2026 / RSA Eclipse (crypto)

- **Status:** solved (verified)
- **Flag:** `L3AK{Th3_P3numbr4_H1d35_Th3_Fl4w_In_Th3_Mers3nne_V01d}`
- **Artifact:** `crypto_rsa-eclipse.tar.gz` (sha256 b84b7e1...c0c3e)

## Signal -> approach

RSA with unbalanced primes (607/521-bit). N in hex shows long `0xFF` runs -> primes
near powers of two: `p=2^607-a`, `q=2^521-b`. `a*b = N mod 2^521` (tiny), `b = (2^1128-N)>>607`.
Recover a=2799, b=1749, rebuild p,q, decrypt.

## Verification

`p*q == N` exact; flag clean ASCII with correct framing. Deterministic, offline.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Crypto/RSA Eclipse/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Crypto/RSA Eclipse/solve/solve.py`
- Card: `KNOWLEDGE/cards/l3akctf_rsa_eclipse.yaml`
- Playbook: `PLAYBOOKS/crypto_rsa_near_power_of_two.md`
