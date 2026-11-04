# SKILL — CRYPTO

## Triage signals

| Signal | Likely |
|--------|--------|
| n, e, c | RSA |
| short IV / ECB | block mode issues |
| oracle (pad/error/time) | adaptive attack |
| LFSR / “random” stream | PRNG recover |
| classic cipher words | classical crypto |
| hash + offline note | crack hash offline |
| `^ key[i%len]` / short key missing | repeating-key XOR |
| AES-CBC + structured fields + no MAC | CBC bit-flip |
| poly evals mod large p, coeffs = hash/key ≪ p, fewer points than deg+1 | small-coeff LLL (`PLAYBOOKS/crypto_small_coeff_poly_lll.md`; **flint not sympy**) |

## Fast path checklist

1. Identify **primitive + mode + oracle type**.  
2. Parameter sizes (key length, e, nonce reuse).  
3. Check classic footguns (small e, common primes, pad oracle, ECB).  
4. Use known attack scripts (RsaCtfTool, padding oracle, etc.) **targeted**.  
5. No network scanners.

## Discriminative tests

- RSA: gcd attacks / wiener / fermat if params smell.  
- AES: identical blocks → ECB; nonce reuse → stream XOR.  
- Hash: identify type (`hashid`) then **offline** wordlist/mask.
- XOR: crib event flag prefix (`bushbash{`, `flag{`) → recover one key period → re-encrypt verify.
- CBC: map blocks from source; flip `C[i-1]` to set `P[i]`; leave integrity blocks alone.

## Tool whitelist

`sage`/`python`, `pwntools`, `RsaCtfTool`, `hashcat`/`john` (offline), `openssl`.

## Avoid early

nmap/nuclei/ffuf on pure crypto tasks; huge hashcat masks without length constraint.

## Deliverables

- Attack name + why applicable  
- Recovered key/plaintext/flag  
- Minimal script  
