# CSAW CTF Qualifications 2026

Recurring techniques across this batch:
- Multi-stage/chained puzzles are common (web "escape room" key-chains, multi-layer malware unpacking) and should be solved with one end-to-end chained solver script, not piecemeal.
- Several challenges plant decoy/honeypot flags mid-chain, including text explicitly addressed to AI analysis agents — never trust a flag-shaped string until it is the final stage's output.
- Crypto challenges lean on structural weaknesses (linear PRNGs over GF(2), low-density knapsacks) solvable via linear algebra / lattice reduction rather than brute force.
- Several "paused" challenges are blocked on a live-instance/Discord/manual step rather than a missing technique; their analysis is still recorded for reuse.
- Web auth bugs frequently hinge on asymmetric trust across multiple similar components (two IdPs, two services) where only one is properly hardened.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Crypto/Finders Keepers! | Crypto | container metadata (XMP) stego + Vigenere cipher | solved | csawctf2026quals_finders_keepers |
| Crypto/Polly | Crypto | xorshift GF(2) linear-algebra seed recovery + ChaCha20 nonce collision | solved | csawctf2026quals_polly |
| Crypto/Secret Treaties | Crypto | low-density knapsack via LLL lattice reduction | solved | csawctf2026quals_secret_treaties |
| Crypto/Testing out the Temple | Crypto | multi-stage web cipher chain (autokey + sha256-stream + AES-GCM) | needs_verification | csawctf2026quals_testing_out_the_temple |
| Forensics/Ghost in the Machine | Forensics | pcap TTL-filtered covert timing channel + XOR key | solved | csawctf2026quals_ghost_in_the_machine |
| Forensics/Hemispheres | Forensics | PNG/ZIP polyglot + row-0 LSB password | solved | csawctf2026quals_hemispheres |
| Forensics/schrodingers-backup | Forensics | no source (chalenge.md + flag only; no writeup/solver found) | needs_verification | - |
| Misc/House of Hollow Houses | Misc | trivial (robots.txt hint -> direct GET /sanctum) | solved | - |
| Misc/Keep Walking Forward | Misc | multi-stage malware RE chain (DLL sideload, donut, ConfuserEx bypass, PowerShell decode), multiple honeypot flags | solved | csawctf2026quals_keep_walking_forward |
| OSINT/Recon - Two Marks, One Score | OSINT | landmark ID defeating cropped reverse-image search + film/plane-registry correlation | solved | csawctf2026quals_recon_two_marks_one_score |
| OSINT/Roll Call | OSINT | DB reconciliation via canonical person_id join | solved | csawctf2026quals_roll_call |
| Pwn/Saint Vespers and the Copper Choir | Pwn | no real solve content (writeup/notes empty, only inspection script) | needs_verification | - |
| Reverse/Autobahn | Reverse | self-modifying code XOR decrypt, static offline decryption | solved | csawctf2026quals_autobahn |
| Reverse/Machine Head | Reverse | custom VM bytecode -> Z3 symbolic execution | solved | csawctf2026quals_machine_head |
| Web/CSALE Revenge | Web | UNION SQLi dump + XOR vault key assembly + draft preview leak | needs_verification | csawctf2026quals_csale_revenge |
| Web/Flag Checker | Web | attacker-amplified timing oracle via User-Agent-controlled multiplier | solved | csawctf2026quals_flag_checker |
| Web/Golf Heist | Web | no source (only chalenge.md + flag; no writeup/solver found) | needs_verification | - |
| Web/Juggler | Web | PHP type juggling / JSON boolean mass-assignment bypass | needs_verification | csawctf2026quals_juggler |
| Web/TrustDinOIDC | Web | asymmetric JWT x5c cert-pinning bypass across two IdPs | solved | csawctf2026quals_trustdinoidc |
| Forensics/Breach Zero Day | Forensics | IOC correlation across pcap/eventlog/memdump; exact flag-string format unresolved | paused | csawctf2026quals_breach_zero_day |
| Misc/The Vantage Job | Misc | multi-layer luma-value PDF image stego; blocked on live Discord bot step | paused | csawctf2026quals_the_vantage_job |
| Pwn/Diamond Dogs | Pwn | dual-array dangling-pointer UAF hypothesis; untested against live instance | paused | csawctf2026quals_diamond_dogs |
| Pwn/Hells Bells | Pwn | no real analysis content beyond category hypotheses; solver is a stub | paused | - |
| Web/CSALE | Web | blackbox IDOR hunt on seller-lock unlock endpoint; direct target-id IDOR ruled out | paused | csawctf2026quals_csale |
| Web/Low_tide | Web | User-Agent trust-gate bypass + XFF-based sid derivation recon; derivation not yet pinned down | paused | csawctf2026quals_low_tide |
