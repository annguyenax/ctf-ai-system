# Pattern — CBC bit-flip privilege + amount

When ciphertext is CBC without MAC on all blocks:

1. Map fields to block indices.  
2. Leave checksum blocks alone.  
3. Flip previous CT block to set target field.  
4. Accept garbage in previous plaintext field (use if helpful, e.g. large n).  
