# Playbook — AES-CBC bit-flip on unauthenticated structured plaintext

## When to use

Source shows AES-CBC encrypting a structured plaintext and the result is stored in
a client-controllable place (cookie, form field, file) with **no MAC/HMAC**, and the
server trusts decrypted fields for authorization. Also when "AES-CBC + structured
fields + no MAC" appears (see `SKILLS/CRYPTO.md`).

## Trigger signals

- `AES.new(key, AES.MODE_CBC, iv)` + `pad(...)` + `b64encode(iv + ct)`.
- Decrypt path calls `unpad(...)` and then trusts fields (e.g. `role`, `is_admin`).
- The value you want to flip is a fixed-length string you know (or can control length).
- A valid sample ciphertext/IV is obtainable (e.g. a normal user login).

## Core property

```
CBC decrypt:  P[0] = D(C[0]) XOR IV
              P[i] = D(C[i]) XOR C[i-1]   for i >= 1
```

Flipping bit `j` of `C[i-1]` flips the *same* bit `j` of `P[i]` (predictable), but
scrambles the *entire* block `P[i-1]` (unpredictable). So:

- Target a field in plaintext block `i` (i >= 1) → flip in ciphertext block `i-1`.
- Target a field in plaintext block `0` → flip in the **IV**.

## Procedure

1. Get a valid ciphertext: `blob = b64decode(token)`, `iv = blob[:16]`, `ct = blob[16:]`.
2. Lay out the plaintext into 16-byte blocks (from the source's builder function).
3. Locate the target string's block index and byte offset.
4. `mask = old_bytes XOR new_bytes` (old and new must be same length).
5. If target in block `i >= 1`: `ct[(i-1)*16 + off + j] ^= mask[j]`.
   If target in block `0`: `iv[off + j] ^= mask[j]`.
6. Re-encode and submit.

## Pitfalls

- Off-by-one block: "guest" in *plaintext* block 1 → flip *ciphertext* block 0 (`ct[0:16]`),
  **not** the IV. (The IV only controls plaintext block 0.)
- Flipping scrambles the previous plaintext block — make sure the server does NOT
  validate that block (e.g. a `brand=`/`version=` field it ignores, or padding not in that block).
- Padding must still be valid: if you flip a block that contains the final PKCS#7 pad,
  you must also fix the pad (or avoid it entirely).
- Fields parsed by `split(";")`/`split("=")` with last-write-wins: a scrambled previous
  block can sometimes inject garbage segments; ensure it doesn't clobber your target field.

## Verification

Replay the exact seal/open logic offline with a fixed key and assert the flipped token
decrypts to the desired field value (e.g. `role == "admin"`).

## Related

- `cards/bushbash_strawberries.yaml` — flip `C[0]` to set `PREMIUM_USER`.
- `cards/ptitctf2026ck_shopbroken_cdn.yaml` — flip `C[0]` bytes 6..10 `guest -> admin`.
