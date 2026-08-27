# Solve Report: Palworld Mod (PTIT CTF 2026)

- **ID:** `ptitctf2026_palworld_mod`
- **Category:** Web
- **Status:** Verified
- **Flag:** `PTITCTF{w3lc0mE_t0_th3_InfosecPTIT_h0uSe_h3r3_1S_y0uR_61af5da2e260_mil_vnd}`

## Summary
The challenge presents a Django REST Framework application where mod builds are uploaded as ZIP files and unpacked to `storage_dir = Path(settings.MEDIA_ROOT) / 'builds' / mod_version / platform_code / filename`.
While relative path traversal is restricted by a 20-character limit on `mod_version` and `platform_code`, providing an absolute path (`/usr/local/lib`) in `mod_version` causes `pathlib.Path` to reset its base path to `/usr/local/lib`.
By combining this with `platform_code = "python3.11/encodings"`, we overwrite standard library codec `/usr/local/lib/python3.11/encodings/iso8859_2.py` with an RCE payload. Triggering a multipart request with `Content-Type: multipart/form-data; charset=iso8859_2` forces Django to load the codec dynamically and execute the payload.
