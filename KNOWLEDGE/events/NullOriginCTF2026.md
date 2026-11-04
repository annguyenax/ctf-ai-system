# Null Origin CTF 2026 — batch 8 digest (55 entries)

Only 3 entries (Web/CTFCeption, Web/The Forbidden Six, Web/Welcome) in this batch carry a real writeup; the remaining 52 are paused entries whose only recorded content is a templated auto-triage note with generic per-category hypotheses and no actual investigation signal (no file downloaded/analyzed, or analysis not started). This is a partial slice of the event, not its full set.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Web/CTFCeption | Web | multi-stage decode chain (HTML comment -> telemetry JSON -> AES-zip passphrase -> XOR-keyed telegraph beacon -> client JS crypto reconstruct); no single generalizable technique beyond "follow the breadcrumb chain" | solved | - |
| Web/The Forbidden Six | Web | client-side JS blocks a winning move but the backend `/api/move` endpoint enforces no such check; send the winning move directly to the API | solved | - |
| Web/Welcome | Web | trivial — flag given verbatim in the challenge description | solved | - |
| B2R/Blackdamp - Root | B2R | no source — only a templated fingerprint note (boot2root chain, generic nmap/privesc hypotheses), no investigation performed | paused | - |
| B2R/Blackdamp - User | B2R | no source — only a templated fingerprint note, no investigation performed | paused | - |
| B2R/deadlight - Root | B2R | no source — only a templated fingerprint note, no investigation performed | paused | - |
| B2R/deadlight - User | B2R | no source — only a templated fingerprint note, no investigation performed | paused | - |
| B2R/Smoke - Root | B2R | no source — only a templated fingerprint note, no investigation performed | paused | - |
| B2R/Smoke - User | B2R | no source — only a templated fingerprint note, no investigation performed | paused | - |
| B2R/StillWater - Root | B2R | no source — only a templated fingerprint note, no investigation performed | paused | - |
| B2R/StillWater - User | B2R | no source — only a templated fingerprint note, no investigation performed | paused | - |
| Crypto/Bindery | Crypto | no source — only a templated fingerprint note (generic classical-crypto/RSA hypotheses), no attachment or analysis | paused | - |
| Crypto/Carillon | Crypto | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Crypto/Cartouche | Crypto | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Crypto/Catalogue | Crypto | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Crypto/Daybook | Crypto | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Crypto/Errata | Crypto | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Crypto/Lantern | Crypto | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Crypto/Lastpage | Crypto | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Forensics/Carrier | Forensics | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Forensics/GreyList | Forensics | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Forensics/Handoff | Forensics | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Forensics/NightShift | Forensics | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Forensics/NullWatch | Forensics | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Forensics/Revenant | Forensics | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Forensics/Slackwater | Forensics | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Misc/The Phantom Protocol | Misc | no source — only a templated fingerprint note (OSINT/crypto-scam-tracing hypothesis), no attachment or analysis | paused | - |
| OSINT/Nostalgia on the Menu | OSINT | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| OSINT/Sanity - 3 | OSINT | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| OSINT/Sanity -2 | OSINT | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| OSINT/The Forgotten Alias | OSINT | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| OSINT/THE FORGOTTEN FRAMES | OSINT | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| OSINT/The Origin | OSINT | no source — only a templated fingerprint note, no attachment or analysis | paused | - |
| Pwn/Shadow Gate | Pwn | no source — only a templated fingerprint note (buffer-overflow/ROP hypothesis), no attachment analysis performed | paused | - |
| Reverse/Cinder | Reverse | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Reverse/Deadman | Reverse | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Reverse/Dovetail | Reverse | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Reverse/Hourglass | Reverse | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Reverse/Ouroboros | Reverse | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Reverse/Palimpsest | Reverse | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Reverse/Quicklime | Reverse | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/driftwood | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/moire | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/Mordant | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/Pentimento | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/quietus | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/SafeLight | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/UnderTone | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Stego/Winnow | Stego | no source — only a templated fingerprint note, no attachment analysis performed | paused | - |
| Web/BlackBox Graph | Web | no source — only a templated fingerprint note (auth-bypass/introspection hypothesis), no investigation performed | paused | - |
| Web/Broken Crown | Web | no source — only a templated fingerprint note (token issuance/verification hypothesis), no investigation performed | paused | - |
| Web/Dead Letter Office | Web | no source — only a templated fingerprint note, no investigation performed | paused | - |
| Web/Ghost Protocol | Web | no source — only a templated fingerprint note (black-box edge gateway hypothesis), no investigation performed | paused | - |
| Web/Maharaga's SPECIAL | Web | no source — only a templated fingerprint note, no investigation performed | paused | - |
| Web/TrustChain | Web | no source — only a templated fingerprint note, no investigation performed | paused | - |
