# Reusable patterns

- Addition that uses `a` and `p` but never `b` is an invalid-curve oracle. Keep the supplied point's own `b`.
- If the oracle returns only a hash of `x`, each query gives `d` and `-d` modulo the point order. Use odd order so doubling never inverts zero.
- Cap each modulus near `2^22` so a sequential add-and-hash search finishes in about a minute, and keep the moduli coprime for CRT.
- A WebAuthn PRF salt that the stub base64-decodes with `atob` must keep `=` padding. `@simplewebauthn/browser` 13.3 converts `challenge` and credential ids, and leaves `extensions` as JSON strings.
- `deepMerge({}, JSON.parse(settings))` still writes `Object.prototype.baseURL` through `constructor.prototype` because `in` walks the prototype chain.
