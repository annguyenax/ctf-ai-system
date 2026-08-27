# Playbook: Invert an Oil-and-Vinegar (OV) multivariate quadratic map

**Trigger:** A multivariate quadratic system over a small field where the quadratic
terms couple only some variables. Specifically the monomials are `vinegar*vinegar`
and `vinegar*oil` but **never `oil*oil`**. Prompt hints: "mix", "immiscible", oil/vinegar.

## Idea

Split variables into vinegar `v` (V of them) and oil `o` (O of them). Because oil
never multiplies oil, **fixing v makes every equation linear in o**:

```
target_k = C_k(v) + sum_o D_{k,o}(v) * o_o
  C_k(v)     = const_k + sum_{i<V} lin_k[i] v_i + sum_{i<=j<V} q_k[i,j] v_i v_j
  D_{k,o}(v) = lin_k[V+o] + sum_{i<V} q_k[i, V+o] v_i
```

With M equations and N=V+O unknowns:
- If M == O per fixed v you'd solve directly, but usually M > O so the O-var system is
  **overdetermined**. For a random v it is inconsistent; only the true v is consistent.
- **Brute the vinegar space** (|F|^V). For each v solve O of the equations for oil and
  verify the rest. M > N => the consistent point is unique = the secret preimage.

## Minimal method (numpy, batched modular Gauss over F_p)

```python
inv = [0]+[pow(a,p-2,p) for a in range(1,p)]     # modular inverse table
# for a batch of vinegar rows: build C (K,M), D (K,M,O), r=(target-C)%p
# batch_solve D[:, :O] * oil = r[:, :O] via Gauss-Jordan; verify D[:, O:] oil == r[:, O:]
```

Then use the recovered full vector however the challenge does (here: AES key = sha256(bytes(sig))).

## Verification

Check `eval_public(sig) == target` for ALL equations (not just the solved subset), then
the downstream decryption should produce clean plaintext.

## Pitfalls

- z3 / sympy-groebner can TIME OUT on modular quadratic systems — prefer the OV linear trick.
- If you need the EXACT preimage (hash-derived key), ensure uniqueness (M>N) or enumerate all.
- A specific vinegar's leading OxO minor may be singular; test consistency across all M rows.
- With sage available, `solve_mod` or a Groebner basis over GF(p) solves it instantly.

## Solved with this playbook

- L3akCTF2026 / Immiscible — `cards/l3akctf_immiscible.yaml`
