# Timeline — Get The Flag

1. INTAKE: unzip source (Express app + puppeteer admin bot + EJS views).
2. TRIAGE: admin-only /flag; bot visits uploaded /pages/*.html; CSP sandbox + httpOnly block XSS-exfil.
3. HYPOTHESES: (a) XSS read /flag [killed by CSP], (b) CSRF account takeover via method-override.
4. TEST/EXPLOIT: POST /account/change-password?_method=GET flips method→GET, skips csrfOnPostOnly, resets pw.
5. VERIFY: user opened live instance; exploit.py reset admin pw via bot, logged in admin, read /flag.
   Flag L3AK{m37h0D_0V3rRide_c5Rf_Bypass_g0_bRRRR}.
6. CAPTURE: writeup + exploit + evidence (SHOW); card + playbook + report (LEARN); scratch cleaned.
