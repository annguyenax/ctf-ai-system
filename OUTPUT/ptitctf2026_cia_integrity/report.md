# PTITCTF2026 — CIA - What does 'I' stand for? (crypto)

**Flag (verified):** `PTITCTF{1_574nd5_f0r_1n736r17y_4nd_7c3199444034_h45h1n6_h31p_3n5ur3_7h15_pr0p3rtY}`

## Summary
CIA 'I' = **Integrity**. Outer `chall.zip` password is `sha256(FLAG).hexdigest()`,
so the flag is the unique string whose SHA-256 equals the recovered password.
Inside the zip are 10 mini crypto challenges; only `chall3` (RSA batch-gcd,
2 messages), `chall6` (Håstad e=3), and `chall7` (Rabin) carry reversed flag
fragments. The `flag.txt` inside the nested `flag.zip` is a **decoy** whose hash
violates the integrity check.

## Layers
| Layer | Zip | Password | Source |
|-------|-----|----------|--------|
| 0 | chall.zip | 1fcbf4aa0eb78c74f822684fa93cda458e431365e96b2c04abe5cdd56fca9733 | 4x 280-bit RSA, = sha256(FLAG) |
| 1 | secret.zip | f10fda62a88f71de05fc1250e5d8c8f2 | 1x 280-bit RSA (secret.py) |
| 2 | flag.zip | f4c77352bcf15110fc88035149f7859e | 1x 280-bit RSA (flag.py) |

flag.zip/flag.txt = decoy `PTITCTF{y0Ur_3ff0r7_15_h16hlY_4ppr3c1473D}` (rejected).

## Flag fragments (decode hex, then reverse)
- chall3[0]: `n475_1{FTCTITP` -> `PTITCTF{1_574n`
- chall3[3]: `1r637n1_r0f_5d` -> `d5_f0r_1n736r1`
- chall6   : `6n1h54h_4304449913c7_dn4_y7` -> `7y_4nd_7c3199444034_h45h1n6`
- chall7   : `}Ytr3p0rp_51h7_3ru5n3_p13h_` -> `_h31p_3n5ur3_7h15_pr0p3rtY}`

Assembled flag verifies: `sha256(flag) == 1fcbf4aa0eb78c74f822684fa93cda458e431365e96b2c04abe5cdd56fca9733`.
