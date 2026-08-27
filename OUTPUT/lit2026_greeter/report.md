# greeter (LIT 2026)

## Summary
Intended format string vulnerability, but bypassed entirely using an unintended buffer overflow vulnerability in `greet2()` via `gets()`. Replaced the return address with the `win` function to read the flag.

## Flag
`LITCTF{y3t-4N0tH3r-gEn3r1C-f0rM4T-sTR1nG}`
