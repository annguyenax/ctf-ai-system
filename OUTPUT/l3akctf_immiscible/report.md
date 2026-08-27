# Report — L3akCTF2026 / Immiscible (crypto)

- **Status:** solved (verified)
- **Flag:** `L3AK{Oil_4ND_v1N3g4r_WitH0ut_Mix1nG_Sp1LL5_eV3rYth1ng}`
- **Artifact:** `crypto_immiscible.tar.gz` (sha256 2987ea3...77e9f)

## Signal -> approach

Raw Oil-and-Vinegar central map over F_79 (M=9 quadratics, N=8 vars, V=O=4). No
oil*oil terms => fixing vinegar linearizes in oil. Brute vinegar (79^4, numpy-batched
modular Gauss), solve 4 eqns for oil, verify the other 5. Unique consistent point =
secret signature = [23,7,73,60,34,54,53,7]. AES key = sha256(bytes(sig)).

## Verification

eval_public(sig)==target for all 9 polys; AES unpads to a clean L3AK{} flag. ~48s, offline.

## Notes

z3 and sympy groebner both timed out (>2min); the OV structure + vectorized linear
algebra is the fast path. Pre-existing repo solver (z3) replaced with a numpy one.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Crypto/Immiscible/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Crypto/Immiscible/solve/solve.py`
- Card: `KNOWLEDGE/cards/l3akctf_immiscible.yaml`
- Playbook: `PLAYBOOKS/crypto_oil_and_vinegar_invert.md`
