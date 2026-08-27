# PTITCTF2026 anhcd — needs verification

Category confidence: forensics/image steganography 0.98. Flag status: candidate.

The PNG deterministically exposes two intentional flag-shaped strings: one
52-byte length-prefixed RGB-LSB payload and one string painted in the 2D FFT
log-magnitude. The LSB text is self-identifying bait. The FFT text is reproducible
but has no independent acceptance evidence and the user reports it is a decoy.

No third carrier was found in the archive/container, metadata, PNG chunks, JPEG
markers, ordinary pixel bit planes, geometric traversals, image differences,
common spatial/frequency transforms, or common JPEG stego families. This is a
bounded negative result, not proof against an arbitrary keyed custom scheme.

Best next actions:

1. Capture the exact scoreboard response for the FFT candidate without Markdown backslashes.
2. Obtain one official hint or author confirmation that a third layer exists.
3. If confirmed, derive its carrier/key model from that hint before further search.

SHOW writeup: D:/download/CTFTimeWriteup/PTITCTF2026/Forensics/anhcd/writeup/writeup.md

