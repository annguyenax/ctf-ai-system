# Reusable patterns — Transcendent Renovation

- **Jump List = OLE compound file:** parse `*.automaticDestinations-ms` with `olefile`; DestList maps
  entries to numbered LNK streams. See `PLAYBOOKS/forensics_windows_jumplist.md`.
- **TrackerDataBlock is authoritative** for hostname (MachineID) + Droid GUIDs; DestList droid fields
  are offset and easy to misread.
- **File Droid (ObjectID) persists across rename** — correlate a folder's history by its DroidFileId.
- **OLE overwrite leaves a remnant:** a shorter LNK written over a stream leaves the old LNK tail
  (pre-rename name) intact — read past the LNK terminator.
- **Grader answer formats:** GUID lowercase-no-braces; "OLE CF" (not "CDF V2"). When a live oracle
  rejects the forensically-correct value, mark unresolved rather than fabricate.
