# report — dctf2026quals_ratatouille

Goal: recover DCTF{64 hex} from ratatouille ELF without executing it.
Environment: Windows python; readelf/strings. No process spawn of the ELF.
Enumeration: .recipe 70 bytes at 0x47b1b6; README malware warning.
Exploitation: FNV-1a of 7 telemetry literals + 0xff; XOR ratatoui; xorshift64* XOR section.
Verification: plaintext DCTF{e132475c...bbc61} 70 ASCII bytes.
Failed paths: execute binary; sha256(.recipe); bash instead of /bin/bash.
Lessons: host checks are often hardcoded transcripts for a stream seed.
