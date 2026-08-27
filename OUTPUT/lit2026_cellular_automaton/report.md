# cellular_automaton (LIT 2026)

## Summary
The binary reads 26 bytes of input, converts them into 208 bits, and applies a Rule 90-like cellular automaton for 32 iterations over a ring of 208 elements.
Specifically, 
ew_array[i] = array[(i-1)%208] ^ array[(i+1)%208].
After 32 steps, it compares the output bits with the hardcoded flag bytes given in the description.
Since the transformation is linear over GF(2) (it can be represented as M * x = b), we can construct the transformation matrix M and solve for x.
The matrix M has a nullity of 16. By searching the ^{16}$ null space solutions and matching them against the known flag prefix LITCTF{, we uniquely identify the flag.

## Flag
LITCTF{g0ing_b4ck_1n_t1m3}
