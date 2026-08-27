# secrets (LIT 2026)

## Summary
Format string vulnerability. The flag is loaded directly onto the stack, and user input is passed directly to printf(). Exploited by using %14 %15... to leak the stack contents and decoding the hex values to ASCII.

## Flag
LITCTF{PRINTF-vULN3r4b1LitY-ZftvINYopu}
