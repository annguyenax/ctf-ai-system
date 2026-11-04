# Timeline — ptitctf2026ck_shopbroken_cdn
1. INTAKE: read chalenge.md + extract public.zip → app.py (Flask, AES-CBC session, no MAC).
2. TRIAGE: category=crypto; strongest signal = no-MAC AES-CBC structured session token.
3. HYPOTHESES: H1 CBC bit-flip guest→admin (chosen); H2 padding oracle (killed: no distinct padding error); H3 username field injection (killed: USERS only demo/guest).
4. EXPLOIT: locate "guest" in plaintext block 1 bytes 6..10 → flip C[0] bytes 6..10 with "guest"^"admin".
5. VERIFY: solve.py --selftest replays exact seal/open_session → guest→admin PASS.
6. CAPTURE: writeup, solver, card, playbook, sources_index updated. Real flag pending live instance.
