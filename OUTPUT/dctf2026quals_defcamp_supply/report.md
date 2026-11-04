# defcamp-supply — solve report

## Summary
- **Event:** DefCamp CTF 2026 Quals (Web, 390 pts, Medium)
- **Author:** 0xAMA
- **Flag:** `CTF{00fd1af2af55ba826af4759fc024770d7ae720622e457b570d16224a8f43b5e2}`
- **Status:** verified

## Vulnerability chain
1. **Race condition on `POST /redeem`** — check-then-act on the "daily credits already
   claimed" guard; N concurrent requests each add +2 credits before the first commit,
   reaching the 20-credit premium price.
2. **Command injection in `profile_check.verify_custom_profile`** — the premium item's
   `profile` is interpolated into `python3 verify_profile.py "<profile>"` and run with
   `shell=True`. It runs **at order delivery** (`created_at + eta`, eta ≈ 1800–2200 s).
3. **Exfil via static/ write** — because delivery outlasts the 30-min Flask session,
   the injected command writes the flag into the served `static/` directory; it is then
   read from `/static/pwned.txt` without a session.

## Key facts discovered
- Endpoints: `/`, `/redeem`, `/checkout` (JSON), `/orders/<order_id>` (JSON, session-scoped).
- Premium item `zero_day_debugger` (¢20) is the only item whose `profile` reaches the sink.
- `eta` / `created_at` / `status` are server-computed (mass assignment ignored).
- Session: Flask signed cookie `{_permanent, started_at, user_id}`, 30-min lifetime.

## Artifacts
- Solver: `D:\download\CTFTimeWriteup\DCTF2026Quals\Web\defcamp-supply\solve\solve.py`
- Writeup: `D:\download\CTFTimeWriteup\DCTF2026Quals\Web\defcamp-supply\writeup\writeup.md`
