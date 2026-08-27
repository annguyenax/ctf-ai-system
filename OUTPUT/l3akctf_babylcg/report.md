# Report — L3akCTF2026 / BabyLCG (Beginner/crypto)

- **Status:** solved (verified)
- **Flag:** `L3AK{n3v3r_trU5t_b4s1c_LCG5_frfr}`
- **Artifact:** `beginner_baby-lcg.tar.gz` (sha256 d431839...d6e8d) → `chall.py`, `output.txt`

## Signal → approach

`chall.py` implements a textbook LCG `state=(a*state+c)%m` and XORs the 4th output
against the flag. `output.txt` leaks `m, s0, s1, s2, ct`. Classic known-modulus LCG
recovery: cancel `c` via difference of two recurrences, get `a`, then `c`, predict the
key, XOR back.

## Result

`a = (s2-s1)·(s1-s0)^-1 mod m`, `c = s1-a·s0`, `key = a·s2+c`, `flag = ct ⊕ key`.
Recurrence asserts pass; flag is clean ASCII with correct `L3AK{}` framing (33 bytes).

## Verification

Deterministic solver replay + two LCG recurrence assertions + semantic flag check.
No brute force, no external lookup, fully offline. HexStrike not used (not applicable).

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Beginner/BabyLCG/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Beginner/BabyLCG/solve/solve.py`
- Card: `KNOWLEDGE/cards/l3akctf_babylcg.yaml`
- Playbook: `PLAYBOOKS/crypto_lcg_recover.md`
