# Reusable patterns

- For FTP PCAPs, correlate control-channel `EPSV`/`STOR` messages with separate passive TCP data flows.
- Reassemble TCP by sequence number and validate retransmission overlaps before using file signatures.
- Search image bytes for appended container signatures after checking the image metadata/comment; a password clue may protect an appended archive rather than image steganography.
- Follow file magic through nested decompression and archive layers, then verify decoded flag bytes against the declared format.
