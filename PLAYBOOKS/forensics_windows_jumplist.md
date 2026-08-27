# Playbook: Windows Jump List forensics (AutomaticDestinations)

**Trigger:** Artifacts named `*.automaticDestinations-ms` / `*.customDestinations-ms`,
or questions about a folder/file's recent access, source drive, hostname, or rename.

## Facts

- `*.automaticDestinations-ms` = **OLE compound file** (a.k.a. CDF V2 / CFBF / "OLE CF").
- The AppID (hex filename) identifies the app; `f01b4d95cf55d32a` = Windows Explorer (taskbar),
  `5f7b5f1e01b83767` = Explorer (frequent).
- Streams: `DestList` (MRU list) + numbered hex streams, each a **LNK (shell link)**.

## Method (olefile)

```python
import olefile, struct, re
ole = olefile.OleFileIO(path)
dl  = ole.openstream('DestList').read()
# DestList entry (modern): 4x16B droids, 16B hostname(@0x48), stream# uint32 @0x58,
#   path-char-count uint16 @0x80, UTF-16 path @0x82, then +4. (offsets can vary by version;
#   locate the path by searching 'X:\\' and read the uint16 just before it to self-calibrate.)
data = ole.openstream('<hexstream>').read()   # the LNK for the entry
```

From the LNK:
- **TrackerDataBlock** (sig `0xA0000003`): `MachineID` (hostname, bytes 16..32 of block),
  `DroidVolumeId`/`DroidFileId` at +32/+48, `Birth*` at +64/+80. The **DroidFileId is the
  NTFS ObjectID — persistent across rename/copy-in-place**; use it to correlate history.
- **LinkInfo** / shell items: local path and any UNC share (`\\host\share`). `\\tsclient\...`
  means the file came from an **RDP redirected drive**.
- **Rename remnant:** OLE streams are NOT truncated when overwritten with a shorter LNK, so the
  tail after the valid LNK can hold the *previous* LNK (older folder name). Read past the LNK
  terminator to recover the pre-rename name.

## Answer-format gotchas

- GUIDs often expected **lowercase, no braces** (JLECmd style).
- "File format" answer that graders accept: **`OLE CF`** (not `CDF V2`).

## Verification

If a live oracle grades answers, treat each accepted answer as ground truth. Don't fabricate a
value the oracle rejects — if the forensic answer is rejected, mark it unresolved.

## Used by

- L3akCTF2026 / Transcendent Renovation (6/7; Q7 unresolved) — `cards/l3akctf_transrenov.yaml`
