# Timeline - compfest18_compfest_coin

1. INTAKE: Sui Move package + POW blockchain launcher; flag format `COMPFEST18{...}`.
2. TRIAGE: fake reserves, reverse direct market, unbacked LP, integer score.
3. HYPOTHESES: reverse `<USDC,SUIX>` pool drains vault (A); oracle takeover (B, killed); fee manipulation (C, unnecessary).
4. TEST: `verify_path.py` offline; launcher POW + `/launch`.
5. EXPLOIT: six JSON-RPC transactions on instance `71ac88bb-...`; claim 1000; `solved=true`.
6. VERIFY: on-chain fields + `GET /flag` success.
7. CAPTURE: writeup, solver, card, tracker.
