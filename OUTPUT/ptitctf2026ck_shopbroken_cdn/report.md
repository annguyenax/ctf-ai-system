# ptitctf2026ck_shopbroken_cdn — report
- PTIT CTF 2026 (Chung kết) / crypto ; exploit VERIFIED offline; real flag NOT captured (server-side `/admin`, no live instance URL in pulled metadata).
- Flag: (server-side; not fabricated)

## Signals
`SESSION_KEY` from env; `AES.new(SESSION_KEY, AES.MODE_CBC, iv)` over
`"brand=ShopBroken;role="+role+";uid=1001;exp=1798675200;u="+user`; cookie = `b64encode(iv+ct)`;
`open_session()` checks only `role in ROLES` and `exp >= now` (no MAC, no `brand` check).

## Exploit
Login `demo:demo` → guest token → base64-decode → `ct = blob[16:]`; XOR `ct[6:11]` with
`"guest"^"admin"` (= 0x06 0x11 0x08 0x1a 0x1a) → resend → `GET /admin` → flag.

## Verification
`solve/solve.py --selftest` replays the exact `seal()`/`open_session()` with a fixed key
and asserts the flipped token decrypts to `{"user":"demo","role":"admin"}`. See raw/selftest.txt.

## Reusable
PLAYBOOKS/crypto_cbc_bitflip.md
