# librarian (LIT 2026)

## Summary
Ret2Libc challenge. Exploited buffer overflow to leak puts and calculate libc base. Leveraged BSS for RBP pivoting so that subsequent read in main does not corrupt stack. Returned to main, then launched system("/bin/sh").

## Flag
LITCTF{RET-2-LIBC-Is-sUp3R-4w2S0m3!!!}
