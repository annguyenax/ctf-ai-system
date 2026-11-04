# Rip & Tear — FortID CTF 2026

Status: solved, platform-confirmed 2026-10-11.
Flag: FortID{Kn33_Deep_1n_7h3_Fl4gZ!1}

- Misc/forensics: chocolate-doom patch XORs 32 flag bytes (MSB-first) into LSBs of
  256 rndtable entries.
- Leak channel: screen-melt wipe uses the table directly; each column's melt walk
  leaks one flag bit via residue mod 3 (vanilla%3 vs observed). width/=2 -> 160/320
  entries per wipe; 3 screen transitions in the 175s video cover all entries.
- Extraction: crop 4:3 game area, 35Hz tick detection in 60fps video, per-column
  melt-edge tracking (ramp trajectory), Viterbi with random-walk +-1 constraint,
  table offset anchored by known FortID{/} bits; hidden tick constant C=6 from
  column-0 nibble%16. 3 wipes -> 480/480 bits.
- Pitfall: 3 low-contrast right-edge bits initially wrong (470/480) — leetspeak
  reading + full simulation fixed to 480/480.
- Solver: CTFTimeWriteup/FortIDCTF2026/Misc/Rip & Tear/solve/solve_wipe_melt.py.
