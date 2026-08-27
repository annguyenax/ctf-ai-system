# Reusable Patterns — Python Pathlib & Dynamic Codec Import

1. **Pathlib Root Reset on Leading Slash:**
   `Path('/base/dir') / '/target/dir'` evaluates to `PosixPath('/target/dir')`.
   When length limits prevent long `../../..` sequences, check if leading slash allows jumping directly to target root subpaths.

2. **On-Demand CPython Codec Loading:**
   CPython loads `encodings.<codec>` dynamically on first use of `str.encode(codec)` or `bytes.decode(codec)`.
   Django's `MultiPartParser` decodes multipart fields using the `charset` parameter from `Content-Type: multipart/form-data; charset=<codec>`.
   Overwriting any unused encoding module (e.g. `iso8859_2.py`, `big5.py`, `shift_jis.py`) in `/usr/local/lib/python3.X/encodings/` provides reliable on-demand RCE.
