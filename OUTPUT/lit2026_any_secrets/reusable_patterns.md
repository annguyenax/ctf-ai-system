# Reusable pattern: Caesar over full ASCII byte range

Trigger: classical "shift" hint (Caesar, Brutus, ROT) AND ciphertext contains
digits/symbols, not just A-Z.

Method:
1. Take known flag prefix (e.g. LITCTF{).
2. Compute delta = ord(cipher[i]) - ord(plain[i]); confirm it is constant.
3. Or brute s in range(256): decode chr((ord(c)+s)%256); filter by flag format.

Pitfall: using mod 26 / A-Z only destroys symbols. Use mod 256 over bytes.
Verify by re-encrypting the recovered flag back to the exact ciphertext.
