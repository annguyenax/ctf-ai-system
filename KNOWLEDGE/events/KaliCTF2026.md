# KaliCTF2026 — Batch 1 digest (9 entries)

Recurring techniques in this slice:
- OSINT prompts resolve against public, authoritative archives (CTFtime team/event pages, Chronicling America) rather than generic search engines.
- Corporate/invoice OSINT hides real content behind reachable subdomains; robots.txt on those subdomains maps the interesting paths.
- `pwn` challenges here are intentionally beginner-tier primitives (ret2win, fmt-leak+ret2libc, time-seeded PRNG prediction) with a bundled libc/loader for local verification before any remote run.
- `web` challenges are classic single-trick bugs (Execution-After-Redirect body leak, User-Agent-gated content) solvable with one curl/requests call.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| guests/Havok Trail | guests/osint | CTFtime team event-history lookup to reconstruct year/city/rank | solved | kalictf26_havok_trail |
| misc/call me | misc | flag text painted into early spectrogram region; Morse on a later segment is just a hint pointer | solved | kalictf26_call_me |
| osint/OSHIT | osint | corporate subdomain enumeration + robots.txt-gated paths reveal award/registration/photo evidence | solved | kalictf26_oshit |
| osint/The Unbroken Shelf | osint | exact-phrase full-text search on Chronicling America identifies the source newspaper issue | solved | kalictf26_unbroken_shelf |
| pwn/Leaky | pwn | printf(buf) format-string leak of puts@GOT, stack-align via extra ret, then ret2libc system("/bin/sh") | solved | kalictf26_leaky |
| pwn/rayray | pwn | predict glibc rand()%100 after srand(time(NULL)) using a small seed window around connect time | solved | kalictf26_rayray |
| pwn/Warmy | pwn | gets() stack overflow, no canary/PIE, ret2win to a flag-printing function | solved | kalictf26_warmy |
| web/Lock Out | web | Execution-After-Redirect: 302 response body still contains the gated admin page HTML | solved | kalictf26_lockout |
| web/Robots | web | content/flag gated on User-Agent: Googlebot spoofing | solved | kalictf26_robots |
