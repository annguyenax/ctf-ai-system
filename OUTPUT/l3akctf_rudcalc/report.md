# Report — L3akCTF2026 / Rudimentary Calculator (pwn)

- **Status:** solved (verified vs official instance)
- **Flag:** `L3AK{s3Arch_f0r_Sm0otH}`
- **Artifact:** `pwn_rudimentary-calculator.tar.gz` (sha256 00c9719...4ba8)
- **Protections:** PIE + canary + NX + Full RELRO

## Approach

`run()` has a stack bignum (`product_bignum[0x60]`), an int `len` at buf+0x1000, canary at
limb 97-98, return at limb 101-102. Two primitives:
- **len corruption -> leak:** set len=103 so `to_base_10` prints stale stack (canary + return
  addr) as a huge decimal. pie=ret-0x1a9b, win=pie+0x1289.
- **scanf("%s") null write:** embed `\x00` after "1" so the parser stops but scanf keeps
  writing our exact bytes over canary(leaked)+return(win).
Then "quit" -> canary passes -> ret to win() -> flag. All in one connection; reconnect if
canary/win contain whitespace (~75% per try). Hit on attempt 0.

## Verification

`python solve/exploit.py` -> `L3AK{s3Arch_f0r_Sm0otH}` from win() on the official server.
Leak self-consistent (canary LSB 0x00, ret&0xfff==0xa9b, pie page-aligned).

## Notes

Developed and executed directly against the live instance (no local run/Kali needed);
pure python ssl + struct.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/pwn/Rudimentary Calculator/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/pwn/Rudimentary Calculator/solve/exploit.py`
- Card: `KNOWLEDGE/cards/l3akctf_rudcalc.yaml`
- Playbook: `PLAYBOOKS/pwn_scanf_null_and_len_leak.md`
