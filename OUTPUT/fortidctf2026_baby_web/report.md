# Baby Web — FortID CTF 2026

Status: solved and locally verified on 2026-10-10.

Flag: FortID{w3b_15_n07_7h47_h4rd_45_y0u_7h1nk_17_15}

## Intake

- Category: Intro; static client-side web challenge.
- Prompt: “The flag is only one click away... if you can catch it!”
- Artifact: CTFTimeWriteup/FortIDCTF2026/Intro/Baby Web/files/index.html
- SHA-256: 17BEBC20B8524EB1541415A5CDC1B51FE0E3F38C7E098015C628B211D6225B9A
- Remote service: none.

## Solve

The button moves on mouseenter, but this is only a UI distraction. Its click handler joins three string fragments, reverses the complete joined string, and passes it to JavaScript atob. Reproduce those deterministic operations locally; there is no need to catch the button in a browser.

Run from the challenge directory:

    python solve/solve.py

The solver prints the flag. I replayed it and independently applied the same transform using PowerShell/.NET. Both results match the existing final_flag.txt and the FortID{...} format.

## Evidence and limits

See the event evidence manifest and verification record:

- CTFTimeWriteup/FortIDCTF2026/Intro/Baby Web/solve/evidence/manifest.md
- CTFTimeWriteup/FortIDCTF2026/Intro/Baby Web/solve/evidence/verification.txt

This is local deterministic verification from the supplied HTML. No submission was performed in this session; a later read-only status.py query on 2026-10-10 listed Baby Web as SOLVED.
