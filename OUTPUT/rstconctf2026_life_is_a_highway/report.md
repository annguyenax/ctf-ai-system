# Life is a Highway

Status: needs_verification. One coordinate candidate was rejected; no flag is claimed.

Decoded Toyota 2017 CAN signals: wheel speeds (0x0AA), yaw (0x024), steering (0x025). The capture covers 1,772.67 seconds and about 21,977.6 meters. Stationary samples yield a mean yaw offset of -0.061591 degrees/second. Applying that global offset still leaves roughly 19 km dead-reckoning displacement, so this is not sufficient to identify the start.

Candidate `38.89077, -77.05353` was submitted and rejected (`INCORRECT: Incorrect location. Try again!`). The response is preserved at `D:\download\CTFTimeWriteup\RSTCONCTF2026\Forensics\Life is a Highway\solve\evidence\server_verification.txt`; do not repeat this candidate.

Artifact SHA-256: `deb265590271624d1fa0288ab6d9171bae61377ba61ce8fdced9e8ae41dedf4e`.

SHOW: `D:\download\CTFTimeWriteup\RSTCONCTF2026\Forensics\Life is a Highway\writeup\writeup.md`.

Next actions: calibrate turn rates from stationary and low-speed segments, improve map matching against local road geometry, then submit only a route-supported coordinate.
