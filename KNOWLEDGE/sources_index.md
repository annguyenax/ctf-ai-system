# Knowledge sources index

This is a compact router, not a writeup archive. Open only the linked card/playbook that matches current evidence.

## Signal router

| Signal | Route |
|---|---|
| repeating XOR + known prefix | `PLAYBOOKS/crypto_xor_repeating.md` |
| LCG keystream + known modulus + >=3 outputs | `PLAYBOOKS/crypto_lcg_recover.md` |
| RSA N with long 0xFF/0x00 runs in hex (near power of two primes) | `PLAYBOOKS/crypto_rsa_near_power_of_two.md` |
| MQ system over small field missing oil*oil terms (Oil-and-Vinegar) | `PLAYBOOKS/crypto_oil_and_vinegar_invert.md` |
| near-English text, wrong letters are QWERTY-adjacent | `PLAYBOOKS/misc_keyboard_shift_cipher.md` |
| method-override + verb-gated CSRF/auth check | `PLAYBOOKS/web_csrf_method_override_bypass.md` |
| high-Fs wav, multiple stacked signals / "pieces" | `PLAYBOOKS/rf_multimode_audio_spectrogram.md` |
| WAV + painted spectrogram text (then CW Morse hint) | spectrogram text (cards/kalictf26_call_me.yaml) |
| Windows Jump List *.automaticDestinations-ms / DestList | `PLAYBOOKS/forensics_windows_jumplist.md` |
| AES-CBC structured plaintext without integrity | `PLAYBOOKS/crypto_cbc_bitflip.md` |
| C++ template constraints | `PLAYBOOKS/rev_template_z3.md` |
| type-level key/ciphertext/round loop | `PLAYBOOKS/rev_template_feistel.md` |
| esolang + orientation hint/decoy | `PLAYBOOKS/rev_esolang_orientation.md` |
| password ELF plaintext compare | `PLAYBOOKS/rev_strings_password.md` |
| Java boxed integer identity compare | `PLAYBOOKS/pwn_java_integer_cache.md` |
| login plus offline hash | `PLAYBOOKS/pwn_auth_hash.md` |
| scanf(%s) + length-field print + canary + win() | `PLAYBOOKS/pwn_scanf_null_and_len_leak.md` |
| heap menu UAF + Edit(heap-wide bounds, writes stored size) + largebin->_IO_list_all + House of Apple 2 | `cards/babyheap-v2-revenge.yaml` |
| ELF gets + win symbol, no canary, no PIE | ret2win (cards/kalictf26_warmy.yaml) |
| restricted interpreter with boolean feedback | `PLAYBOOKS/jail_boolean_oracle.md` |
| soft/broken QR or Data Matrix | `PLAYBOOKS/misc_barcode_qr_recovery.md` |
| PNG won't open + repeating marker word at fixed byte spacing | `PLAYBOOKS/crypto_png_inserted_marker_repair.md` |
| image has decoy flag + border pixels a slightly different colour at fixed spacing | read one colour channel (R) of those pixels as ASCII |
| time-seeded random.Random(int(time.time())) + published commitment/first output | `PLAYBOOKS/crypto_prng_time_seed_commitment.md` |
| zip password = sha256(flag) + nested AES zips + reversed-hex flag fragments in sub-challenges | `cards/ptitctf2026_cia_integrity.yaml` |
| DOM/CSS media-query character selection | `PLAYBOOKS/misc_css_media_query_extraction.md` |
| annotated star field and ordered cultural clues | `PLAYBOOKS/osint_annotated_starfield.md` |
| Rust/prost custom TCP with DWARF | `PLAYBOOKS/rev_protobuf_wire_dwarf.md` |
| embedding-only LoRA/tokenizer artifact | `PLAYBOOKS/misc_embedding_lora_extraction.md` |
| angular numeric vectors with detector width changing by angle | `PLAYBOOKS/forensics_variable_width_radon.md` |
| deleted Windows image named by LNK/ActivitiesCache + thumbcache present | `PLAYBOOKS/forensics_windows_thumbcache_recovery.md` |
| many equally spaced slices with the same projection-angle set | `PLAYBOOKS/forensics_multislice_projection_stack.md` |
| distinctive exact software/version or low confidence | `PLAYBOOKS/recon_external_search.md` |
| artificial PGN + one piece traces many adjacent squares | `PLAYBOOKS/misc_chess_coordinate_glyphs.md` |
| wide grayscale spectrogram image + spoken-message hint | `PLAYBOOKS/hardware_spectrogram_image_reconstruction.md` |
| clipping of an old newspaper (headline + body) → identify issue/date/address/time | `PLAYBOOKS/osint_historic_newspaper_fulltext.md` |
| loc.gov / Chronicling America behind Cloudflare "Just a moment" (curl/proxy/curl_cffi 403) | headed Chrome + CDP `fetch()` — see `PLAYBOOKS/osint_historic_newspaper_fulltext.md` |
| Flask endpoint parsing user XML + lxml encoding-declaration error | XXE file read, drop `<?xml?>` (cards/htb_tryout_jailbreak.yaml) |
| ELF imports memfrob + mmap RWX runtime unpack | XOR-42 decode .text in-file (cards/htb_tryout_satellite_hijack.yaml) |
| checker input[i] XOR key[i] == i, key as movabs constants on stack | recover inner[i]=key[i]^i (cards/htb_tryout_satellite_hijack.yaml) |
| Varnish vcl_hash keyed on one request header + reflected CRLF in backend | cache-poison + in-band exfil (cards/htb_tryout_omniwatch.yaml) |
| stacked SQLi where middleware compares str != bytes | use `'...'` string literal not `0x`-hex (cards/htb_tryout_omniwatch.yaml) |
| lighthouse video, beam toggles 4 diagonal directions / Morse-like ON-OFF flash | beam direction + dwell / Morse signal (cards/ptitctf2026_signaling.yaml, paused) |
| Go WebView2 PE + sidecar config.enc pbkdf2-sha256/AES-GCM | `cards/ptitctf2026_pablo_escobar.yaml` (paused; then OSINT last inbox JPEG) |
| Nuitka onefile + RT_RCDATA/27 `KAY`+zstd | `cards/ptitctf2026_mmo.yaml` |
| PE32+ stacked custom VM + 256-bit Feistel compare | `cards/ptitctf2026_ghostvm.yaml` |
| Android JNI std::string length-5 `hello` license compare | `cards/ptitctf2026_phonefarm.yaml` |
| RSA p = 32-bit-smooth + small s, e≈Kv/u | `cards/ptitctf2026_nhh.yaml` |
| fake Winux distro PE + WUX2 + per-char SHA256 proofs | `cards/ptitctf2026_winux.yaml` |
| heap menu UAF + glibc 2.35 + SIGALRM puts/exit | tcache poison **stderr** House of Apple 2 (`cards/ptitctf2026_baby_heap_v2.yaml`) |
| firmware debug menu + rx-guard sentinel after alloc | free same-size chunk first so OOB hits live cache (`cards/ptitctf2026_wellness_ring.yaml`) |

