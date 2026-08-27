# Timeline — Immiscible

1. INTAKE: chal.py -> OV central map over F_79, M=9 quadratics, N=8 vars (V=O=4); AES key = sha256(secret).
2. TRIAGE: quad terms = vinegar*vinegar + vinegar*oil, NO oil*oil -> classic OV structure.
3. TEST: z3 modular solve -> timeout; sympy groebner GF(79) -> timeout.
4. EXPLOIT: fix vinegar -> linear in oil; brute vinegar 79^4 vectorized (numpy batched modular Gauss),
   solve 4 eqns, verify 5. Found sig=[23,7,73,60,34,54,53,7] at v0=23.
5. VERIFY: eval_public(sig)==target; AES -> L3AK{Oil_4ND_v1N3g4r_WitH0ut_Mix1nG_Sp1LL5_eV3rYth1ng}.
6. CAPTURE: numpy solver + writeup + evidence (SHOW); card + playbook + report (LEARN); scratch cleaned.
