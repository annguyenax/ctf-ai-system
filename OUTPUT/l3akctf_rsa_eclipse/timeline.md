# Timeline — RSA Eclipse

1. INTAKE: chall.py -> RSA, primes 607-bit & 521-bit, e=65537; output.txt has N,e,c.
2. TRIAGE: unbalanced primes (Fermat out). Viewed N in hex -> long 0xFF runs -> near powers of two.
3. HYPOTHESIS: p=2^607-a, q=2^521-b. a*b = N mod 2^521 = 4895451; b=(2^1128-N)>>607=1749; a=2799.
4. VERIFY: p*q == N exact.
5. EXPLOIT: standard RSA decrypt -> flag.
6. CAPTURE: writeup + solver + evidence (SHOW); card + playbook + report (LEARN); scratch cleaned.
