# Timeline

- Triage: Part 2 bot signs with a random nonce. `forgePrf` is an unchecked scalar multiplication.
- Hint 5 unlocked at cost 0. Body is an AES-ECB ciphertext.
- PARI mined 13 coprime smooth orders, 255 bits total.
- Thirteen reports returned `userHandle` digests. The bot text said authentication failed; the digest was still posted.
- Brute force matched each digest. CRT plus AES-256-ECB under SHA256 of the hex scalar produced the flag.
- Portal accepted the flag.
