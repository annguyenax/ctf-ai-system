# Reusable patterns — MMO

- Nuitka Windows onefile: look for `NUITKA_ONEFILE_*` and RT_RCDATA ID 27 starting with `KAY` then zstd (`28 B5 2F FD`).
- Archive members: UTF-16LE path + uint64 size + raw bytes (no per-file checksum in temp-dir mode).
- Nuitka unicode constants may be tagged with a leading `u`; strip it when reading URLs.
- Inner app strings beat running the GUI when the question is “which API”.
