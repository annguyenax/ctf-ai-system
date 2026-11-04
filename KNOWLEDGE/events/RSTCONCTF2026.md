# RSTCONCTF2026 — Batch 7 digest

Covers 25 entries from this batch (not necessarily the event's full challenge set). Industrial/hydro-utility theme ("RST Hydro") across Crypto/Forensic/Misc/OSINT/Pwn/Reverse/Web. Several challenge folders have only template placeholders (TODO solver, "[Description]" writeup) with just a `final_flag.txt` present — recorded as no-source/needs_verification rather than solved with evidence.

Recurring techniques in this batch:
- Several "placeholder" challenge folders (stub solve.py, templated writeup.md) carry only a bare final_flag.txt with zero recorded derivation — flag text exists but no evidence of method.
- Classic pwn primitives recur (stack smash to a magic value check, straightforward format-string stack leak) alongside one notably unusual LLM-mediated format-string variant.
- Forensics here spans both classic DNS-exfil-in-subdomain pcap parsing and low-level USB link-layer (PID/ACK) reconstruction of SCSI Bulk-Only Transport writes.
- OSINT challenges without attachments rely on finding the org's own social-media posts and reading them literally (acrostics) or geolocating from a provided photo's landmarks.
- Two geo/forensics challenges in this batch remain genuinely unresolved (CAN-bus dead-reckoning, train-window landmark ID) — candidate answers exist but are not server-confirmed.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Binary Exploitation/Thought_Slop | Binary Exploitation | no source (only final_flag.txt) | needs_verification | - |
| Crypto/ARC4 Reactor | Crypto | no source (template stub solver/writeup) | needs_verification | - |
| Crypto/Brackish Key | Crypto | no source (template stub solver/writeup) | needs_verification | - |
| Crypto/Intercepted | Crypto | stacked keyless encoding (hex->base64->reverse->base32), leading `=` padding signals a reversed layer | solved | rstconctf2026_intercepted |
| Crypto/Shallow_Exponent | Crypto | RSA e=3 with m^e < n (no modular wrap) -> integer cube root | solved | rstconctf2026_shallow_exponent |
| Forensic/Do_Not_Service | Forensic | DNS-TXT/subdomain base64 exfiltration in pcap, found by filtering to DNS | solved | rstconctf2026_do_not_service |
| Forensic/Universal_Suffering_Begins__USB_ | Forensic | USB link-layer PID/ACK reconstruction of SCSI Bulk-Only Transport writes | solved | rstconctf2026_universal_suffering_begins_usb |
| Forensic/USB | Forensic | duplicate folder of Universal_Suffering_Begins__USB_, same technique | solved | rstconctf2026_universal_suffering_begins_usb |
| Forensics/Life is a Highway | Forensics (geo_dynamic) | CAN-bus signal decode + dead-reckoning + map-matching; one candidate submitted and rejected | paused | rstconctf2026_life_is_a_highway |
| Misc/Eight_Valves | Misc | trivial Brainfuck interpreter run | solved | - |
| Misc/Feedback | Misc | trivial flag embedded in fetched Google Form HTML | solved | - |
| Misc/Welcome to RSTCON | Misc | trivial flag given directly in challenge description | solved | - |
| OSINT/Foamer | OSINT (geo) | train-interior ID + bridge-landmark geolocation; candidate computed, server acceptance not captured | paused | rstconctf2026_foamer |
| OSINT/Hey Listen | OSINT | official social-media post read as an acrostic (first letter per line) | solved | rstconctf2026_hey_listen |
| Pwn/Carbon Noneoxide | Pwn (embedded FreeRTOS) | unbounded array-index write forges a FreeRTOS queue structure to leak flash flag via legitimate consumer task | solved | rstconctf2026_carbon_noneoxide |
| Pwn/Leaky Logger | Pwn | classic unsanitized `printf(user_buf)` stack leak, offset-targeted `%p` dump | solved | rstconctf2026_leaky_logger |
| Pwn/Overflow Outlet | Pwn | classic stack buffer overflow to overwrite a magic-value check (AArch64) | solved | - |
| Pwn/Thought_Slop | Binary Exploitation | LLM-mediated format string: prompt a deterministic local model into emitting `%p` tokens that reach an unsanitized printf | solved | rstconctf2026_thought_slop |
| RE/Carry_The_Tide | RE | no source (only final_flag.txt) | needs_verification | - |
| RE/New_Money | RE | no source (only final_flag.txt; see Reverse/New_Money for the documented solve) | needs_verification | - |
| Reverse/Function 0x41 | Reverse | no source (template stub solver/writeup) | needs_verification | - |
| Reverse/Ladder Logic | Reverse | no source (template stub solver/writeup) | needs_verification | - |
| Reverse/New_Money | Reverse | QR->web slot machine with exposed client-side LCG; simulate offline to find jackpot state, derive AES-GCM key from it | solved | rstconctf2026_new_money |
| Reverse/Truck-kun | Reverse | no source (template stub solver/writeup) | needs_verification | - |
| Web/Bad Medicine | Web | credentials visible in attached photo, then UNION-based SQLi after login | solved | rstconctf2026_bad_medicine |
| Web/Template Tide | Web | classic Jinja2 SSTI (`{{cycler.__init__.__globals__.os...}}`) | solved | - |
