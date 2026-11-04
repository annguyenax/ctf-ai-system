# Dow is Up 50k — solved and verified

The supplied app mirror accepted a React Server Components Server Action payload that produced a harmless command marker, then read only /flag.txt. The response carried the bytes as base64url in x-action-redirect; the solver decoded them and checked the expected rstcon{...} form. The official RSTCON checker accepted the result.

Exact React patch version was not exposed. The successful harmless command and exact scoped file read prove the behavior directly; the app fingerprint was only a lead.

Event evidence: D:\download\CTFTimeWriteup\RSTCONCTF2026\Web\Dow is Up 50k\solve\evidence\manifest.md
Writeup: D:\download\CTFTimeWriteup\RSTCONCTF2026\Web\Dow is Up 50k\writeup\writeup.md
Solver: D:\download\CTFTimeWriteup\RSTCONCTF2026\Web\Dow is Up 50k\solve\solve.py
Flag SHA-256: f6b14c77b2f31420629883e7888fa05e2d2833564e7b54200fbd6879c765c937

