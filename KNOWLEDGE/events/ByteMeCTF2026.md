# ByteMeCTF2026 — Batch 7 digest

Covers 12 challenges from this batch (not necessarily the event's full challenge set). Theme: Marvel "Soul Stone"/Thanos lore across Crypto/Forensics/OSINT/Steganography.

Recurring techniques in this batch:
- RSA given as pairs of keys/ciphertexts: always check gcd(n1,n2) (shared prime) or common-modulus Bezout attacks before anything factoring-heavy.
- Reused-keystream / two-time-pad XOR challenges rely on manual crib-dragging with thematic plaintext guesses.
- Steganography is consistently sequential-LSB-of-RGB-channels; several add a second encoding layer (base64, or base64+XOR-with-lore-word) on top.
- Forensics "trivial" challenges in this set are mostly direct hex-decode or plain-text grep of a provided dump/log — no real obfuscation.
- OSINT challenges here are single-URL "trailhead" sites requiring crawling internal links for each flag component.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Cryptography/Double Trouble | Cryptography | shared-prime RSA (gcd(n1,n2)) then base64+XOR final layer | solved | bytemectf2026_double_trouble |
| Cryptography/Soul Forge | Cryptography | reused-keystream XOR + crib-drag | solved | bytemectf2026_soul_forge |
| Cryptography/Vormir Common Modulus | Cryptography | common-modulus RSA attack (Bezout) | solved | bytemectf2026_vormir_common_modulus |
| Forensics/Broken Soul Vault | Forensics | trivial hex-decode of one line among decoys | solved | - |
| Forensics/Echoes of the Snap | Forensics | trivial hex-decode of DNS-TXT-styled text | solved | - |
| Forensics/Soul Memory | Forensics | trivial grep flag in plaintext memory dump | solved | - |
| OSINT/Stalker 0 | OSINT | image-based person identification (no documented method) | needs_verification | - |
| OSINT/The Vormir Ledger | OSINT | multi-page site crawl, each page yields one flag component (clue text + Caesar cipher) | solved | bytemectf2026_vormir_ledger |
| Steganography/Hidden Soul | Steganography | trivial sequential RGB-LSB extraction | solved | - |
| Steganography/Soul in the Shadows | Steganography | LSB extraction + base64 layer + lore-word XOR key | solved | bytemectf2026_soul_in_the_shadows |
| Steganography/Soul World | Steganography | trivial sequential RGB-LSB extraction | solved | - |
| Steganography/The Last Soul | Steganography | LSB extraction + base64 layer | solved | bytemectf2026_the_last_soul |
