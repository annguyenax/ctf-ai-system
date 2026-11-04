# FortIDCTF2026 — Batch 6 digest (14 entries)

Recurring techniques in this slice:
- Web chains lean on multi-bug pivots: prototype-pollution blocklists that miss `constructor.prototype`, CSP nonces drawn from a small enumerable set, and ORDER BY-confined SQLi oracles against a visible anchor row.
- Pwn challenges favor logic/tooling abuse over classic memory corruption: a debugger's own `/s` mixed-source flag turned into a file-read primitive, a UAF via an uncleared stale global alias, and (unsolved) a charset-restricted shellcode vs. NLP grammar-gate fight.
- Several 500-pt challenges remain genuinely unsolved after deep analysis (paused): QR one-time-pad key recovery from ambiguous human-typing video/audio signal, tea-stained QR Reed-Solomon reconstruction, and multi-hop OSINT chains blocked on one missing public link.
- Crypto favors fixed-point/invariant abuse (a repeated-byte 3DES key is permutation-invariant) over raw cryptanalysis.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Crypto/DESBox | crypto | repeated-byte key is permutation-invariant, bypassing equality/multiset/complement key-pair validators to turn encrypt into a decrypt oracle | solved | fortidctf2026_desbox |
| Intro/Baby Pwn | pwn | UAF via stale global alias not cleared on free(), same-size realloc overwrites a function pointer | solved | fortidctf2026_baby_pwn |
| Pwn/Editorial Board | pwn | ASCII-letter-only shellcode must also pass a real LanguageTool grammar/spelling gate; mechanics confirmed locally, no payload passes both | paused | fortidctf2026_editorial_board |
| Pwn/GDB SaaS | pwn | crafted DWARF source-file path ("/s main") makes GDB's disassemble /s print an arbitrary co-located file | solved | fortidctf2026_gdb_saas |
| Reverse/Paint me a Flag | rev | vendor-supplied PMAF decoder (DLL) reconstructs 13 image fragments whose text concatenates to the flag | solved | - |
| Web/Do You Know Lika | web | constructor.prototype pollution bypasses __proto__-only filter, enabling Handlebars @partial-block AST-injection RCE (CVE-2026-33938 class) | solved | fortidctf2026_do_you_know_lika |
| Web/Doctor Bye Bye | web | ORDER BY CASE WHEN scalar-subquery oracle reads a WHERE-hidden row via a visible anchor row's sort position | solved | fortidctf2026_doctor_bye_bye |
| Web/King Admin | web | stored XSS with finite/enumerable CSP nonces, chained through CSRF-unprotected announcement write to steal an OID4VCI admin credential offer | solved | fortidctf2026_king_admin |
| Crypto/Human RNG | crypto | QR one-time-pad key = last 1681 bits of a human-typing video/audio-derived bitstream; every tested video/audio feature scores at chance on an honest holdout | paused | fortidctf2026_human_rng |
| Misc/Spill the Tea | misc | tea-stained QR photo needs projective geometry fit + RS-erasure decode + correct byte re-interleaving; 4/4 RS decodes still fail QR segment validity | paused | fortidctf2026_spill_the_tea |
| OSINT/Breaking News | osint | newspaper -> social post -> paste -> git repo whose 480 commit DATES (not content) render as a calendar pixel-art passphrase; decryption target not yet located | paused | fortidctf2026_breaking_news |
| OSINT/OSINT Exam II | osint | live multi-stage quiz solved via official public records (race results, conference agenda, school report+video); blocked on locating an internal scoreboard for Q4 | paused | fortidctf2026_osint_exam_ii |
| Pwn/String Peek and Poke | pwn | unbounded std::string array index gives an address-free heap arena-write primitive plus a stdout flush-dump memory leak; stage-2 RCE unexecuted | paused | fortidctf2026_string_peek_and_poke |
| Reverse/Crypto Wallet | rev | APK's geofence/what3words vicinity check is an unconditional stub; real 12-word BIP-39 seed for a fixed Ethereum address not found despite large-scale brute force | paused | fortidctf2026_crypto_wallet |