## Solved cards

| ID | Category | Challenge | Card |
|---|---|---|---|
| htb_tryout_satellite_hijack | rev/runtime-unpack-memfrob | Satellite Hijack | `cards/htb_tryout_satellite_hijack.yaml` |
| htb_tryout_jailbreak | web/xxe | Jailbreak | `cards/htb_tryout_jailbreak.yaml` |
| htb_tryout_omniwatch | web/cache-poison-chain | OmniWatch | `cards/htb_tryout_omniwatch.yaml` |
| l3akctf_babylcg | crypto/lcg | BabyLCG | `cards/l3akctf_babylcg.yaml` |
| l3akctf_rsa_eclipse | crypto/rsa-near-2^n | RSA Eclipse | `cards/l3akctf_rsa_eclipse.yaml` |
| l3akctf_immiscible | crypto/oil-and-vinegar | Immiscible | `cards/l3akctf_immiscible.yaml` |
| l3akctf_rudcalc | pwn/bignum-canary-leak | Rudimentary Calculator | `cards/l3akctf_rudcalc.yaml` |
| l3akctf_me_fr | misc/keyboard-shift | me fr | `cards/l3akctf_me_fr.yaml` |
| l3akctf_getflag | web/csrf-method-override | Get The Flag | `cards/l3akctf_getflag.yaml` |
| l3akctf_you_scanned_what | forensics/computed-tomography | You Scanned WHAT?!? | `cards/l3akctf_you_scanned_what.yaml` |
| l3akctf_l3ak_apt | forensics/windows-thumbnail-cache | L3ak APT | `cards/l3akctf_l3ak_apt.yaml` |
| l3akctf_you_scanned_how | forensics/multislice-tomography | You Scanned HOW?!?! | `cards/l3akctf_you_scanned_how.yaml` |
| l3akctf_blunder | misc/chess-coordinate-glyphs | Blunder | `cards/l3akctf_blunder.yaml` |
| l3akctf_spectre | hardware/signal-image | Spectre | `cards/l3akctf_spectre.yaml` |
| bushbash_xored | crypto/xor | xored | `cards/bushbash_xored.yaml` |
| bushbash_strawberries | crypto/cbc | strawberries | `cards/bushbash_strawberries.yaml` |
| bushbash_langlerangle | reverse/template-z3 | langlerangle #1 | `cards/bushbash_langlerangle.yaml` |
| bushbash_langlerangle2 | reverse/template-feistel | langlerangle #2 | `cards/bushbash_langlerangle2.yaml` |
| bushbash_turned_around | reverse/esolang | Turned Around | `cards/bushbash_turned_around.yaml` |
| bushbash_cachebrowns | pwn/java-cache | cachebrowns | `cards/bushbash_cachebrowns.yaml` |
| bushbash_vault1 | reverse/strings | Hack The Vault I | `cards/bushbash_vault1.yaml` |
| bushbash_vault3 | reverse/heap-size-confusion | Hack The Vault III | `cards/bushbash_vault3.yaml` |
| bushbash_the_eye | osint/astronomy-image | The Eye | `cards/bushbash_the_eye.yaml` |
| bushbash_mystery_server_1 | reverse/protobuf-network | mystery server I | `cards/bushbash_mystery_server_1.yaml` |
| bushbash_mystery_server_2 | reverse/protobuf-overflow | mystery server II | `cards/bushbash_mystery_server_2.yaml` |
| bushbash_old_website | web/Next.js advisory | Old website | `cards/bushbash_old_website.yaml` |
| bushbash_matrix_secrets | misc/embedding-LoRA | matrix_secrets | `cards/bushbash_matrix_secrets.yaml` |
| lit2026_any_secrets | crypto/caesar | any_secrets_could_instantly_be_imparted | `cards/lit2026_any_secrets.yaml` |
| lit2026_double_disguise | crypto/encoding-xor | double_disguise | `cards/lit2026_double_disguise.yaml` |
| lit2026_faulty_image_1 | crypto/png-repair | faulty_image_1_haha | `cards/lit2026_faulty_image_1.yaml` |
| lit2026_faulty_image_2 | crypto/png-hidden-chunk-xor | faulty_image_2 | `cards/lit2026_faulty_image_2.yaml` |
| lit2026_faulty_image_3 | crypto/png-border-color-stego | faulty_image_3 (decoy + R-channel border stego) | `cards/lit2026_faulty_image_3.yaml` |
| lit2026_carnival_game | crypto/prng-time-seed | carnival_game (exploit verified; flag remote) | `cards/lit2026_carnival_game.yaml` |
| kalictf26_warmy | pwn/ret2win-gets | Warmy | `cards/kalictf26_warmy.yaml` |
| kalictf26_unbroken_shelf | osint/historic-newspaper | The Unbroken Shelf | `cards/kalictf26_unbroken_shelf.yaml` |
| ptitctf2026_palworld_mod | web/pathlib-codec-rce | Palworld Mod | `cards/ptitctf2026_palworld_mod.yaml` |

