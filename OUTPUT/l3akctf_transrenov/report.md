# Report — L3akCTF2026 / Transcendent Renovation (Beginner/forensics) — needs_verification

- **Status:** 6/7 answers accepted by the live ncat service; flag gated on all 7. Q7 unresolved.
- **Flag:** not obtained (not fabricated)
- **Artifact:** `TranscendentRenovation.zip` (pw dead7852) → jump lists; sha256 82b2d7c...880549

## Approach

Explorer jump list `f01b4d95cf55d32a.automaticDestinations-ms` (OLE compound file). Parse with
olefile: DestList maps `NoNeedToWonder` → stream `46` (a LNK). TrackerDataBlock → hostname
`logging-vm` + DroidFileId `ec2ab952-7e4d-11f1-89ad-a2dead7852ad`. Share `\\tsclient\HauntedHouse`
(RDP redirected drive). The overwritten LNK remnant in stream 46 holds the pre-rename name `SoulSearch`.

## Accepted answers (live service ✔)

1 `OLE CF` · 2 `f01b4d95cf55d32a.automaticDestinations-ms` · 3 `\\tsclient\HauntedHouse` ·
4 `46` · 5 `ec2ab952-7e4d-11f1-89ad-a2dead7852ad` · 6 `logging-vm`

## Blocker — Q7 "original name"

Forensic answer = `SoulSearch` (rename remnant). Service rejects it and every variant tried
(all casings, spacing, path forms, NoNeedToWonder, HauntedHouse, 8.3 names) — verified slowly to
rule out rate-limiting; no hint mechanism. Only two names exist for this folder (same File Droid).
Left unresolved; needs the author's expected string.

## Pointers

- Writeup: `../CTFTimeWriteup/L3akCTF2026/Beginner/Transcendent Renovation/writeup/writeup.md`
- Solver: `../CTFTimeWriteup/L3akCTF2026/Beginner/Transcendent Renovation/solve/solve.py`
- Card: `KNOWLEDGE/cards/l3akctf_transrenov.yaml`
- Playbook: `PLAYBOOKS/forensics_windows_jumplist.md`
