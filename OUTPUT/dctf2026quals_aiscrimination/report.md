# aiscrimination — solve report

## Summary
- **Event:** DefCamp CTF 2026 Quals (Web, 295 pts, Medium)
- **Author:** 0xAMA
- **Flag:** `CTF{5bb9cb8b8ff43e243fe85fceaf646e7ba6a5c80250e96678be2aa71add38eb97}`
- **Status:** verified

## Vulnerability
The join form's `statement` field is embedded raw into a per-card CSS stylesheet.
`compile_theme()` expands `@import url("<path>");` directives by reading a local file
and inlining it:

```python
imported = (THEME_ROOT / requested).resolve().read_text(encoding="utf-8")
```

No containment check follows `resolve()`, and an absolute RHS overrides `THEME_ROOT`
(pathlib semantics), giving an arbitrary local file read (LFI) whose result is
reflected in the generated CSS.

## Attack chain
1. `POST /join` with `statement = '@import url("/etc/passwd");'` → works (LFI confirmed).
2. Read `/proc/self/environ` → `PWD=/home/ctf/app`, `THEME_ROOT=/home/ctf/app/themes/generated`.
3. Read `/home/ctf/app/app.py` → confirmed `compile_theme` sink + default secret key.
4. Read `/home/ctf/flag.txt` → flag.

## Verification
Two independent LFI reads (separate cards) returned identical flag bytes; inner value
is 64 lowercase hex chars (matches `CTF{sha256}`). Evidence in `raw/`.

## Artifacts
- Solver: `D:\download\CTFTimeWriteup\DCTF2026Quals\Web\aiscrimination\solve\solve.py`
- Writeup: `D:\download\CTFTimeWriteup\DCTF2026Quals\Web\aiscrimination\writeup\writeup.md`