## KaliCTF2026 â€” Kali Team CTF 26 (2026-08-05, active)

Writeup root: `D:\download\CTFTimeWriteup\KaliCTF2026\`  
Flag format: `KaliTeam{...}`  
CTFtime: https://ctftime.org/event/3328

| ID | Category | Challenge | Status |
|---|---|---|---|
| kalictf26_unbroken_shelf | osint/historic-newspaper | The Unbroken Shelf | `cards/kalictf26_unbroken_shelf.yaml` |
| kalictf26_geoosint | osint/geolocation | GeoOSINT | `[ ] unsolved` |
| kalictf26_leaky | pwn/fmt-leak-ret2libc | Leaky | `cards/kalictf26_leaky.yaml` |
| kalictf26_warmy | pwn/ret2win-gets | Warmy | `cards/kalictf26_warmy.yaml` |
| kalictf26_rayray | pwn/glibc-srand-time | rayray | `cards/kalictf26_rayray.yaml` |
| kalictf26_fault_cartography | rev | Fault Cartography | `cards/fault-cartography.yaml` |
| kalictf26_mrbeast | rev/windows-pe | MrBeast | `[ ] unsolved` |
| kalictf26_robots | web/user-agent-spoofing | Robots | `cards/kalictf26_robots.yaml` |
| kalictf26_lockout | web | Lock Out | `cards/kalictf26_lockout.yaml` |
| kalictf26_blackarchive | web | Black Archive | `[ ] unsolved` |
| kalictf26_last_scheduler | forensics/core-dump | The Last Scheduler | `[ ] unsolved` |
| kalictf26_2sus | misc | 2sus | `[ ] unsolved` |
| kalictf26_content | misc | content | `[ ] unsolved` |
| kalictf26_deadair | misc/stego | deadair | `[ ] unsolved` |
| kalictf26_evidence | misc/forensics | evidence | `[ ] unsolved` |
| kalictf26_paper | misc | paper | `[ ] unsolved` |
| kalictf26_signal_037 | misc/rf | signal_037 | `[ ] unsolved` |

## PTITCTF2026

Writeup root: `D:\download\CTFTimeWriteup\PTITCTF2026\`  
Flag format: `PTITCTF{...}`

| ID | Category | Challenge | Status |
|---|---|---|---|
| ptitctf2026_signaling | crypto/semaphore | Signaling | paused — clean 47-symbol ordered semaphore ciphertext recovered; outer 42-symbol transform unresolved — `cards/ptitctf2026_signaling.yaml` |
| ptitctf2026_pablo_escobar | reverse/osint | Pablo Escobar | paused — `cards/ptitctf2026_pablo_escobar.yaml` ; resume `notes/SESSION.md` |
| ptitctf2026_ghostvm | reverse/stacked-vm-feistel | GhostVM | solved — `cards/ptitctf2026_ghostvm.yaml` |
| ptitctf2026_mmo | reverse/nuitka-onefile | MMO | solved — `cards/ptitctf2026_mmo.yaml` |
| ptitctf2026_phonefarm | reverse/android-native-key | PhoneFarm | solved — `cards/ptitctf2026_phonefarm.yaml` |
| ptitctf2026_nhh | crypto/howgrave-graham | That Should Be nhh | solved — `cards/ptitctf2026_nhh.yaml` |
| ptitctf2026_winux | reverse/per-char-sha256 | Winux | solved — `cards/ptitctf2026_winux.yaml` |
| ptitctf2026_son_tung_mtp | forensics/audio-spectrogram | Sơn Tùng M-TP | `[ ] unsolved` — spectrogram is decoy `n1c3_try...`; `cards/ptitctf2026_son_tung_mtp.yaml` |
| ptitctf2026_baby_heap_v2 | pwn/tcache-apple2 | baby-heap-V2 | solved — smash stderr not stdout; `cards/ptitctf2026_baby_heap_v2.yaml` |
| ptitctf2026_wellness_ring | pwn/oob-fsop | The Wellness Ring Bypass | solved — free cache before context to skip rx-guard; `cards/ptitctf2026_wellness_ring.yaml` |
| ptitctf2026_anhcd | forensics/image-steganography | anhcd | needs verification — LSB decoy plus FFT candidate; no third carrier found; `cards/ptitctf2026_anhcd.yaml` |
| ptitctf2026_stranger_papers | crypto/monoalphabetic-substitution | Stranger Papers | solved — plaintext is VIETNAMESE (22-glyph fold cipher); describes Văn Miếu–Quốc Tử Giám → flag = coordinates; `cards/ptitctf2026_stranger_papers.yaml` |

## Paused / needs verification

| ID | Status / next evidence |
|---|---|
| l3akctf_lattiavm | `paused` (~90%); stack-VM escape SOLVED except final write. Inflation done (22B, sp->264 via sp-field self-overwrite with arithmetic-built filler 263), LEAK WORKS ON LIVE INSTANCE (return=libc, R=0x29f75). Offsets ready (system 0x54790, pop_rdi 0x2a9b7, binsh 0x1aaea4). Write primitive verified in sim (SWAP1/build_const(delta)/ADD/SWAP1). Finish: one_gadget (single delta write) via Kali one_gadget tool, or 3-qword ROP construction |
| l3akctf_po1337nomial_revenge | `paused`; MT19937 recovery â€” revenge redacts y (confirmed live), only leak is option-1 shuffled multiset; needs MT-state-from-unordered-multiset cryptanalysis; repo's old solve.py is for the non-revenge version |
| l3akctf_babyrf | `paused`; 4/6 parts recovered (Morse R3QU1RES, Pr0c3ss1ng, 3851642, 31337); 2 parts in speech need ASR/listening (no ffmpeg/whisper offline) |
| l3akctf_transrenov | `needs_verification`; jump-list forensics, 6/7 service answers accepted; Q7 'original name' = SoulSearch (forensic) rejected by grader â€” confirm expected string |
| bushbash_bliss_i | `needs_verification`; CSS/media result belongs to a chained challenge; require independent Bliss I decode/acceptance |
| bushbash_hashing | paused MD5-leak investigation |
| lit2026_faulty_image_4 | `paused`; corrupt4.png 500x200 noise + decoy `LITCTF{fau1ty_I0uR_12ox!}` (fake). Valid PNG, no tEXt/trailing. Smooth correlated noise (not shuffled). Filter bytes only {1,2} (200) but decode to garbage / no LITCTF bit-pattern. Ruled out: 24 bit-planes, zsteg-style LSB, block-avg LSB, channel XOR/diff/compare, FFT, high-pass/equalize, no-filter, extremes/invariants. Next: bit-split across R+G+B per pixel, XOR filter-25B with candidate keys, PRNG-noise seed brute, real zsteg. Notes: LIT2026/crypto/faulty_image_4/solve/notes.md |
| lit2026_extremely_original | `paused`; ct `oyO+UrMXccyqeo2W+WA5jZPVXNSAyYVwGt` = Base64â†’25 binary bytes; known-plaintext XOR gives keystream `ef6aea11e751` (>127 â‡’ binary PRNG key). Ruled out: Python random randbytes/getrandbits/randint 0â€“30M, big-endian, numpy, byte-LCG, RC4, shuffle S-box, shuffled/custom b64 alphabet, affine, autokey, unpadded-RSA roots, timestamp 2026 window, hash-of-seed. Next: non-Python PRNG (JS xorshift128+/PHP/Java LCG), repeating randbytes(k), longer crib. Notes: LIT2026/crypto/extremely_original/solve/notes.md |
| jailctf_jq | paused |
| ptitctf2026_pablo_escobar | `paused`; reverse+inbox done; flag = last location (img4 OSINT or admin img3); do not guess Man Xa/Ikoyi. Notes: `CTFTimeWriteup/PTITCTF2026/Reverse/Pablo Escobar/notes/SESSION.md` |

Flags and full challenge details live in cards/reports, not this always-loaded index. This reduces context size and prevents copied flags from being mistaken for current evidence.
- [LIT2026 binary_exploitation](../OUTPUT/lit2026_binary_exploitation/report.md): Cartesian tree reconstruction from shape and values.
- [LIT2026 cellular_automaton](../OUTPUT/lit2026_cellular_automaton/report.md): Solved Cellular Automaton Rule 90 over GF(2) with null space search.
- [LIT2026 pathfinder](../OUTPUT/lit2026_pathfinder/report.md): Solved parenthesis unranking algorithm DP.
- [LIT2026 key](../OUTPUT/lit2026_key/report.md): Solved ret2win with stack alignment.
- [LIT2026 librarian](../OUTPUT/lit2026_librarian/report.md): Solved ret2libc with BSS RBP pivoting.
- [LIT2026 greeter](../OUTPUT/lit2026_greeter/report.md): Solved using unintended buffer overflow.
- [LIT2026 secrets](../OUTPUT/lit2026_secrets/report.md): Solved using format string to leak flag from stack.
- [LIT2026 spiderman](../OUTPUT/lit2026_spiderman/report.md): Solved by overwriting a function pointer on the stack.
- [LIT2026 long_division](../OUTPUT/lit2026_long_division/report.md): Solved by causing INT_MIN / -1 exception.
# Knowledge sources index

This is a compact router, not a writeup archive. Open only the linked card/playbook that matches current evidence.

## Signal router

| Signal | Route |
|---|---|
| repeating XOR + known prefix | `PLAYBOOKS/crypto_xor_repeating.md` |
| LCG keystream + known modulus + >=3 outputs | `PLAYBOOKS/crypto_lcg_recover.md` |
| RSA N with long 0xFF/0x00 runs in hex (near power of two primes) | `PLAYBOOKS/crypto_rsa_near_power_of_two.md` |
| MQ system over small field missing oil*oil terms (Oil-and-Vinegar) | `PLAYBOOKS/crypto_oil_and_vinegar_invert.md` |
| near-English text, wrong letters are QWERTY-adjacent | `PLAYBOOKS/misc_keyboard_shift_cipher.md` |
| method-override + verb-gated CSRF/auth check | `PLAYBOOKS/web_csrf_method_override_bypass.md` |
| high-Fs wav, multiple stacked signals / "pieces" | `PLAYBOOKS/rf_multimode_audio_spectrogram.md` |
| WAV + painted spectrogram text (then CW Morse hint) | spectrogram text (cards/kalictf26_call_me.yaml) |
| Windows Jump List *.automaticDestinations-ms / DestList | `PLAYBOOKS/forensics_windows_jumplist.md` |
| AES-CBC structured plaintext without integrity | `PLAYBOOKS/crypto_cbc_bitflip.md` |
| C++ template constraints | `PLAYBOOKS/rev_template_z3.md` |
| type-level key/ciphertext/round loop | `PLAYBOOKS/rev_template_feistel.md` |
| esolang + orientation hint/decoy | `PLAYBOOKS/rev_esolang_orientation.md` |
| password ELF plaintext compare | `PLAYBOOKS/rev_strings_password.md` |
| Java boxed integer identity compare | `PLAYBOOKS/pwn_java_integer_cache.md` |
| login plus offline hash | `PLAYBOOKS/pwn_auth_hash.md` |
| scanf(%s) + length-field print + canary + win() | `PLAYBOOKS/pwn_scanf_null_and_len_leak.md` |
| heap menu UAF + Edit(heap-wide bounds, writes stored size) + largebin->_IO_list_all + House of Apple 2 | `cards/babyheap-v2-revenge.yaml` |
| ELF gets + win symbol, no canary, no PIE | ret2win (cards/kalictf26_warmy.yaml) |
| restricted interpreter with boolean feedback | `PLAYBOOKS/jail_boolean_oracle.md` |
| soft/broken QR or Data Matrix | `PLAYBOOKS/misc_barcode_qr_recovery.md` |
| PNG won't open + repeating marker word at fixed byte spacing | `PLAYBOOKS/crypto_png_inserted_marker_repair.md` |
| image has decoy flag + border pixels a slightly different colour at fixed spacing | read one colour channel (R) of those pixels as ASCII |
| time-seeded random.Random(int(time.time())) + published commitment/first output | `PLAYBOOKS/crypto_prng_time_seed_commitment.md` |
| zip password = sha256(flag) + nested AES zips + reversed-hex flag fragments in sub-challenges | `cards/ptitctf2026_cia_integrity.yaml` |
| DOM/CSS media-query character selection | `PLAYBOOKS/misc_css_media_query_extraction.md` |
| annotated star field and ordered cultural clues | `PLAYBOOKS/osint_annotated_starfield.md` |
| Rust/prost custom TCP with DWARF | `PLAYBOOKS/rev_protobuf_wire_dwarf.md` |
| embedding-only LoRA/tokenizer artifact | `PLAYBOOKS/misc_embedding_lora_extraction.md` |
| angular numeric vectors with detector width changing by angle | `PLAYBOOKS/forensics_variable_width_radon.md` |
| deleted Windows image named by LNK/ActivitiesCache + thumbcache present | `PLAYBOOKS/forensics_windows_thumbcache_recovery.md` |
| many equally spaced slices with the same projection-angle set | `PLAYBOOKS/forensics_multislice_projection_stack.md` |
| distinctive exact software/version or low confidence | `PLAYBOOKS/recon_external_search.md` |
| artificial PGN + one piece traces many adjacent squares | `PLAYBOOKS/misc_chess_coordinate_glyphs.md` |
| wide grayscale spectrogram image + spoken-message hint | `PLAYBOOKS/hardware_spectrogram_image_reconstruction.md` |
| clipping of an old newspaper (headline + body) → identify issue/date/address/time | `PLAYBOOKS/osint_historic_newspaper_fulltext.md` |
| loc.gov / Chronicling America behind Cloudflare "Just a moment" (curl/proxy/curl_cffi 403) | headed Chrome + CDP `fetch()` — see `PLAYBOOKS/osint_historic_newspaper_fulltext.md` |

## Solved cards

| ID | Category | Challenge | Card |
|---|---|---|---|
| l3akctf_babylcg | crypto/lcg | BabyLCG | `cards/l3akctf_babylcg.yaml` |
| l3akctf_rsa_eclipse | crypto/rsa-near-2^n | RSA Eclipse | `cards/l3akctf_rsa_eclipse.yaml` |
| l3akctf_immiscible | crypto/oil-and-vinegar | Immiscible | `cards/l3akctf_immiscible.yaml` |
| l3akctf_rudcalc | pwn/bignum-canary-leak | Rudimentary Calculator | `cards/l3akctf_rudcalc.yaml` |
| l3akctf_me_fr | misc/keyboard-shift | me fr | `cards/l3akctf_me_fr.yaml` |
| l3akctf_getflag | web/csrf-method-override | Get The Flag | `cards/l3akctf_getflag.yaml` |
| l3akctf_you_scanned_what | forensics/computed-tomography | You Scanned WHAT?!? | `cards/l3akctf_you_scanned_what.yaml` |
| l3akctf_l3ak_apt | forensics/windows-thumbnail-cache | L3ak APT | `cards/l3akctf_l3ak_apt.yaml` |
| l3akctf_you_scanned_how | forensics/multislice-tomography | You Scanned HOW?!?! | `cards/l3akctf_you_scanned_how.yaml` |
| l3akctf_blunder | misc/chess-coordinate-glyphs | Blunder | `cards/l3akctf_blunder.yaml` |
| l3akctf_spectre | hardware/signal-image | Spectre | `cards/l3akctf_spectre.yaml` |
| bushbash_xored | crypto/xor | xored | `cards/bushbash_xored.yaml` |
| bushbash_strawberries | crypto/cbc | strawberries | `cards/bushbash_strawberries.yaml` |
| bushbash_langlerangle | reverse/template-z3 | langlerangle #1 | `cards/bushbash_langlerangle.yaml` |
| bushbash_langlerangle2 | reverse/template-feistel | langlerangle #2 | `cards/bushbash_langlerangle2.yaml` |
| bushbash_turned_around | reverse/esolang | Turned Around | `cards/bushbash_turned_around.yaml` |
| bushbash_cachebrowns | pwn/java-cache | cachebrowns | `cards/bushbash_cachebrowns.yaml` |
| bushbash_vault1 | reverse/strings | Hack The Vault I | `cards/bushbash_vault1.yaml` |
| bushbash_vault3 | reverse/heap-size-confusion | Hack The Vault III | `cards/bushbash_vault3.yaml` |
| bushbash_the_eye | osint/astronomy-image | The Eye | `cards/bushbash_the_eye.yaml` |
| bushbash_mystery_server_1 | reverse/protobuf-network | mystery server I | `cards/bushbash_mystery_server_1.yaml` |
| bushbash_mystery_server_2 | reverse/protobuf-overflow | mystery server II | `cards/bushbash_mystery_server_2.yaml` |
| bushbash_old_website | web/Next.js advisory | Old website | `cards/bushbash_old_website.yaml` |
| bushbash_matrix_secrets | misc/embedding-LoRA | matrix_secrets | `cards/bushbash_matrix_secrets.yaml` |
| lit2026_any_secrets | crypto/caesar | any_secrets_could_instantly_be_imparted | `cards/lit2026_any_secrets.yaml` |
| lit2026_double_disguise | crypto/encoding-xor | double_disguise | `cards/lit2026_double_disguise.yaml` |
| lit2026_faulty_image_1 | crypto/png-repair | faulty_image_1_haha | `cards/lit2026_faulty_image_1.yaml` |
| lit2026_faulty_image_2 | crypto/png-hidden-chunk-xor | faulty_image_2 | `cards/lit2026_faulty_image_2.yaml` |
| lit2026_faulty_image_3 | crypto/png-border-color-stego | faulty_image_3 (decoy + R-channel border stego) | `cards/lit2026_faulty_image_3.yaml` |
| lit2026_carnival_game | crypto/prng-time-seed | carnival_game (exploit verified; flag remote) | `cards/lit2026_carnival_game.yaml` |
| kalictf26_warmy | pwn/ret2win-gets | Warmy | `cards/kalictf26_warmy.yaml` |
| kalictf26_unbroken_shelf | osint/historic-newspaper | The Unbroken Shelf | `cards/kalictf26_unbroken_shelf.yaml` |

## KaliCTF2026 â€” Kali Team CTF 26 (2026-08-05, active)

Writeup root: `D:\download\CTFTimeWriteup\KaliCTF2026\`  
Flag format: `KaliTeam{...}`  
CTFtime: https://ctftime.org/event/3328

| ID | Category | Challenge | Status |
|---|---|---|---|
| kalictf26_unbroken_shelf | osint/historic-newspaper | The Unbroken Shelf | `cards/kalictf26_unbroken_shelf.yaml` |
| kalictf26_geoosint | osint/geolocation | GeoOSINT | `[ ] unsolved` |
| kalictf26_leaky | pwn/fmt-leak-ret2libc | Leaky | `cards/kalictf26_leaky.yaml` |
| kalictf26_warmy | pwn/ret2win-gets | Warmy | `cards/kalictf26_warmy.yaml` |
| kalictf26_rayray | pwn/glibc-srand-time | rayray | `cards/kalictf26_rayray.yaml` |
| kalictf26_fault_cartography | rev | Fault Cartography | `cards/fault-cartography.yaml` |
| kalictf26_mrbeast | rev/windows-pe | MrBeast | `[ ] unsolved` |
| kalictf26_robots | web/user-agent-spoofing | Robots | `cards/kalictf26_robots.yaml` |
| kalictf26_lockout | web | Lock Out | `cards/kalictf26_lockout.yaml` |
| kalictf26_blackarchive | web | Black Archive | `[ ] unsolved` |
| kalictf26_last_scheduler | forensics/core-dump | The Last Scheduler | `[ ] unsolved` |
| kalictf26_2sus | misc | 2sus | `[ ] unsolved` |
| kalictf26_content | misc | content | `[ ] unsolved` |
| kalictf26_deadair | misc/stego | deadair | `[ ] unsolved` |
| kalictf26_evidence | misc/forensics | evidence | `[ ] unsolved` |
| kalictf26_paper | misc | paper | `[ ] unsolved` |
| kalictf26_signal_037 | misc/rf | signal_037 | `[ ] unsolved` |

## PTITCTF2026

Writeup root: `D:\download\CTFTimeWriteup\PTITCTF2026\`  
Flag format: `PTITCTF{...}`

| ID | Category | Challenge | Status |
|---|---|---|---|
| ptitctf2026_signaling | crypto | Signaling | paused — `cards/ptitctf2026_signaling.yaml` |
| ptitctf2026_pablo_escobar | reverse/osint | Pablo Escobar | paused — `cards/ptitctf2026_pablo_escobar.yaml` ; resume `notes/SESSION.md` |
| ptitctf2026_ghostvm | reverse/stacked-vm-feistel | GhostVM | solved — `cards/ptitctf2026_ghostvm.yaml` |
| ptitctf2026_mmo | reverse/nuitka-onefile | MMO | solved — `cards/ptitctf2026_mmo.yaml` |
| ptitctf2026_phonefarm | reverse/android-native-key | PhoneFarm | solved — `cards/ptitctf2026_phonefarm.yaml` |
| ptitctf2026_nhh | crypto/howgrave-graham | That Should Be nhh | solved — `cards/ptitctf2026_nhh.yaml` |
| ptitctf2026_winux | reverse/per-char-sha256 | Winux | solved — `cards/ptitctf2026_winux.yaml` |
| ptitctf2026_palworld_mod | web/pathlib-codec-rce | Palworld Mod | solved — `cards/ptitctf2026_palworld_mod.yaml` |
| ptitctf2026_stranger_papers | crypto/monoalphabetic-substitution | Stranger Papers | solved — Vietnamese plaintext (not English); `cards/ptitctf2026_stranger_papers.yaml` |

## Paused / needs verification

| ID | Status / next evidence |
|---|---|
| l3akctf_lattiavm | `paused` (~90%); stack-VM escape SOLVED except final write. Inflation done (22B, sp->264 via sp-field self-overwrite with arithmetic-built filler 263), LEAK WORKS ON LIVE INSTANCE (return=libc, R=0x29f75). Offsets ready (system 0x54790, pop_rdi 0x2a9b7, binsh 0x1aaea4). Write primitive verified in sim (SWAP1/build_const(delta)/ADD/SWAP1). Finish: one_gadget (single delta write) via Kali one_gadget tool, or 3-qword ROP construction |
| l3akctf_po1337nomial_revenge | `paused`; MT19937 recovery â€” revenge redacts y (confirmed live), only leak is option-1 shuffled multiset; needs MT-state-from-unordered-multiset cryptanalysis; repo's old solve.py is for the non-revenge version |
| l3akctf_babyrf | `paused`; 4/6 parts recovered (Morse R3QU1RES, Pr0c3ss1ng, 3851642, 31337); 2 parts in speech need ASR/listening (no ffmpeg/whisper offline) |
| l3akctf_transrenov | `needs_verification`; jump-list forensics, 6/7 service answers accepted; Q7 'original name' = SoulSearch (forensic) rejected by grader â€” confirm expected string |
| bushbash_bliss_i | `needs_verification`; CSS/media result belongs to a chained challenge; require independent Bliss I decode/acceptance |
| bushbash_hashing | paused MD5-leak investigation |
| lit2026_faulty_image_4 | `paused`; corrupt4.png 500x200 noise + decoy `LITCTF{fau1ty_I0uR_12ox!}` (fake). Valid PNG, no tEXt/trailing. Smooth correlated noise (not shuffled). Filter bytes only {1,2} (200) but decode to garbage / no LITCTF bit-pattern. Ruled out: 24 bit-planes, zsteg-style LSB, block-avg LSB, channel XOR/diff/compare, FFT, high-pass/equalize, no-filter, extremes/invariants. Next: bit-split across R+G+B per pixel, XOR filter-25B with candidate keys, PRNG-noise seed brute, real zsteg. Notes: LIT2026/crypto/faulty_image_4/solve/notes.md |
| lit2026_extremely_original | `paused`; ct `oyO+UrMXccyqeo2W+WA5jZPVXNSAyYVwGt` = Base64â†’25 binary bytes; known-plaintext XOR gives keystream `ef6aea11e751` (>127 â‡’ binary PRNG key). Ruled out: Python random randbytes/getrandbits/randint 0â€“30M, big-endian, numpy, byte-LCG, RC4, shuffle S-box, shuffled/custom b64 alphabet, affine, autokey, unpadded-RSA roots, timestamp 2026 window, hash-of-seed. Next: non-Python PRNG (JS xorshift128+/PHP/Java LCG), repeating randbytes(k), longer crib. Notes: LIT2026/crypto/extremely_original/solve/notes.md |
| jailctf_jq | paused |
| ptitctf2026_pablo_escobar | `paused`; reverse+inbox done; flag = last location (img4 OSINT or admin img3); do not guess Man Xa/Ikoyi. Notes: `CTFTimeWriteup/PTITCTF2026/Reverse/Pablo Escobar/notes/SESSION.md` |

Flags and full challenge details live in cards/reports, not this always-loaded index. This reduces context size and prevents copied flags from being mistaken for current evidence.
- [LIT2026 binary_exploitation](../OUTPUT/lit2026_binary_exploitation/report.md): Cartesian tree reconstruction from shape and values.
- [LIT2026 cellular_automaton](../OUTPUT/lit2026_cellular_automaton/report.md): Solved Cellular Automaton Rule 90 over GF(2) with null space search.
- [LIT2026 pathfinder](../OUTPUT/lit2026_pathfinder/report.md): Solved parenthesis unranking algorithm DP.
- [LIT2026 key](../OUTPUT/lit2026_key/report.md): Solved ret2win with stack alignment.
- [LIT2026 librarian](../OUTPUT/lit2026_librarian/report.md): Solved ret2libc with BSS RBP pivoting.
- [LIT2026 greeter](../OUTPUT/lit2026_greeter/report.md): Solved using unintended buffer overflow.
- [LIT2026 secrets](../OUTPUT/lit2026_secrets/report.md): Solved using format string to leak flag from stack.
- [LIT2026 spiderman](../OUTPUT/lit2026_spiderman/report.md): Solved by overwriting a function pointer on the stack.
- [LIT2026 long_division](../OUTPUT/lit2026_long_division/report.md): Solved by causing INT_MIN / -1 exception.
- [LIT2026 git_genug](../OUTPUT/lit2026_git_genug/report.md): Solved using git reflog.
- [LIT2026 be_social](../OUTPUT/lit2026_be_social/report.md): Solved by OSINT on Bluesky.
- [LIT2026 introduction](../OUTPUT/lit2026_introduction/report.md): Solved by ROT13 decoding.
- [LIT2026 kcufniarb](../OUTPUT/lit2026_kcufniarb/report.md): Solved by reversing Brainfuck.
- [Merkle's Trapdoor (Kali Team CTF 26)](cards/39.yaml) - Crypto: Merkle-Hellman knapsack with small block size allowing brute-force.

## External Writeups (L3akCTF2026)

The following external writeups for previously unsolved L3akCTF 2026 challenges have been linked to the local challenge folders:
- **Yet Another Chat** (rev): [Writeup](https://ch3f.dev/post.html?slug=l3ak26)
- **Piet / Piet 2 / Supervisor** (pwn): [Blog Writeup](https://icctx.xyz/blog/l3akctf26/) | [Exploit Code](https://github.com/icctx/ctf/blob/main/l3ak.2026/piet/x)
- **Beginner (Crossroads, Sanity Check)**: [Writeup](https://foudil.fr/blog/posts/l3ak-ctf-2026/)
- **Subleq Scramble** (rev): [Writeup](https://theromanxpl0.it/posts/2026/08/l3akctf-2026-subleq-scramble/)
- **rev_omega** (rev): In-chat payload by zaizr.
- **squid** (web): [Writeup](https://jorianwoltjer.com/blog/p/ctf/l3akctf-2026-squid)
- **zebda** (web): [Notion](https://denim-bosworth-b13.notion.site/Zebda-3afe6e3c12ea80eda405e0a9ddbdaea0)
- **catvault - part 1** (web): [Notion](https://denim-bosworth-b13.notion.site/web-catvault-part-1-3aee6e3c12ea80499d35f61763dca512)
- **Side Channel Surfer / SVG / workerboard** (web): In-chat solves and payload explanations.
- **L3AK Platform Protection** (osint): [Writeup](https://blog.7chn.me/posts/20260804-l3ak-platform-protection)
- **Rails / Chimney / Government Spy / Circular Reasoning** (osint): [Medium](https://medium.com/@King_Night/l3akctf-2026-osint-write-up-d0803b3a4a18)
- **Multiple OSINT Locations** (osint): [Google Docs](https://docs.google.com/document/d/1wCRpuq8_n8RNMBHC1-oSbrB40YUtOW1crsTdQg6dxo4)

## HTB TryOut (static-analysed + solved offline; flags require live instance)
- [HTB TryOut TunnelMadness](cards/htbtryout_tunnelmadness.yaml) - rev: embedded 20^3 maze in .rodata, BFS -> 59-move key.
- [HTB TryOut Regularity](cards/htbtryout_regularity.yaml) - pwn: 272->256 overflow, ret2shellcode via `jmp rsi` on RWE stack.
- [HTB TryOut Abyss](cards/htbtryout_abyss.yaml) - pwn: self-modifying loop-index overflow -> partial ret overwrite (0x4014eb) bypasses logged_in for arbitrary file read.
- [HTB TryOut Router Web](cards/htbtryout_router_web.yaml) - pwn/fw: popen command injection in ping_handler behind admin:router123 + dev_mode gate.
- [HTB TryOut Welcome to CTF](cards/htbtryout_welcome_to_ctf.yaml) - general/sanity: flag printed on the onboarding page (HTB{onboard1ng_fl4g}).
- [HTB TryOut Silicon Data Sleuthing](cards/htbtryout_silicon_data_sleuthing.yaml) - forensics: OpenWrt JFFS2/LZMA overlay extraction feeding an 8-question nc quiz (per-instance flag).
- [HTB TryOut Debug](cards/htbtryout_debug.yaml) - hw: Saleae .sal UART (Async Serial 8N1 @115200) boot-log decode; flag = satellite_network_compromised.
- [HTB TryOut Blessed](cards/htbtryout_blessed.yaml) - crypto(hard): predictable EC-PRNG defeats interactive PoP -> BLS rogue-key on FastAggregateVerify. Chain verified; needs Coppersmith+py_ecc+oracle.

## HTB TryOut — event index
- [HTB TryOut full event index](events/htbtryout.md) — 37 challenges (36 solved) with per-challenge technique; SHOW artifacts in CTFTimeWriteup/HTB-TryOut/.
