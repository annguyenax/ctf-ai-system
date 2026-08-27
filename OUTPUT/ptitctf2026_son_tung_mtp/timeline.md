# Timeline — ptitctf2026_son_tung_mtp

- **INTAKE:** Located the existing challenge folder; `chalenge.md` was empty; preserved the supplied archive hash.
- **TRIAGE:** 7-Zip listed one unencrypted member, `chall.wav`; extraction passed CRC.
- **TEST H1:** RIFF parser found only `fmt ` and `data`, with no trailing bytes or metadata.
- **TEST H2:** Raw flag scan and low bit-plane scans produced no structured payload.
- **TEST H3:** Whole-band spectrogram exposed an anomalous ultrasonic region in the first 20 seconds.
- **EXPLOIT (retracted):** A 15.2–18.85 kHz crop renders `PTITCTF{n1c3_try_ju57_try_h4rd3r_i_gu355}` — decoy, not flag. Prior transcription `N0T_JUST_MUSIC_BUT_A_MASTERPIECE` was a misread.
- **RE-EXAM:** Cover identified as Hãy Trao Cho Anh (NCC 0.995 vs official MV). Residual still only decoy. LSB/Morse/SSTV/QR/phase negative. Unsolved.
