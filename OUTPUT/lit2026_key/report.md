# key (LIT 2026)

## Summary
Standard ret2win buffer overflow challenge with a provided address leak. We overflow a 32-byte buffer, overwrite the saved RIP (at offset 40) with a 
et gadget (for stack alignment), and then the leaked win function address.

## Flag
LITCTF{whY_d1d_7hE_pr1s0ner_ch00s3_th3_w1n_0v3r_7h3_bread?}
