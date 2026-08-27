# Playbook — Repeating-key XOR

## Preconditions

- Ciphertext = plaintext XOR keystream  
- Keystream = `key[i % len(key)]`  
- Partial known plaintext (flag prefix, headers, English)

## Minimal chain

1. Confirm XOR (script or challenge statement).  
2. Guess key length (prefix length, Kasiski, IC) — CTF often **8** or **flag-prefix len**.  
3. `key[i] = ct[i] XOR known_pt[i]` for one period.  
4. Decrypt full blob.  
5. **Re-encrypt** verify exact match.  
6. Output flag.

## Success indicators

- Printable flag format; re-encrypt == ciphertext.

## Fallbacks

- Crib drag multiple candidate cribs (`flag{`, event name).  
- Brute key length 1..32 with English score.

## Time-saving

Event-branded prefix (`bushbash{`, `jail{`) is the first crib to try.
