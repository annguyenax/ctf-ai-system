# Reusable pattern

## Trigger

AES-CTR uses a nonce derived from attacker-controlled plaintext, and the same key encrypts a secret plus chosen inputs.

## Method

Obtain the secret ciphertext and chosen-plaintext ciphertexts from the same process. Guess the unknown byte(s) needed to reproduce the secret's nonce prefix. When the nonce matches, XOR the chosen ciphertext with its known plaintext to recover the keystream, then XOR that stream with the secret ciphertext.

## Verification

Confirm the candidate satisfies the flag format and, when available, that the event platform reports the challenge solved.

## Pitfalls

- The key must be the same for both ciphertexts; reconnecting may create a new key.
- Ciphertexts from different nonce values do not share a CTR keystream.
- Preserve the live ciphertext exchange if a full exploit replay is needed.
