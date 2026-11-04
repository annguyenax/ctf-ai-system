# L3akCTF2026 — Batch 1 digest (10 entries)

This is a partial slice of the event (other L3akCTF2026 challenges already have
cards from earlier batches, e.g. `l3akctf_blunder`, `l3akctf_rsa_eclipse`, etc.).
Notes specific to this slice:
- Writeups sourced from external blogs were captured by the archiving pipeline with a hard byte cap mid-article; several entries here have real, substantial technique content but the source text is cut off before the exploit completes or a flag is shown — recorded as `needs_verification`/`paused`, not fabricated as solved.
- The "L3AK Platform Protection" series is one running target (react2shell-style Next.js RCE) behind an evolving WAF; each part raises the required JSON-decode-recursion depth or closes the previous charset/parser differential rather than changing the underlying bug class.
- Multiple challenges reward *not* reversing custom crypto/sandboxes from scratch: replay captured traffic into the legitimate binary (Yet Another Chat), or audit the trusted supervisor's own syscall-emulation code instead of the sandboxed child (Supervisor).
- `squid` chains three separate, independently-documented parser/TOCTOU differentials (json vs ujson, urllib vs urllib3, werkzeug send_file stat-then-open race) into one RCE+exfil path — a good example of combining known primitives rather than needing a novel one.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| l3ak platform protection/L3AK Platform Protection - Part 0 | web | no WAF present; solved by reusing a publicly known react2shell PoC verbatim | trivial | - |
| l3ak platform protection/L3AK Platform Protection - Part 1 | web | multipart charset (UTF-16LE) differential: WAF decodes as UTF-8, backend honors declared charset | needs_verification | l3akctf_platform_protection_part1 |
| l3ak platform protection/L3AK Platform Protection - Part 2 | web | nested resolved_model chunks force the framework's own recursive decode to unwrap an extra escape layer the WAF's single pass misses | needs_verification | l3akctf_platform_protection_part2 |
| l3ak platform protection/L3AK Platform Protection - Part 3 | web | same nested-chunk trick, parameterized by decode-depth (DEPTH) to match an increased requirement | needs_verification | l3akctf_platform_protection_part3 |
| pwn/Piet | pwn | esolang (Piet) interpreter taking a PNG as input; source writeup truncated before this section began | no source | - |
| pwn/Piet 2 | pwn | same target family as Piet; source writeup truncated before this section began | no source | - |
| pwn/Supervisor | pwn | seccomp-unotify sandbox; real attack surface is unchecked attacker-controlled offset/length in the supervisor's own pread64/pwrite64/lseek emulation, not the sandboxed child | paused | l3akctf_supervisor |
| rev/Subleq Scramble | rev | Subleq (single-instruction ISA) VM memdump; parsed the 16-bit cell program but source writeup truncated before the encryption-inversion/flag recovery | paused | l3akctf_subleq_scramble |
| rev/Yet Another Chat | rev | replay captured server->client bytes at the real (legitimate) client binary, letting it decrypt the conversation instead of reversing the crypto | solved | l3akctf_yet_another_chat |
| Web/squid | web | mass-assignment via json/ujson surrogate differential -> SSRF via urlparse/urllib3 host differential -> werkzeug send_file() stat-vs-open TOCTOU via /proc/self/fd symlink swap to read 0-size /proc/<pid>/environ | solved | l3akctf_squid |
