# Pattern — repeating XOR + flag prefix crib

1. Detect `pt[i] ^ key[i % k]`.  
2. Crib event flag prefix.  
3. Recover one key period.  
4. Decrypt + re-encrypt verify.  
