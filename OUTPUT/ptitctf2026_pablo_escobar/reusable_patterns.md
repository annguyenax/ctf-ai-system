# Reusable pattern - ptitctf2026_pablo_escobar

## Detection signals

- Go PE with `go-webview2` / configurable-webview plus a sidecar `config.enc`.
- Envelope JSON: `"kdf":"pbkdf2-sha256"`, high iteration count, b64 salt/nonce/ciphertext (AES-GCM).
- Password not in strings; `configkey.Key` + two small tables + short xor loop.
- After decrypt: HTTP photo vault, user vs admin, “last location” lore → OSINT on inbox images.

## Decision rule

If WebView loader + encrypted config: recover obfuscated KDF password from the PE, decrypt offline, then hit the URL with **prompt credentials** before more reversing. Flag is often the **last inbox image location**, not another ciphertext.

## Minimal workflow

1. Hash artifacts; parse `config.enc`.
2. Find key function + tables; invert xor/linear mix.
3. PBKDF2-SHA256 + AES-GCM decrypt; confirm JSON URL.
4. Login, dump `/api/images` with timestamps/messages.
5. Identify last `createdAt` image; reverse-image / news match before guessing admin.

## Verification

Replay decrypt script (same plaintext JSON). Flag only after scoreboard or two independent location sources agreeing. Do not write `final_flag.txt` from a guessed toponym.

## Pitfalls / non-applicable cases

- Admin-only “saved” images look like IDOR but may be intentional OSINT gate.
- Stock aerial photos (Pexels) can be exact byte matches and still not the last location.
- Nearby news photos of the same industrial cluster often fail pixel match.
- Cookie name (`anhhop_session`) is not necessarily a username.

## Faster path next time

Skip packing/stego on the PE. Go straight to `configkey` + envelope, then inbox metadata table, then reverse-image the last JPEG.
