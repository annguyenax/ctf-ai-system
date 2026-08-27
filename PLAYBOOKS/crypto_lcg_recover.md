# Playbook: Recover an LCG and predict its output

**Trigger:** A challenge uses `state = (a*state + c) % m` as a "random" keystream/key,
and leaks the modulus `m` plus a few consecutive outputs.

## Preconditions

- Modulus `m` is known (printed, or a well-known constant).
- At least **3 consecutive** outputs `s0, s1, s2` are known.
- A later output is used as a secret (key, XOR pad, seed, etc.).

## Minimal method

Two known recurrences: `s1 = a*s0 + c`, `s2 = a*s1 + c` (mod m). Subtract to cancel `c`:

```
a = (s2 - s1) * inverse(s1 - s0)  mod m
c = (s1 - a*s0)                    mod m
```

Then predict any future output, e.g. the next one:

```
key = (a*s2 + c) mod m
```

Python:

```python
a = ((s2 - s1) * pow(s1 - s0, -1, m)) % m
c = (s1 - a*s0) % m
assert (a*s0 + c) % m == s1 and (a*s1 + c) % m == s2   # verify
key = (a*s2 + c) % m
```

## Verification

- Assert the recovered `a, c` regenerate every observed state.
- Decrypted output should be clean/structured (correct flag framing).

## Pitfalls

- Use the **real** `m` and outputs from the challenge output, not sample values in source.
- Plaintext may be longer than `m`'s byte length — recover `key` then XOR; do not reduce mod m.
- If `gcd(s1-s0, m) != 1`, the inverse fails; general case: use several diffs and take gcd of
  determinants, or solve over the factor structure of `m`.

## Faster path next time

If `m` is unknown but you have many outputs: `m` divides `gcd` of `(t2·t0 - t1²)` style
determinants of consecutive differences `t_i = s_{i+1}-s_i`; recover `m` first, then apply above.

## Solved with this playbook

- L3akCTF2026 / BabyLCG — `cards/l3akctf_babylcg.yaml`
