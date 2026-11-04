# Securinets CTF Friendly 2026 — batch 8 digest (71 entries)

Most writeups in this event are short/auto-generated; many have a filled writeup.md (one-paragraph technique + flag) while roughly half have only the unfilled writeup/ANALYSIS.md template (no actual investigation content, treated as "no source" below). This batch is most of the Crypto/Forensics/Misc/Mobile/OSINT/Pwn/Reverse/Web categories; recurring techniques observed: (1) multi-layer encoding chains (base64/hex/octal/vigenere) solved by straight CyberChef-style decoding, (2) textbook RSA edge cases (common modulus, small-e no-padding), (3) known-plaintext XOR key recovery from a hinted crib phrase, (4) classic web bugs (SQLi, SSTI, XSS, IDOR, path traversal, command injection) with no added twist, (5) sandboxed eval()/parser filters bypassable via runtime string construction or language-level escape syntax.

| path | category | technique | status | card id |
| --- | --- | --- | --- | --- |
| Crypto/Base64 | Crypto | trivial base64 decode | solved | - |
| Crypto/Bases | Crypto | base64 -> octal -> hex -> ASCII decode chain | solved | - |
| Crypto/Ciphers | Crypto | Bionicle Matoran glyph script recognition and decode (one-off puzzle, not reusable) | solved | - |
| Crypto/Kamehameha | Crypto | FFT-identify audio carrier tone, demodulate envelope into Morse code | solved | - |
| Crypto/Majin Buu | Crypto | known-plaintext XOR key recovery from a hinted crib phrase (repeating-key XOR) | solved | - |
| Crypto/Mayuri Kurotsuchi | Crypto | textbook RSA common-modulus attack (coprime e1=3,e2=5, Bezout reconstruction) | solved | - |
| Crypto/RSAnt | Crypto | textbook RSA small-exponent (e=3) no-padding cube-root recovery | solved | - |
| Crypto/Saiyan Saga | Crypto | no source (writeup template unfilled) | needs_verification | - |
| Crypto/Salah mta3 lpawn | Crypto | known-plaintext XOR key recovery from flag-prefix crib (repeating-key XOR) | solved | - |
| Crypto/The Hokage's Scroll | Crypto | no source (writeup template unfilled; tags suggest RSA) | needs_verification | - |
| Crypto/Vigenere | Crypto | Vigenere decrypt with key given via riddle | solved | - |
| Forensics/Bad Magic | Forensics | no source (writeup template unfilled; tags suggest magic-byte repair) | needs_verification | - |
| Forensics/Big Haystack | Forensics | no source (writeup template unfilled; tags suggest grep -r over nested logs) | needs_verification | - |
| Forensics/Black Marker | Forensics | no source (writeup template unfilled; tags suggest PDF redaction-rectangle removal) | needs_verification | - |
| Forensics/chilla box 1 | Forensics | maldoc exfil chain: PDF /OpenAction launches second-stage docm | solved | securinets2026_chilla_box_maldoc_chain |
| Forensics/chilla box 2 | Forensics | maldoc exfil chain: identify contacted host from PDF/macro | solved | securinets2026_chilla_box_maldoc_chain |
| Forensics/chilla box 3 | Forensics | maldoc exfil chain: identify second-stage docm path | solved | securinets2026_chilla_box_maldoc_chain |
| Forensics/chilla box 4 | Forensics | maldoc exfil chain: identify COM component used by VBA macro | solved | securinets2026_chilla_box_maldoc_chain |
| Forensics/chilla box 5 | Forensics | maldoc exfil chain: identify exact private exfil path | solved | securinets2026_chilla_box_maldoc_chain |
| Forensics/chilla box 6 | Forensics | maldoc exfil chain: flag recovered from pcap HTTP response | solved | securinets2026_chilla_box_maldoc_chain |
| Forensics/Cookie Jar | Forensics | deleted Chromium history record recovered via raw binary grep of unvacuumed SQLite pages | solved | - |
| Forensics/Force Push | Forensics | git force-push does not GC loose objects; recovered secret from .git/objects on the pushing clone | solved | - |
| Forensics/Frozen | Forensics | PyInstaller extraction (pyinstxtractor) + pyc disassembly recovers hardcoded license-check logic | solved | - |
| Forensics/Git Oops | Forensics | no source (writeup template unfilled; tags suggest git log/reflog recovery) | needs_verification | - |
| Forensics/Hello Packet | Forensics | plaintext HTTP credentials visible directly in pcap | solved | - |
| Forensics/Hidden Files | Forensics | hidden dotfile located inside extracted tar.gz | solved | - |
| Forensics/Just Look | Forensics | no source (writeup template unfilled; tags suggest strings on a memory dump) | needs_verification | - |
| Forensics/Morse Beeps | Forensics | no source (writeup template unfilled; tags suggest audio Morse decode) | needs_verification | - |
| Forensics/Office Party | Forensics | no source (writeup template unfilled; tags suggest docx-is-a-zip-of-xml inspection) | needs_verification | - |
| Forensics/Onions | Forensics | no source (writeup template unfilled; tags suggest layered-encoding peel) | needs_verification | - |
| Forensics/Russian Doll | Forensics | no source (writeup template unfilled; tags suggest nested-zip extraction) | needs_verification | - |
| Forensics/Scan Me | Forensics | color-inverted PNG decoded as QR code via pyzbar | solved | - |
| Forensics/Shell Script | Forensics | no source (writeup template unfilled; tags suggest shar/file-type trick) | needs_verification | - |
| Forensics/Too Dark | Forensics | no source (writeup template unfilled; tags suggest brightness/contrast stego reveal) | needs_verification | - |
| Forensics/Two Faces | Forensics | no source (writeup template unfilled; tags suggest file-format polyglot) | needs_verification | - |
| Forensics/Wrong Coat | Forensics | no source (writeup template unfilled; tags suggest extension-vs-real-type mismatch) | needs_verification | - |
| Forensics/Wrong Number | Forensics | DNS-tunneling exfil: hex-encoded flag fragments spread across subdomain labels in dns.pcap | solved | - |
| Forensics/Zip Code | Forensics | no source (writeup template unfilled; tags suggest APK-is-a-zip inspection) | needs_verification | - |
| Misc/Banned in Leonida | Misc | eval() keyword blacklist bypassed by constructing 'open'/'flag' via getattr+string concatenation, since __builtins__ is passed through intact | solved | securinets2026_banned_in_leonida |
| Misc/Cheat Code | Misc | trivial unrestricted eval() on raw input | solved | - |
| Misc/EMPTY THREATS | Misc | no source (writeup template unfilled) | needs_verification | - |
| Misc/FLOATING RECEIPTS | Misc | no source (writeup template unfilled) | needs_verification | - |
| Misc/Follow Me | Misc | tarfile.extractall(filter="fully_trusted") honors a symlink member pointing outside the extraction folder, leaking an arbitrary file | solved | securinets2026_follow_me |
| Misc/JS_1.0 | Misc | JS eval sandbox substring blacklist bypassed via \uXXXX unicode identifier escape spelling the banned variable name | solved | securinets2026_js_1_0 |
| Misc/KHLOSS LMOUHAMI | Misc | PDF font Encoding /Differences array aliases two byte ranges to identical glyphs; byte-range choice per glyph hides a steganographic bitstream | solved | securinets2026_khloss_lmouhami |
| Misc/TRAFFIC LIGHTS | Misc | no source (writeup template unfilled; tags suggest binary/color encoding) | needs_verification | - |
| Misc/VICE CITY FM | Misc | no source (writeup template unfilled; tags suggest m3u playlist encoding) | needs_verification | - |
| Mobile/Warmup | Mobile | hardcoded AES-CBC key/IV found in decompiled APK class decrypts an embedded blob | solved | - |
| OSINT/Beethoven el ghaleba | OSINT | musical-note image decoded via the dCode Music Sheet Cipher tool/spec | solved | - |
| OSINT/Hear the image | OSINT | no source (writeup template unfilled; tags suggest audio spectrogram image) | needs_verification | - |
| OSINT/Lost in the Mountains | OSINT | visual landmark recognition (Hollywood Sign) for geocoordinates | solved | - |
| OSINT/Numero de telefono | OSINT | DTMF dual-tone decode of an audio file into a phone number | solved | - |
| OSINT/Planet Devourer | OSINT | flag stored directly in image XMP pdf:Author metadata field | solved | - |
| OSINT/Talla3 lfou9 | OSINT | hex-decoded coordinates point to NASA's "Your Name in Landsat" ground-feature-letters imagery project | solved | - |
| OSINT/WTF | OSINT | Brainfuck source execution decodes the flag | solved | - |
| Pwn/2nd_download | Pwn | staged shellcode: mmap RWX buffer, tiny stage-1 read() shellcode pulls in stage-2 execve shellcode | solved | - |
| Pwn/GATEWAY | Pwn | classic ret2libc: leaked puts() gives libc base, stack overflow overwrites saved rbp and returns into a one_gadget | solved | - |
| Pwn/Wrong Turn | Pwn | RWX stack + no canary; overflow places shellcode and pivots via a jmp rsi gadget | solved | - |
| Pwn/XYZ | Pwn | PIE leak + 40-byte overflow; win-function's required register constants happen to be decodable as pop-reg;ret gadgets inside the movabs immediates that already load those same constants elsewhere in the binary | solved | securinets2026_xyz |
| Reverse/Shift | Reverse | algebraically invert a per-byte rol/xor keystream check, then use the recovered key to seed an FNV-1a-seeded xorshift PRNG that XOR-decrypts the flag | solved | - |
| Reverse/Welcome | Reverse | no source (writeup template unfilled; tags suggest plain `strings` lookup) | needs_verification | - |
| Reverse/XOR Me | Reverse | no source (writeup template unfilled; tags suggest static XOR key read in IDA) | needs_verification | - |
| Web/1dor | Web | classic IDOR: sequential integer note IDs enumerated to assemble a flag split across many single-character notes | solved | - |
| Web/baby cmd inj | Web | unsanitized shell command injection via `;` chaining into a `dig` lookup endpoint | solved | - |
| Web/baby SQLi | Web | classic `' OR 1=1 --` authentication-bypass SQL injection | solved | - |
| Web/baby ssti | Web | classic Jinja2 SSTI via `self.__init__.__globals__` sandbox escape to read an environment variable | solved | - |
| Web/baby X55 | Web | classic reflected/stored XSS exfiltrating an admin bot's session cookie | solved | - |
| Web/backwards | Web | unsanitized filename parameter allows `../` path traversal to read an arbitrary file | solved | - |
| Web/More than products | Web | UNION-based SQL injection dumps user table; cracked MD5 password hash via rockyou wordlist for admin login | solved | - |
| Web/robots | Web | no source (writeup template unfilled; likely a disallowed path in robots.txt) | needs_verification | - |
| Web/🍪 | Web | base64-encoded is_admin cookie value flipped from False to True | solved | - |
