# Silent Tone — solved

Flag: `Securinets{d0ppl3r_w13n3r_r4pp_rlc_g4rdn3r_3kf_rs255_ph4nt0m}`

Original-artifact replay verifies RS parity and CRC32 for all three packets, plus
exact re-encryption. No scoreboard acceptance claimed.

SHOW: `D:\download\CTFTimeWriteup\SecurinetsQuals2026\Forensics\Silent Tone`
Solver: `solve/solve.py`; evidence: `solve/evidence/recovery.json`.

Key findings: native SAL rendering pyramids broke prior sampling; use first
firmware-2.3.1 segment; deinterleave before whitening; identical repeated packets
enable successive interference cancellation. Sorted binary UIDs seed SHA256-CTR.

Local DSP only; HexStrike not needed or checked. No remaining recovery task.

Capture validator passed. Generated workspace index refreshed and checked current.
Retained compact evidence: 2,959 bytes, in addition to original attachments and solver.
Removed 132,644,657 bytes of scratch, 32,946,313 bytes of hash-verified extracted
duplicates and 16,440 bytes of Python bytecode. Original SAL/PCAP remain intact.
