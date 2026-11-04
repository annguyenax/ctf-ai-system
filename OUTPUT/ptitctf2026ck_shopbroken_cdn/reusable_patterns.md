# Reusable pattern
AES-CBC session token with no MAC: get a valid (guest) token, base64-decode to iv||ct,
locate the target fixed-length field in the plaintext block layout, and flip the PREVIOUS
ciphertext block (or the IV if the field is in block 0) by XORing with old^new. The flipped
block's own plaintext becomes garbage but is ignored if the server doesn't validate it.
Verify by replaying the exact seal/open logic offline with a fixed key.
