# Timeline — fortidctf2026_hacker_cinema

- 2026-10-10 — Read workspace rules, live status (16/37 solved), CLAIMS; picked Hacker Cinema (Crypto, 70 public solves, unsolved for us).
- 2026-10-10 — Extracted handout; triage: deterministic HMAC nonce over ticket fields; winner=true impossible via /buy (256-bit preimage); two different date functions feed message vs nonce.
- 2026-10-10 — Scanned day boundaries on PHP 8.4.24 (WSL): no divergence. Docker down; downloaded exact-version PHP 8.4.16 Windows binary.
- 2026-10-10 — PHP 8.4.16 scan: divergence region around year 0; second-by-second scan found kp-day 0000-01-29 spanning two td days; attack pair ts1=-62164800000 / ts2=-62164713600.
- 2026-10-10 — Started remote instance via rCTF integrations API; bought both tickets; identical r confirmed nonce reuse; recovered d; re-signature verification passed.
- 2026-10-10 — Forged winner=true envelope, QR'd, POSTed /check -> JACKPOT ACCEPTED; submitted flag -> platform accepted.
