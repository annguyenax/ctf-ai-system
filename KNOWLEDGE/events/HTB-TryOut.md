# HTB-TryOut — Batch 6 digest (26 entries)

Recurring techniques in this slice:
- Web challenges are multi-bug chains: SSRF (hostname-string blocklist or headless-renderer JS) pivoting into SQLi/SSTI/CMDi/JWT-forge for the final flag, several with a WAF/filter that is bypassable with a newline, `${IFS}`, or a differently-filtered second sink.
- Pwn challenges are a graded ladder: plain ret2win -> stack-alignment-sensitive ret2win -> full ret2dlresolve split across two overflows when there's no leak and a short read() cap.
- Misc/rev challenges frequently hide the real bug in something invisible or overlooked: an invisible Unicode identifier inflating an array, a per-character closure table in Rust, or a single-byte PRNG seed.
- Forensics favors building a small protocol/pcap parser by hand over heavy tooling (pure-Python pcap+SMTP+Modbus parsing all appear).

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| blockchain/NotADemocraticElection | blockchain | abi.encodePacked ambiguity on two dynamic strings lets a new voter inherit another's deposited weight, then unlimited vote() replay | solved | htbtryout_notademocraticelection |
| coding/Dynamic Paths | coding | classic grid minimum-path-sum DP answered over 100 socket-delivered test cases | solved | - |
| crypto/Dynastic | crypto | Trithemius cipher (position-incrementing Caesar shift), deterministic inverse | solved | - |
| forensics/An unusual sighting | forensics | bash-history malicious-command timestamp window correlated against SSH session windows to identify the attacker IP; flag comes from a live interactive quiz, not the IP string | solved | htbtryout_an_unusual_sighting |
| forensics/Phreaky | forensics | password-protected outer zip -> pcap SMTP/MIME reassembly -> per-email password unlocks its own file fragment -> sequential concatenation | solved | htbtryout_phreaky |
| hw/Critical Flight | hw | hidden flag text etched into inner/bottom Gerber copper layers (not silkscreen), split and rotated across two layers | solved | htbtryout_critical_flight |
| hw/It's Oops PM | hw | VHDL backdoor MUX leaks the raw key on an exact trigger pattern; sequential-assignment-override semantics matter for the simulation | solved | htbtryout_its_oops_pm |
| ics/Shush Protocol | ics | vendor-specific Modbus function code (>=0x41) carries the plaintext flag amid standard-function noise traffic | solved | htbtryout_shush_protocol |
| misc/Character | misc | one-character-per-query oracle service; keep one TCP session, walk index 0..N | solved | - |
| misc/Chrono Mind | misc | path traversal loads app secret into an LLM's RAG context, prompt injection exfiltrates it, secret unlocks a code-exec endpoint | solved | htbtryout_chrono_mind |
| misc/Hidden Path | misc | invisible U+3164 Unicode identifier silently adds a 7th array element and a hidden request field, becoming an exec() command-injection sink | solved | htbtryout_hidden_path |
| misc/Locked Away | misc | Python exec() substring blacklist bypassed via chr()-built identifier + globals().get() instead of brackets/quotes | solved | htbtryout_locked_away |
| misc/Prison Pipeline | misc | file:// SSRF steals an npm registry token, Host-header vhost pivot reaches the "internal" registry, malicious package exploits an automated update cronjob | solved | htbtryout_prison_pipeline |
| misc/Stop Drop and Roll | misc | fixed-mapping word-game oracle, ~500 rounds scripted to the flag | solved | - |
| pwn/Getting Started | pwn | scanf("%s") stack overflow overwrites a sentinel value to reach win() | solved | - |
| pwn/Labyrinth | pwn | ret2win with a win-function that calls a variadic libc function; needs an extra `ret` gadget to fix 16-byte stack alignment | solved | htbtryout_labyrinth |
| pwn/Void | pwn | no-leak, NX-enabled, read()-only binary solved via two-stage ret2csu + ret2dlresolve split across the read() size cap | solved | htbtryout_void |
| rev/Don't Panic! | rev | Rust flag check split into 31 one-byte closures dispatched via a function-pointer table; no real obfuscation beyond the scattering | solved | htbtryout_dont_panic |
| rev/FlagCasino | rev | srand(single_byte) collapses the keyspace to 256; measure the real glibc ground-truth table instead of reimplementing rand() | solved | htbtryout_flagcasino |
| rev/LootStash | rev | flag stored verbatim as plaintext in .rodata among ~170 decoy item-name strings | solved | - |
| web/Blueprint Heist | web | wkhtmltopdf JS XHR leaks the live .env secret, forges an admin JWT, newline-smuggled SQLi bypasses a dotall-less WAF regex, writes a new EJS SSTI template via INTO OUTFILE | solved | htbtryout_blueprint_heist |
| web/Flag Command | web | undocumented secret command exposed via a client-fetched /api/options JSON, accepted directly by the backend | solved | - |
| web/Guild | web | WAF-filtered Jinja2 SSTI used only to leak admin email via the ORM context object; unsalted sha256(email) reset token; unfiltered EXIF-tag SSTI gives full RCE | solved | htbtryout_guild |
| web/HTB Proxy | web | wildcard-DNS bypasses a hostname-string SSRF blocklist; a naive \r\n\r\n-split HTTP parser smuggles a second request past validation into a ${IFS} command injection | solved | htbtryout_htb_proxy |
| web/Labyrinth Linguist | web | app's naming/pom.xml suggested FreeMarker but the real engine is Velocity 1.7; live arithmetic probe confirms, then .class.forName Runtime.exec RCE | solved | htbtryout_labyrinth_linguist |
| web/TimeKORP | web | quote-breakout OS command injection into PHP exec(); exec() returns only the last output line, so payload ordering matters | solved | htbtryout_timekorp |
