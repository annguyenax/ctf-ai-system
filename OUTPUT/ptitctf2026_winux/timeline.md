# Timeline - ptitctf2026_winux

- Unzip Winux.zip: exe + WUX2 rootfs + two DLLs
- Strings: fake Ubuntu-like shell, corrupted package key
- Capstone WnxService: WUX2 parse, then 64-iteration SHA256 iovec
- Dump xor_pad / salt16 / hash32 from rdata
- Brute 64 bytes independently → flag
- WUX2 AES/XOR decrypt attempted, unused
