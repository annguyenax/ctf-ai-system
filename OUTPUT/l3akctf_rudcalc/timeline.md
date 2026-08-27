# Timeline — Rudimentary Calculator

1. INTAKE: chall.c -> calculator, stack bignum, win() reads flag.txt. checksec: PIE+canary+NX+RELRO.
2. TRIAGE: bignum array overflow past canary; win target. Fermat-like value control infeasible.
3. INSIGHT: scanf("%s") stops at whitespace not NUL -> embed \x00 -> arbitrary stack write.
4. INSIGHT: corrupt int len (buf+0x1000) -> to_base_10 over-reads -> leak canary(limb97,98)+ret(101,102).
5. EXPLOIT: leak -> pie=ret-0x1a9b, win=pie+0x1289; scanf-null write canary+win; quit -> ret to win.
6. VERIFY: live instance -> L3AK{s3Arch_f0r_Sm0otH} on attempt 0 (leak was self-consistent).
7. CAPTURE: exploit + writeup + evidence (SHOW); card + playbook + report (LEARN); scratch cleaned.
