# DeadfaceCTF2026 — Batch 3 digest

This batch covers 57 challenges across BrainScans (simulated medical-device pentest),
Crypto, Database (Aurora Health/forensic SQL), DeMonneBreach (network/memory forensics),
DeMonneSlayer (Android app + API), Forensics, Mobile, OSINT, Pwn, Reverse, Steganography,
TrafficAnalysis and Web.

Recurring techniques in this batch:
- Integrity/redaction checks that are only enforced in one UI/layer are forgeable or
  bypassable once you can reach the backing data or recompute the check yourself
  (Bad Calibration, Second Opinion).
- Raw-protocol/forensic access wrapped in an unusual transport (WebSocket SQL shell,
  compressed multi-GB memory image, BLE sniffer API) requires a small custom client
  before any "normal" analysis can start.
- Covert-channel exfiltration (DNS subdomains, ICMP payloads, custom HTTP headers) is
  almost always: isolate the anomalous traffic, find an explicit per-chunk order cue,
  concatenate, then decode/decrypt — in that order.
- Mobile/Android app secrets and internal API tokens recovered via reverse engineering
  routinely unlock further IDOR/BOLA and auth-bypass web challenges later in the series.
- OSINT pivots chain tightly: one challenge's recovered username/alias is the next
  challenge's required input (GitHub `.keys` endpoint, certificate Subject fields,
  repo config directories).

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| BrainScans/Bad Calibration | BrainScans | Signature-over-known-salt integrity forgery: edit data, recompute hash from readable salt | solved | deadfacectf2026_bad_calibration |
| BrainScans/Bedside Manner | BrainScans | trivial (view page source for a dev string) | solved | - |
| BrainScans/Factory Settings | BrainScans | Default vendor creds documented in a field-service-manual PDF | solved | - |
| BrainScans/Live Boot | BrainScans | Hardcoded API key found in plaintext config.yaml after shell access | solved | - |
| BrainScans/Second Opinion | BrainScans | Hidden debug/maintenance display channel bypasses UI-layer redaction | solved | deadfacectf2026_second_opinion |
| BrainScans/Signals from the Skull | BrainScans | BLE fragment reassembly by handle+seq, then base64 decode | solved | deadfacectf2026_signals_from_the_skull |
| Crypto/DECODE-DLE | Crypto | Mastermind-style constraint-logic puzzle, no crypto | solved | - |
| Crypto/Hail Caesar | Crypto | trivial ROT13 | solved | - |
| Crypto/Infrequent Emojis | Crypto | Emoji monoalphabetic substitution cipher | solved | - |
| Crypto/Second Shift | Crypto | AES-CTR nonce reuse: recover keystream from known-plaintext pair, XOR into second ciphertext | solved | deadfacectf2026_second_shift |
| Database/Admitted Under Another Name | Database | WebSocket SQL shell + targeted filter query (is_vip=1) | solved | deadfacectf2026_aurora_db_forensics |
| Database/After the Lock | Database | WebSocket SQL shell + audit-trail date-boundary join query | solved | deadfacectf2026_aurora_db_forensics |
| Database/Ghost in the Registry | Database | WebSocket SQL shell + cross-schema anti-join (prescriptions without encounters) | solved | deadfacectf2026_aurora_db_forensics |
| Database/Heavy Hand | Database | WebSocket SQL shell + aggregate/ORDER BY outlier query | solved | deadfacectf2026_aurora_db_forensics |
| Database/Prying Eyes | Database | WebSocket SQL shell + access-log correlation by MRN | solved | deadfacectf2026_aurora_db_forensics |
| Database/The Attending | Database | WebSocket SQL shell + simple join on known patient_id | solved | deadfacectf2026_aurora_db_forensics |
| Database/The Original Reading | Database | WebSocket SQL shell + audit data_changes table diff to find tampered value | solved | deadfacectf2026_aurora_db_forensics |
| DeMonneBreach/Borrowed Script | DeMonneBreach | Streaming regex search of multi-GB memory dump for PowerShell history (scp source) | solved | deadfacectf2026_memory_dump_streaming_search |
| DeMonneBreach/Challenge Accepted | DeMonneBreach | LLMNR poisoning -> next SMB2 auth -> tshark NTLMv2 NTProofStr extraction | solved | deadfacectf2026_challenge_accepted |
| DeMonneBreach/Crown Jewels | DeMonneBreach | trivial tshark smb2.filename listing, first PDF in order | solved | - |
| DeMonneBreach/False Telemetry | DeMonneBreach | Streaming regex search of memory dump recovering telemetry.ps1 beacon params | solved | deadfacectf2026_memory_dump_streaming_search |
| DeMonneBreach/Hidden in Plain Task | DeMonneBreach | Streaming regex search of memory dump recovering scheduled-task registration | solved | deadfacectf2026_memory_dump_streaming_search |
| DeMonneBreach/Name to a Face | DeMonneBreach | trivial tshark ntlmssp.auth.username filter | solved | - |
| DeMonneBreach/Public Offering | DeMonneBreach | trivial scapy filter for TCP to a public (non-private) destination IP | solved | - |
| DeMonneBreach/Who Goes There_ | DeMonneBreach | OSINT forum lead corroborated by sibling challenge's independent NTLM username extraction | solved | - |
| DeMonneSlayer/Diagnosis | DeMonneSlayer | trivial, flag found directly in a named Activity class (no detail recorded) | solved | - |
| DeMonneSlayer/Hard Kept Secrets | DeMonneSlayer | Manual DEX string-table parsing to recover hardcoded API token | solved | deadfacectf2026_hard_kept_secrets |
| DeMonneSlayer/Inside Man | DeMonneSlayer | Hardcoded internal creds + internal-token header -> authenticated login response leaks flag | solved | - |
| DeMonneSlayer/No Holding Back | DeMonneSlayer | OSINT-leaked creds -> login -> sequential account_id IDOR/BOLA fuzzing | solved | deadfacectf2026_no_holding_back |
| Forensics/Art Heist_ The Forgery | Forensics | trivial regex scan of zip contents for flag pattern (found in XMP metadata) | solved | - |
| Forensics/Hooked | Forensics | Chrome History SQLite query with Chrome-epoch timestamp conversion | solved | deadfacectf2026_hooked |
| Mobile/Keypad Oracle | Mobile | iOS Mach-O/Swift disassembly of custom PIN cipher + brute force small permutation keyspace | solved | deadfacectf2026_keypad_oracle |
| Mobile/Locked... or Not_ | Mobile | trivial hardcoded base64 string found in classes2.dex | solved | - |
| OSINT/Alice and Bob Would Like a Word | OSINT | GitHub `<username>.keys` endpoint leaks planted flag in fake SSH key entry | solved | deadfacectf2026_alice_and_bob |
| OSINT/Car Crash | OSINT | trivial USDOT number lookup + company founding-date research | solved | - |
| OSINT/Chatty Cathy | OSINT | Forum crawl to find a pseudonymous blog (no technique detail recorded) | solved | - |
| OSINT/Exposing Myself Through Bad OPSEC | OSINT | TLS certificate Subject field (O=) contains the flag | solved | deadfacectf2026_exposing_myself |
| OSINT/Ghost of Squares Past | OSINT | Pure physical-location/history trivia (Savannah historic squares), no technical signal | solved | - |
| OSINT/The Vibes Are Freaking Me Out | OSINT | Forum-to-GitHub-repo pivot; token in AI-agent skill config, reverse-then-base64-decode | solved | deadfacectf2026_the_vibes_are_freaking_me_out |
| OSINT/You Wouldn't Git It | OSINT | Unicode Tag Block (U+E0000-E007F) steganography decode from forum post text | solved | deadfacectf2026_you_wouldnt_git_it |
| Pwn/Skeleton Key | Pwn | Stack overflow -> ROP chain (pop rdi;ret) to satisfy arg-gated win() function | solved | deadfacectf2026_skeleton_key |
| Pwn/The Crypt | Pwn | Stack overflow ret2win; secret-code gate bypassed via static XOR-decode of embedded string | solved | - |
| Reverse/Cereal Killer 01 | Reverse | Custom base64 alphabet -> SHA1 crack (rockyou) -> RC4 decrypt with cracked password -> external image flag | solved | deadfacectf2026_cereal_killer_01 |
| Reverse/Cereal Killer 02 | Reverse | XOR of ciphertext against its own key buffer reversed (key[::-1]) reveals flag | solved | - |
| Reverse/It But A Wee Bit Reverse | Reverse | Static offsets: XOR-encoded password then XOR-repeating-key-decrypted flag in .rodata | solved | - |
| Steganography/Conduct Unbecoming | Steganography | Printer tracking-dot (MIC) forensics: yellow-channel isolation + grid decode to ASCII | solved | deadfacectf2026_conduct_unbecoming |
| Steganography/Exfiltration | Steganography | EXIF DateTimeOriginal-ordered reassembly of ImageUniqueID hex fragments | solved | deadfacectf2026_exfiltration |
| Steganography/File Dump 01 | Steganography | trivial OOXML docProps/core.xml creator metadata read | solved | - |
| Steganography/Headshot | Steganography | trivial PNG tEXt chunk regex scan for flag pattern | solved | - |
| Steganography/Hidden Loot Box | Steganography | no source detail (template writeup/solver, flag file present but no derivation shown) | needs_verification | - |
| TrafficAnalysis/A Pirate's Life for Me_ Part 1 | TrafficAnalysis | Isolate rare User-Agent HTTP stream, join numbered X-N-* header fragments | solved | deadfacectf2026_pcap_sequenced_fragment_reassembly |
| TrafficAnalysis/Bad Guys Be Bad | TrafficAnalysis | DNS subdomain exfil (seq-ordered Base32 chunks) + known-plaintext XOR key recovery | solved | deadfacectf2026_bad_guys_be_bad |
| TrafficAnalysis/Data Go Brrrrr | TrafficAnalysis | ICMP payload carries ordered base64 chunks of the flag | solved | deadfacectf2026_pcap_sequenced_fragment_reassembly |
| TrafficAnalysis/Return to Sender | TrafficAnalysis | HTTP exfil: seq-numbered POST bodies + header carries flag tail, join and base64-decode | solved | deadfacectf2026_pcap_sequenced_fragment_reassembly |
| TrafficAnalysis/Twilight Zone Transfer | TrafficAnalysis | DNS AXFR zone-transfer misconfiguration leaks TXT record flag | solved | deadfacectf2026_twilight_zone_transfer |
| Web/Doctor Appointment (1 of 4 series) | Web | Classic SQLi auth bypass; full JSON response discloses creds+flag despite generic UI error | solved | deadfacectf2026_doctor_appointment |
| Web/Real Pain in the Prostate (2 of 4 series) | Web | SQLi row enumeration via negated username condition, then department-scoped IDOR data leak | solved | deadfacectf2026_real_pain_in_the_prostate |
