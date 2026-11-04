# Reusable patterns

- Custom PNG chunk that looks like ZIP (`zIPP` + `PK`) is often a labeled decoy. Read trailing ASCII after IEND before spending time on LSB.
- A uuencode *line* may omit `begin`/`end`. First character can be data, not a length byte — decode all 6-bit groups from SPACE (`ord(c)-32`).
- WordPress `name-600x400.jpg` implies a full `name.jpg` in the same uploads folder.
- CTF flavor-text handles: GitHub profile README socials beat guessing the legal name from a group photo.
