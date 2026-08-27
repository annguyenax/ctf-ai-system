# Report — L3akCTF2026 / Get The Flag (Beginner/web)

- **Status:** solved (verified against official instance)
- **Flag:** `L3AK{m37h0D_0V3rRide_c5Rf_Bypass_g0_bRRRR}`
- **Artifact:** `get-the-flag.zip` (sha256 1ad2664...dd661)

## Signal → approach

Express app: admin-only `/flag`, puppeteer admin bot visits user-uploaded `/pages/*.html`.
Upload served with CSP `sandbox ...; connect-src 'none'; frame-src 'none'` and httpOnly
cookies ⇒ no XSS-exfil. `methodOverride` runs before `csrfOnPostOnly`, and the CSRF check
only fires when `req.method === "POST"`.

## Exploit

`POST /account/change-password?_method=GET` with `password/confirm` body → method flips to
GET → CSRF skipped → handler resets the current session user's password. Delivered via an
auto-submitting form on the uploaded page; the admin bot executes it, resetting the admin
password. Then log in as admin and read `/flag`.

## Verification

`python solve/exploit.py <instance>` ran end-to-end and read the admin-gated `/flag`,
returning the flag. Strong verification (official server + reproducible chain).

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Beginner/Get The Flag/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Beginner/Get The Flag/solve/exploit.py`
- Card: `KNOWLEDGE/cards/l3akctf_getflag.yaml`
- Playbook: `PLAYBOOKS/web_csrf_method_override_bypass.md`
