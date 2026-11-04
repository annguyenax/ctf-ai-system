# Reusable pattern

When a puzzle gives a PRNG recurrence plus a word-level mask/rotation/byte-order transform, verify every observed word against the generated sequence before using it as key material. Keep seal checks separate from encryption keys. For layered ciphertexts with multiple decoy records, do not infer a cipher/KDF from random-looking bytes alone; stop broad mode/key enumeration when no authenticated or known-plaintext signal remains, and seek the generator specification.
