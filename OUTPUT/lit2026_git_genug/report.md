# git_genug (LIT 2026)

## Summary
A git repository forensics challenge. The commit history contained a fake flag, but git reflog revealed an unreferenced commit (e5ed944) that was previously 
eset --hard. Viewing that commit showed the real flag in secret.txt.

## Flag
LITCTF{r3fl0g_1s_y0ur_g1t_t1m3_m4ch1n3}
