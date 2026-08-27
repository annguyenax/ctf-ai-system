# Solve Timeline: Palworld Mod

1. **Intake & Triage:** Analyzed Django 4.2 codebase, upload endpoint, Dockerfile DAC permissions (`chmod -R a-w /app`, `chmod a-w /usr/local/lib/python3.11`).
2. **Hypothesis 1:** Overwrite cached top-level stdlib modules (`bz2`, `lzma`, `mimetypes`) -> Failed (modules already in `sys.modules` at startup).
3. **Hypothesis 2:** Relative traversal path length limitation (20 chars) -> Discovered `pathlib.Path` root reset with leading slash (`/usr/local/lib` = 14 chars, `python3.11/encodings` = 20 chars).
4. **Hypothesis 3:** Codec trigger via ASCII zipfile (`cp437`) vs Multipart charset (`iso8859_2`) -> Succeeded with `charset=iso8859_2`.
5. **Exploit & Verification:** Executed `solve.py` against live instance `144.79.188.39:42166`, retrieved flag `PTITCTF{w3lc0mE_t0_th3_InfosecPTIT_h0uSe_h3r3_1S_y0uR_61af5da2e260_mil_vnd}`.
