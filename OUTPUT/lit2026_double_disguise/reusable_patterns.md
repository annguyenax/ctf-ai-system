# Reusable pattern: layered encoding + XOR ("double" hints)

Trigger: challenge text hints at multiple layers ("double", "again", "twice")
and the artifact is a Base64 string.

Method:
1. Base64 decode. If the result is printable text, done.
2. If bytes look random, apply known-plaintext: key[i] = raw[i] ^ flagprefix[i].
   - all key bytes equal  -> single-byte XOR (that byte is the key).
   - short repeating cycle -> repeating-key XOR (Vigenere over bytes).
3. Decrypt; verify by re-encrypting back to the exact original string.

Pitfall: treat Base64 as encoding, never as the real cipher.
