# Reusable patterns — BabyLCG

- **Known-modulus LCG recovery:** 3 consecutive outputs + m ⇒ `a=(s2-s1)·(s1-s0)^-1`, `c=s1-a·s0`,
  then predict any future output. See `PLAYBOOKS/crypto_lcg_recover.md`.
- **Verify RNG recovery by replay:** always assert recovered params regenerate ALL observed states
  before trusting a predicted secret.
- **Parameters from output, not source:** CTF source often hard-codes sample constants; the live
  values are in the printed output file.
- **XOR-pad longer than modulus:** flag_int may exceed m in bit-length; recover key then XOR — never
  reduce the plaintext mod m.
