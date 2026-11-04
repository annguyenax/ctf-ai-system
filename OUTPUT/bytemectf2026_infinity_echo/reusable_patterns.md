# Reusable observations

- Before trusting earlier CTF results, compare the current `_detail.json` attachment names and hashes with the files used by the solver. Versioned attachment updates can supersede a prior inconsistency.
- Equal r and same-nonce algebra do not complete ECDSA verification. Check z against the declared message hash, check r=x(kG) mod n, and verify both signatures under Q=dG.
- A patterned scalar is a signal, not proof. Preserve valid partial evidence and stop unguided KDF guesses when the cipher/layout is unspecified.
