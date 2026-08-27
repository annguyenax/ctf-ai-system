# bushbash_the_eye — solve report

- Event/category: BushBash2026 / OSINT
- Challenge: The Eye
- Status: solved and cryptographically verified
- Artifact SHA-256: `1A972E6AFB92C293C741ECCEA5FE861E8DDA31FFBB28E8A86A34A2BB9A29DA23`
- AES key: `F02E029F23582DC829F034681057B7A8`
- Flag: `bushbash{happy-MAT4RlKI,k1-a-k0E-e-HiW4!}`

The poem identifies the eight children of Matariki/Pleiades. Their red labels in `dots.png`, in poem order, are `F02E`, `029F`, `2358`, `2DC8`, `29F0`, `3468`, `1057`, and `B7A8`. Concatenation produces a 16-byte AES key. AES-ECB decryption and PKCS#7 unpadding of `prayer.enc` yields valid UTF-8 Māori text and the flag.

HexStrike was used only for bounded artifact triage: health, download/file type, ZIP listing, Binwalk, and ExifTool. No full scan was run. The decisive steps were Matariki identification, Pleiades geometric registration, visual label verification, and AES decryption.
