# Reusable patterns — Get The Flag

- **method-override breaks verb-gated security:** if `methodOverride` runs before a check
  that only enforces on one verb (`if req.method !== "POST"`), flip the verb with `?_method=`
  to skip CSRF/auth while the body still triggers the action. See
  `PLAYBOOKS/web_csrf_method_override_bypass.md`.
- **CSP sandbox ≠ safe logic:** `connect-src/frame-src 'none'` + httpOnly blocks XSS-exfil, but
  same-origin `allow-forms` still enables state-changing CSRF ⇒ pivot from "read the secret" to
  "take over the account".
- **Admin-bot web challenges:** enumerate what the bot can be made to DO (POST/navigate), not
  just what it can leak, when read-exfil is blocked.
- **Source-review first:** middleware ORDER (registration order) is where these bugs live; read
  `app.use(...)` sequence carefully.
