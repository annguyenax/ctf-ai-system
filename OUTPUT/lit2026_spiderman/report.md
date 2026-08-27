# spiderman (LIT 2026)

## Summary
A simple function pointer overwrite challenge. gets() was used to read into a stack buffer, allowing a buffer overflow to overwrite a function pointer located further down the stack with the address of a win function.

## Flag
LITCTF{p01nt3r-Po1ntEr-wh3re-4rE-y0U}
