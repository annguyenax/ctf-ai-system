# Timeline — 2026-10-09 (Asia/Saigon)

1. PCAP triage found FTP control traffic and passive uploads; no raw flag string was present.
2. Reassembled the unique JPEG upload from its TCP sequence numbers.
3. Read the JPEG comment, located the appended encrypted ZIP, and recovered `comms.bin`.
4. Decompressed gzip → bzip2 → gzip → tar, then Base64-decoded the log value.
5. Independent replay matched the existing final flag. Portal submission was not attempted.
