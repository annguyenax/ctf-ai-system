# Playbook — AES-CBC bit-flip

## Preconditions

- AES-CBC ciphertext malleable (no MAC over ciphertext, or MAC only on subset).  
- Known structure of plaintext blocks.  
- Goal: flip specific bytes (role, amount, admin flag) without knowing key.

## Core relation

```text
P[i] = Dec(C[i]) XOR C[i-1]     (C[-1] = IV)
```

To set desired `P[i]'` when you know original `P[i]`:

```text
C[i-1]' = C[i-1] XOR P[i] XOR P[i]'
```

**Side effect:** block `P[i-1]` becomes garbage (unless compensated).

## Minimal chain

1. Map plaintext layout (source / padding oracle / decrypt oracle).  
2. Identify target field block index `i`.  
3. Obtain original `P[i]` (honest decrypt or known constants).  
4. Compute flipped previous ciphertext block.  
5. Keep integrity/MAC-covered blocks untouched.  
6. Send modified CT; verify server accepts.

## Classic CTF patterns

| Want | Flip | Accept garbage |
|------|------|----------------|
| admin / premium id | block holding role | previous block (txn id / count) |
| large integer | block holding amount | often OK if only lower bound checked |
| bypass padding | careful — last block | usually don't |

## Success indicators

- Server shows elevated privilege / huge counter / flag print.

## Pitfalls

- HMAC(ciphertext) or encrypt-then-MAC kills bit-flips.  
- Flipping block covering checksum/`CHECK`.  
- Console encoding crashes on emoji — use ASCII-safe logging.

## Time-saving

If source gives `PREMIUM_USER` constant + sample CT, one honest decrypt + one flip is enough.
