# Playbook — RSA CTF

## Preconditions

- Public modulus `n`, exponent `e`, ciphertext `c` (or variants).

## Minimal chain

1. Collect all params; factor `n` if small.  
2. Check: common primes, Wiener (`e` large), Fermat (close primes), stereotyped messages.  
3. Multi-prime / multi-cipher: Hastad, Franklin-Reiter, related message.  
4. Decrypt with `d` or CRT.  
5. Decode plaintext to flag.

## Success indicators

- Flag-format plaintext.

## Fallbacks

- RsaCtfTool after manual quick checks fail.  
- Partial key recovery.

## Time-saving

Size of `n` dictates attack class in seconds — don't run every attack.
