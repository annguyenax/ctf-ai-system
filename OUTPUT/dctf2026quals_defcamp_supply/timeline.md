# Timeline — defcamp-supply

1. **INTAKE** — Read `chalenge.md` + `public.zip` (511,051 B). Source contains
   `profile_check.py` (shell=True command interpolation) and `verify_profile.py`
   (whitelist echo). Flag format `CTF{sha256}`.
2. **Map app** — Baseline GET `/` → Flask shop. Catalog: 6 items, only
   `zero_day_debugger` is premium (¢20). Session cookie `{_permanent, started_at,
   user_id}` with 30-min lifetime.
3. **H1 (command injection)** — Confirmed sink in `profile_check.py`; but checkout
   returned `result: null` for both valid and injected profiles → the sink runs at
   **delivery**, not checkout.
4. **H2 (credits via race)** — `POST /redeem` "daily claimed" is check-then-act;
   15–40 concurrent requests each award +2 credits (race confirmed).
5. **Delivery timing** — Order `eta` is random ~1800–2200 s (~30–37 min) and cannot be
   mass-assigned; the 30-min session expires before delivery. Chose static/-write
   exfiltration to read the flag without the session.
6. **EXPLOIT (queued)** — Placed several premium orders whose injected profile cats
   `/flag*` and writes it to `static/pwned.txt` (plus absolute candidates + `/tmp`).
7. **VERIFY** — Delivery wrote the flag to `/static/pwned.txt`; two independent reads
   agreed on `CTF{00fd1af2af55ba826af4759fc024770d7ae720622e457b570d16224a8f43b5e2}`.
   (Note: the first instance terminated before delivery; a restart + fresh run succeeded.)
