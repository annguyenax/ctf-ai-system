# Knowledge sources index

This is a compact router, not a writeup archive. Open only the linked card/playbook that matches current evidence.

## Signal router

| Signal | Route |
|---|---|
| repeating XOR + known prefix | `PLAYBOOKS/crypto_xor_repeating.md` |
| deterministic generated workstation + fixed file-targeting selector + tagged XOR fragments | `cards/bytemectf2026_soul_harvester.yaml` |
| safe-linked tcache leak + adjacent-chunk poisoning + heap-relative hidden flag read | `cards/bytemectf2026_house_of_water.yaml` |
| stale soul alias + safe-linked tcache overlap + PIE leak + BSS gate counters | `cards/bytemectf2026_soul_vault_collector.yaml` |
| bytemectf2026_soul_memory_thanos | pwn/uaf-indirect-callback | Soul // Memory of Thanos | `cards/bytemectf2026_soul_memory_thanos.yaml` |
| OSINT alias chains + timestamp codes + corroborating case shorthand | `cards/bytemectf2026_vormirs_hidden_witness.yaml` |
| OSINT archive label + timestamp-selected mirror records + leetspeak fields | `cards/bytemectf2026_soul_fragment.yaml` |
| photo location + wristwatch time + metadata/scene corroboration | `cards/bytemectf2026_hidden_coordinates.yaml` |
| LCG keystream + known modulus + >=3 outputs | `PLAYBOOKS/crypto_lcg_recover.md` |
| patched kernel random.c -> weak global PRNG + downloadable TLS 1.3 pcap (ServerHello.random leaks RNG; hybrid X25519MLKEM768) | `cards/hackluctf2026_lauschangriff.yaml` |
| 14 live LCG words + mask/rotate/byte-reversal; multilock record KDF unresolved | `cards/bytemectf2026_infinity_vault.yaml` |
| bytemectf2026_infinity_vault | crypto/lcg-derived-multilock | Infinity Vault | `cards/bytemectf2026_infinity_vault.yaml` (needs verification) |
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
| Factorio blueprint entity occupancy XORed with a tile mask yields a QR | `cards/fortidctf2026_tangled.yaml` |
| YAML 1.1 parses an unquoted country code `NO` as boolean false in a blocklist | `cards/fortidctf2026_eu_gift.yaml` |
| deterministic ECDSA nonce over fields + two date code paths ('@' vs createFromFormat) | `cards/fortidctf2026_hacker_cinema.yaml` |
| arena pool + in-arena secret gate + refcounted shared block + bitmap row off-by-one | `cards/fortidctf2026_sticker_booth.yaml` |
| gateway 1-request-per-conn + chunked trailer desync + staff preview SSTI | `cards/fortidctf2026_sticky_headers.yaml` |
| voxel OR-projections + quirc + dual QR M/M.T linear solve | `cards/fortidctf2026_cubism.yaml` |
| game patch + RNG-table LSB + screen-melt side channel via video | `cards/fortidctf2026_rip_and_tear.yaml` |
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
| Sui Move pool with numeric reserves + duplicate check on *direct* market key | reverse-typed fake pool / unbacked LP (`cards/compfest18_compfest_coin.yaml`, `PLAYBOOKS/blockchain_sui_fake_reserve_reverse_market.md`) |
| artificial PGN + one piece traces many adjacent squares | `PLAYBOOKS/misc_chess_coordinate_glyphs.md` |
| wide grayscale spectrogram image + spoken-message hint | `PLAYBOOKS/hardware_spectrogram_image_reconstruction.md` |
| clipping of an old newspaper (headline + body) → identify issue/date/address/time | `PLAYBOOKS/osint_historic_newspaper_fulltext.md` |
| loc.gov / Chronicling America behind Cloudflare "Just a moment" (curl/proxy/curl_cffi 403) | headed Chrome + CDP `fetch()` — see `PLAYBOOKS/osint_historic_newspaper_fulltext.md` |
| Flask endpoint parsing user XML + lxml encoding-declaration error | XXE file read, drop `<?xml?>` (cards/htb_tryout_jailbreak.yaml) |
| user string reflected into generated CSS + server expands `@import url(...)` | CSS @import LFI — absolute path overrides theme root (pathlib), read file reflected in CSS (cards/dctf2026quals_aiscrimination.yaml) |
| daily free-credit claim + shell=True profile sink that runs at order "delivery" | race the claim for credits, then command-injection profile writes flag into served static/ (cards/dctf2026quals_defcamp_supply.yaml) |
| ELF imports memfrob + mmap RWX runtime unpack | XOR-42 decode .text in-file (cards/htb_tryout_satellite_hijack.yaml) |
| checker input[i] XOR key[i] == i, key as movabs constants on stack | recover inner[i]=key[i]^i (cards/htb_tryout_satellite_hijack.yaml) |
| Varnish vcl_hash keyed on one request header + reflected CRLF in backend | cache-poison + in-band exfil (cards/htb_tryout_omniwatch.yaml) |
| stacked SQLi where middleware compares str != bytes | use `'...'` string literal not `0x`-hex (cards/htb_tryout_omniwatch.yaml) |
| PNG unofficial `zIPP` ZIP chunk + trailing "nice try" uuencode | fetch WordPress `name-600x400.jpg` then OSINT named handle (`cards/ptitctf2026ck_accidental.yaml`) |
| lighthouse video, beam toggles 4 diagonal directions / Morse-like ON-OFF flash | beam direction + dwell / Morse signal (cards/ptitctf2026_signaling.yaml, paused) |
| Go WebView2 PE + sidecar config.enc pbkdf2-sha256/AES-GCM | `cards/ptitctf2026_pablo_escobar.yaml` (paused; then OSINT last inbox JPEG) |
| Nuitka onefile + RT_RCDATA/27 `KAY`+zstd | `cards/ptitctf2026_mmo.yaml` |
| PE32+ stacked custom VM + 256-bit Feistel compare | `cards/ptitctf2026_ghostvm.yaml` |
| Android JNI std::string length-5 `hello` license compare | `cards/ptitctf2026_phonefarm.yaml` |
| RSA p = 32-bit-smooth + small s, e≈Kv/u | `cards/ptitctf2026_nhh.yaml` |
| fake Winux distro PE + WUX2 + per-char SHA256 proofs | `cards/ptitctf2026_winux.yaml` |
| heap menu UAF + glibc 2.35 + SIGALRM puts/exit | tcache poison **stderr** House of Apple 2 (`cards/ptitctf2026_baby_heap_v2.yaml`) |
| firmware debug menu + rx-guard sentinel after alloc | free same-size chunk first so OOB hits live cache (`cards/ptitctf2026_wellness_ring.yaml`) |
| degree-n poly over large p, coeffs << p (hash-chained SHA256 / 256-bit), fewer evals than degree | flint/fpylll LLL on affine modular lattice — not sympy (`cards/picoctf2026_mss_advance_revenge.yaml`, `PLAYBOOKS/crypto_small_coeff_poly_lll.md`) |
| Chrome tab manager, RAM counter, DevTools attach/close, gated Diagnostic system() | refund-before-guard + reset flag (`cards/ptitctf2026ck_browser_exploit.yaml`) |
| PostgreSQL stacked SQLi + WAF on COPY / FROM PROGRAM / CREATE TABLE / pg_ | COPY/**/ + FROM/**/PROGRAM + CREATE TEMP TABLE (`cards/ptitctf2026ck_megalovania.yaml`) |
| Varnish ESI only on /preview + stored bio HTML + meta CSP nonce + disk-cache nonce reuse via history recache | `cards/securinetsquals2026_nyoom.yaml` |
| hidden affine map sampled in two tables + one 8-bit readout + no division opcode | `cards/securinetsquals2026_old_calculator.yaml` |
| two-slot heap UAF, glibc claims tcache but small free hits a smallbin, GNU_RELRO without BIND_NOW, libc IBT note | House of Apple 2 via setcontext's endbr, not setcontext+4 (`cards/securinetsquals2026_house_of_ekko.yaml`) |
| BLE capture frames.hex + Legacy Pairing PIN crack + AES-CCM LTK recovery | `cards/securinetsquals2026_a_whisper_in_the_air.yaml` |
| Vulkan GPU dropper + SPIR-V XTEA-CTR + static ELF ChaCha20/AVX2 reverse | `cards/securinetsquals2026_revenant.yaml` |
| unchecked P-256 scalar mult of a PRF salt, SHA256 of x only, baseURL prototype pollution | invalid-curve CRT then AES-256-ECB (`cards/securinetsquals2026_misdirection_part_2.yaml`) |

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
| bytemectf2026_forgotten_guardian | osint/archive-id-cross-reference | The Forgotten Guardian | `cards/bytemectf2026_forgotten_guardian.yaml` |
| bytemectf2026_sacrifice | forensics/network-pcap | Sacrifice | `cards/bytemectf2026_sacrifice.yaml` |
| bytemectf2026_return_to_win | pwn/ret2win-gets | Return to Win | `cards/bytemectf2026_return_to_win.yaml` |
| bytemectf2026_souls_weakness | pwn/ret2win | Soul's Weakness | `cards/bytemectf2026_souls_weakness.yaml` |
| bytemectf2026_house_of_water | pwn/heap-tcache-poison | House of Water | `cards/bytemectf2026_house_of_water.yaml` |
| bytemectf2026_soul_vault_collector | pwn/uaf-safe-linking-tcache-overlap | Soul Vault: The Collector | `cards/bytemectf2026_soul_vault_collector.yaml` |
| bytemectf2026_soul_harvester | misc/static-malware-analysis | SOUL STONE — THE SOUL HARVESTER | `cards/bytemectf2026_soul_harvester.yaml` |
| bytemectf2026_vormirs_hidden_witness | osint/alias-cross-reference | Vormir's Hidden Witness | `cards/bytemectf2026_vormirs_hidden_witness.yaml` |
| bytemectf2026_soul_fragment | osint/archive-cross-reference | Soul Fragment | `cards/bytemectf2026_soul_fragment.yaml` |
| bytemectf2026_hidden_coordinates | osint/photo-geolocation-time | The Hidden Coordinates | `cards/bytemectf2026_hidden_coordinates.yaml` (needs verification) |
| ptitctf2026_palworld_mod | web/pathlib-codec-rce | Palworld Mod | `cards/ptitctf2026_palworld_mod.yaml` |
| picoctf2026_mss_advance_revenge | crypto/small-coeff-poly-lll | MSS_ADVANCE Revenge | `cards/picoctf2026_mss_advance_revenge.yaml` |
| securinetsquals2026_bitflip | pwn/srop-bitflip | bitflip | `cards/securinetsquals2026_bitflip.yaml` |
| securinetsquals2026_a_whisper_in_the_air | hardware/ble-crackle-ltk | A Whisper in the Air | `cards/securinetsquals2026_a_whisper_in_the_air.yaml` |
| securinetsquals2026_revenant | reverse/vulkan-spirv-chacha-avx2 | revenant | `cards/securinetsquals2026_revenant.yaml` |
| securinetsquals2026_nyoom | web/esi-csp-nonce-disk-cache | nyoom | `cards/securinetsquals2026_nyoom.yaml` |
| securinetsquals2026_old_calculator | crypto/hidden-affine-arithmetic-oracle | Old Calculator | `cards/securinetsquals2026_old_calculator.yaml` |
| securinetsquals2026_house_of_ekko | pwn/fsop-setcontext-ibt | House of ekko | `cards/securinetsquals2026_house_of_ekko.yaml` |
| securinetsquals2026_misdirection_part_2 | crypto/invalid-curve-prf-oracle | Misdirection: Part 2 | `cards/securinetsquals2026_misdirection_part_2.yaml` |

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

## PTITCTF2026-CK (Chung kết / Jeopardy)

Writeup root: `D:\download\CTFTimeWriteup\PTITCTF2026-CK\`  
Flag format: `PTITCTF{...}`

| ID | Category | Challenge | Status |
|---|---|---|---|
| ptitctf2026ck_shopbroken_cdn | crypto/cbc-bitflip | ShopBroken CDN | needs_verification — exploit verified offline (guest→admin); flag on live `/admin` — `cards/ptitctf2026ck_shopbroken_cdn.yaml` |
| ptitctf2026ck_accidental | forensics/png-trailing-uuencode-osint | Accidental | needs_verification — uuencode URL + LuongVD = Vũ Đức Lương; wrap `PTITCTF{Vu_Duc_Luong}` unconfirmed — `cards/ptitctf2026ck_accidental.yaml` |
| ptitctf2026ck_stranger_papers_revenge | crypto/acrostic+mod-wheel-base64 | Stranger Papers Revenge | solved — cover acrostic spells `UPSIDE` (six-letter filing word); ledgers = n mod 67 → base64 catalog — `cards/ptitctf2026ck_stranger_papers_revenge.yaml` |
| ptitctf2026ck_browser_exploit | pwn/logic-ram-accounting | Browser Exploit | solved — Close refunds RAM before DevTools check; farm 1024 → system() — `cards/ptitctf2026ck_browser_exploit.yaml` |
| ptitctf2026ck_megalovania | web/sqli-postgres-copy-program | MEGALOVANIA | solved — CREATE TEMP TABLE + COPY/**/ FROM/**/PROGRAM cat /flag.txt — `cards/ptitctf2026ck_megalovania.yaml` |

## Paused / needs verification

- [Infinity Echo (ByteMeCTF2026)](cards/bytemectf2026_infinity_echo.yaml) ? current versioned signatures and recovered key verify independently; old r mismatch was from superseded files; vault cipher/KDF/layout still unknown; no flag.

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
| ELF gets + win symbol, no canary, no PIE | `PLAYBOOKS/pwn_ret2win_gets.md` |
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
| Sui Move pool with numeric reserves + duplicate check on *direct* market key | reverse-typed fake pool / unbacked LP (`cards/compfest18_compfest_coin.yaml`, `PLAYBOOKS/blockchain_sui_fake_reserve_reverse_market.md`) |
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

## picoCTF2026
- [paper-2](cards/picoctf2026_paper2.yaml) — Web/browser: XML/XSLT `document('/secret')` leaks the bot cookie into a PDF URL fragment; PDF AcroForm JavaScript exfiltrates the fragment, then `/flag` redeems it.
- [Pizza Router](cards/picoctf2026_pizza_router.yaml) — Pwn/heap: replay/receipt leak PIE and heap, then signed OOB reroute writes global state and partially overwrites a heap callback to `win()`.
- [JITFP](cards/picoctf2026_jitfp.yaml) — Reverse: host `jitfp-service.py` JIT-rewrites checker function pointers during `sleep(1)`; recover each byte from the live `cmp` immediate.

## DefCamp CTF 2026 Quals
- [hollowdex](cards/dctf2026quals_hollowdex.yaml) — Reverse/Android: JNI_OnLoad XOR-hollows `verifyFlag`; invert 3-round u64 ARX; portal `CTF{sha256(ascii hex)}`.
- [ratatouille](cards/dctf2026quals_ratatouille.yaml) — Reverse: FNV-1a of hardcoded telemetry seeds xorshift64* over ELF `.recipe`; do not run the binary.
- [aiscrimination](cards/dctf2026quals_aiscrimination.yaml) — Web: CSS `@import url("/abs")` in the inclusion statement expands into a local file read (`(THEME_ROOT/req).resolve()` with no containment check); read `/home/ctf/flag.txt`.
- [defcamp-supply](cards/dctf2026quals_defcamp_supply.yaml) — Web: race `/redeem` daily claim for credits; premium item's `profile` is a `shell=True` command injection that runs at order delivery (~30-37 min ETA); write flag into `static/` to read it past the 30-min session.

## FortID CTF 2026
- [Baby Misc](cards/fortidctf2026_baby_misc.yaml) — Intro/misc: decode decimal ASCII path components, then select the unique PNG core image among 7,000 entries; artifact verified, not submitted.

- [Baby OSINT](cards/fortidctf2026_baby_osint.yaml) — Intro/OSINT: needs verification; previous composite rejected. Event/festival corroborated; correcting a truncated station-list audit.
- [Flag from the Past](cards/fortidctf2026_flag_from_the_past.yaml) — OSINT: follow the prior-year FortID OSINT Exam link to its official solution and extract the published historic flag; locally verified from source, not submitted.
- [Baby Web](cards/fortidctf2026_baby_web.yaml) — Intro/web: inspect the click handler, join all fragments, reverse the combined string, then Base64-decode; scoreboard confirmed.
- [Baby Rev](cards/fortidctf2026_baby_rev.yaml) — Intro/reverse: reverse T9 touch-tone sequence; SHA-256 resolves ambiguous word mappings; scoreboard confirmed.
- [Baby Crypto](cards/fortidctf2026_baby_crypto.yaml) — Intro/crypto: plaintext-derived AES-CTR nonce repeats the keystream under chosen plaintext; scoreboard confirmed solved.
- [Bounty Hunter](cards/fortidctf2026_bounty_hunter.yaml) — Crypto: verifier omits the algebraic link between consecutive folded polynomials; proof forges payout authorization; scoreboard confirmed solved.
- [Hic Sunt Dracones](cards/fortidctf2026_hic_sunt_dracones.yaml) — Crypto: persistent dragon-curve heading leaks per-point translations; recover Koblitz points and verify the curve prime and encoder selections; scoreboard confirmed solved.
- [Fortune Teller](cards/fortidctf2026_fortune_teller.yaml) — Pwn: format-string leak and `%n` write set the global blessing gate; scoreboard confirmed solved.
- [Meteor Shower](cards/fortidctf2026_meteor_shower.yaml) — Reverse: derive the 95-bit A/B verifier stream, decode 19 Baconian letters, and recover SCIENTIA POTENTIA EST; scoreboard confirmed solved.
- [Ultimative PHP](cards/fortidctf2026_ultimative_php.yaml) — Web: chain PHP key normalization, array coercion, magic hashes, and `strpos`-at-zero deserialization LFI; platform accepted.
- [Tangled](cards/fortidctf2026_tangled.yaml) — Misc: XOR Factorio entity occupancy with a landfill tile mask to recover a QR clue; two decoders agree, but both tested flag candidates were rejected, so no flag is verified.
- [Rip & Tear](cards/fortidctf2026_rip_tear.yaml) — Misc: three source-driven Doom melt fits recover 255/256 flag bits; final bit is erased by the `y=-15` reflection and remains unverified.
- [Checksum](cards/fortidctf2026_checksum.yaml) — Reverse: hidden call graph folds 4,818 XOR bytes to `0x39`; trace verified, flag not recovered.
- [EU Gift](cards/fortidctf2026_eu_gift.yaml) — Misc: PyYAML parses bare `NO` as boolean false, allowing the valid string country code through; verifier result image recovered, not submitted.
- [Hacker Cinema](cards/fortidctf2026_hacker_cinema.yaml) — Crypto: PHP 8.4.16 year-0 `@`-constructor partition day spans two `createFromFormat` days; same nonce, two messages; repeated-nonce ECDSA key recovery forges the winner ticket; platform accepted.
- [Sticker Booth](cards/fortidctf2026_sticker_booth.yaml) — Pwn: mono render off-by-one zeroes next pool block header; refcount UAF leaks the builtin ticket; forged builtin dumps flag.txt; platform accepted.
- [End of Life](cards/fortidctf2026_end_of_life.yaml) — Pwn: DOS text-mode Ctrl-Z validation bypass plus binary-mode unbounded stack write; DOS INT 21h file copy returned the flag and the portal accepted it. The payload bytes were not preserved.
- [Sticky Headers](cards/fortidctf2026_sticky_headers.yaml) — Web: chunked-trailer request smuggling (2-byte swallow) bypasses gateway ACL; staff preview Jinja2 SSTI reads recipe.txt; platform accepted.
- [Cubism](cards/fortidctf2026_cubism.yaml) — Reverse: quirc reads fliplr as transpose; build M and M.T both-QR via GF(2) Gaussian on RS parity; MILP cube; platform accepted.
- [Rip & Tear](cards/fortidctf2026_rip_and_tear.yaml) — Misc: doom rndtable LSB backdoor; melt-wipe mod-3 leak; 3-wipe Viterbi 480/480; platform accepted.
- [Flag from the Future](cards/fortidctf2026_flag_from_the_future.yaml) — Misc: invert Game-of-Life text renderer; exact grid + font model + N=18; browser 1/64-px advance quantization (617/64) is the key; beam decode; platform accepted.

## COMPFEST 18 (2026)
- [BurhanGuild Loader Incident](cards/compfest18_burhanguild_loader_incident.yaml) — Forensics: Memory capture triage (BGMR v3), memfd shared object carving, custom KDF + XTEA-CTR decryption of embedded JSON C2 config, and closure contract proof token generation.
- [Compfest Coin](cards/compfest18_compfest_coin.yaml) — Blockchain/Sui: reverse-typed fake-reserve pool + unbacked LP shares drain an accounting vault; live `setup::solve` then launcher `GET /flag`.

## Securinets CTF Quals 2026
- [bitflip](cards/securinetsquals2026_bitflip.yaml) — Pwn: 1-bit flip modifies `rt_sigprocmask` (0xe) to `rt_sigreturn` (0xf) inside `checkpoint`, enabling chained SROP under seccomp.
- [A Whisper in the Air](cards/securinetsquals2026_a_whisper_in_the_air.yaml) — Hardware/BLE: Crack legacy 6-digit PIN (483209), decrypt STK link to extract LTK, decrypt reconnected keyboard HID notifications, decode base64 keystrokes.
- [revenant](cards/securinetsquals2026_revenant.yaml) — Reverse: Extract SPIR-V compute shader, emulate XTEA-CTR decryption, bypass anti-debug and dead traps, invert S-box/vector-shuffle/rol8 cipher with probe-derived ChaCha keystream.
- [nyoom](cards/securinetsquals2026_nyoom.yaml) — Web: CSS trigram leak of a meta CSP nonce, disk-cache reuse after recaching /profile, srcdoc XSS, Varnish ESI on POST /preview reads the admin session cookie.
- [Old Calculator](cards/securinetsquals2026_old_calculator.yaml) — Crypto: hidden affine F(t)=a*t+b sampled in two tables; Newton-divide weighted deltas; pack a+b/256 into the one 8-bit readout; 16 rounds.
- [House of ekko](cards/securinetsquals2026_house_of_ekko.yaml) — Pwn: tcache off, Partial RELRO, smallbin overlap onto last_remainder, FSOP through setcontext at its endbr. setcontext+4 dies under IBT. Portal accepted.
- [Misdirection: Part 2](cards/securinetsquals2026_misdirection_part_2.yaml) — Crypto: invalid-curve oracle through forgePrf, CRT on SHA256(x), AES-256-ECB under SHA256 of the hex scalar. Portal accepted.








- [SecurinetsQuals2026 Silent Tone](cards/securinetsquals2026_silent_tone.yaml) — native SAL chunk pyramids; overlapping QPSK, ZC ambiguity, repeated-packet SIC and CRC-gated soft RS.
- [SecurinetsQuals2026 Encrypt](cards/securinetsquals2026_encrypt.yaml) — packed Rust encryptor; emulate own routine as key oracle, invert AES-like/bignum/generated-code stages, brute force ms seed.

- [Coil Toss](cards/rstconctf2026_coil_toss.yaml) — solved; Modbus FC06 single-register writes.

- [Setpoint](cards/rstconctf2026_setpoint.yaml) — solved; Modbus FC16 multi-register write.

- [Layered Catch](cards/rstconctf2026_layered_catch.yaml) — solved; PNG text passphrase and trailing encrypted ZIP.

- [Low Bit Levee](cards/rstconctf2026_low_bit_levee.yaml) — solved; RGB least significant bits with length prefix.

- [Life Savings](cards/rstconctf2026_life_savings.yaml) — solved; PNG dimension recovery and CRC reconstruction.

- `rstconctf2026_life_is_a_highway` | forensics/Toyota CAN route recovery | Life is a Highway | needs_verification: decoded wheel speed, yaw, steering, and stationary yaw bias; dead-reckoning drift remains too large to identify/submit origin; evidence in `CTFTimeWriteup/RSTCONCTF2026/Forensics/Life is a Highway/solve/evidence/`.

- hitconctf2026_litter | forensics/audio-guided-file-recovery | litter | needs_verification; audio-carried password and LITTER/5 decryption remain unresolved.

- stconctf2026_modbus_mastermind | misc/Modbus-TCP challenge | Modbus Mastermind | needs_verification: mirrors differ; mirror 2 has a repeated complement pattern; one candidate rejected; no flag verified. Evidence in CTFTimeWriteup/RSTCONCTF2026/Misc/Modbus Mastermind/solve/evidence/.

- [n07_05h4_c3r71f13d](cards/rstconctf2026_n07_05h4_c3r71f13d.yaml) — solved; ladder truth tables via simulator API, letters reordered by slot to SAFETY.

| RSC Server Action accepts crafted Flight multipart and executes thenable gadget | cards/rstconctf2026_dow_is_up_50k.yaml |

| Projective octonion product + all generators present + AES-CTR key from shuffled indices | cards/hitcon2026_oct.yaml |
hitcon2026_my_iot_homework:
  input_sha256: e0b330b2a3740d635fdc46b13c055a246b7b5af7a9b3f0a84d7a7d136ffc1267
  accepted_payload: "11 45 14 19 19 81 00"
  route: pwn/nrf51-dfu-gpio
  card: cards/hitcon2026_my_iot_homework.yaml
  status: live flag recovered; scoreboard unconfirmed (Cloudflare 403)

## Backfill 2026-11-04

Event digests: `KNOWLEDGE/events/<Event>.md`. Playbook candidates: `KNOWLEDGE/playbook_candidates_2026-11.md`. Writeup cua 15 giai da xoa: `OUTPUT/_archive/<Event>/` (chi text, khong co binary/file de).

| Signal | Route |
|---|---|
| Recover the support-point sign ambiguity with a linear nullspace attack using the dual-code orthogonality of G | `cards/07ctf2026_herbarium.yaml` (solved) |
| Recognize that a 22-char filename token embedded in an equirectangular-panorama viewer is a Google Street View | `cards/07ctf2026_speed_limit.yaml` (solved) |
| When two RSA moduli are given together, always try gcd(n1, n2) first; a non-trivial result fully factors both  | `cards/bytemectf2026_double_trouble.yaml` (solved) |
| Compute T1 XOR T2 to get P1 XOR P2 (keystream cancels). Crib-drag a guessed/known phrase (flag prefix "OWASP{" | `cards/bytemectf2026_soul_forge.yaml` (solved) |
| When LSB extraction from an image yields text instead of an immediate flag, don't stop at the raw bytes — spli | `cards/bytemectf2026_soul_in_the_shadows.yaml` (solved) |
| If LSB extraction produces a string that doesn't itself match the flag format but looks base64-like (padding,  | `cards/bytemectf2026_the_last_soul.yaml` (solved) |
| Common-modulus attack. Use the Extended Euclidean Algorithm to find integers s1, s2 with s1*e1 + s2*e2 = 1 (Be | `cards/bytemectf2026_vormir_common_modulus.yaml` (solved) |
| Treat the given link as the start of a trail, not the destination. Crawl every linked page on the site; each p | `cards/bytemectf2026_vormir_ledger.yaml` (solved) |
| This is Wiener's small-private-exponent attack generalized to a quotient-ring RSA variant: because e = inverse | `cards/compfest18ctf2026_hello.yaml` (solved) |
| Classic UAF + double-free primitive is clearly present (free without nulling pointer/size, then unchecked writ | `cards/compfest18ctf2026_mirai_nikki.yaml` (paused) |
| The vault's funding ETH is credited internally to the deployer (Setup) rather than the player, because the con | `cards/compfest18ctf2026_phantom_ledger.yaml` (solved) |
| An unbounded array index/range parsed from an untrusted 'CLUSTER NODES' response line in redis-cli's clusterMa | `cards/compfest18ctf2026_redis_cli_0day.yaml` (paused) |
| Full exfil chain recovered deterministically (ICMP marker-stripped reassembly -> MiniDump parse -> PEB service | `cards/compfest18ctf2026_save_the_water.yaml` (needs_verification) |
| The flag is never embedded in the binary at all -- the binary's only job is to validate itself against a hard- | `cards/compfest18ctf2026_the_last_bitbender.yaml` (solved) |
| A binary that mprotects a code region RWX right before calling it is almost always decrypting/unpacking itself | `cards/csawctf2026quals_autobahn.yaml` (solved) |
| This challenge's flag format (csaw{C2INDICATOR_SERVICENAME_BACKDOORNAME}) requires exactly 3 components pulled | `cards/csawctf2026quals_breach_zero_day.yaml` (paused) |
| When an unlock/authorization endpoint accepts a structured, client-supplied state blob (versioned JSON, base64 | `cards/csawctf2026quals_csale.yaml` (paused) |
| When a UNION-based SQLi can only return a fixed number of text columns, use group_concat() with a row/field se | `cards/csawctf2026quals_csale_revenge.yaml` (needs_verification) |
| No PIE / no canary / partial RELRO binary with two parallel UAF-prone arrays (fixed-size dogs[] with an attack | `cards/csawctf2026quals_diamond_dogs.yaml` (paused) |
| When a video/image challenge's pixel and audio data are a red herring, dump raw container bytes with strings/e | `cards/csawctf2026quals_finders_keepers.yaml` (solved) |
| A per-character timing side-channel that is normally too small to observe remotely becomes a practical oracle  | `cards/csawctf2026quals_flag_checker.yaml` (solved) |
| When every visible packet payload is byte-for-byte identical ('boring'), the exfiltration channel is the metad | `cards/csawctf2026quals_ghost_in_the_machine.yaml` (solved) |
| A 'perfectly ordinary' image can be a polyglot: scan past the real IEND chunk for a second embedded archive, a | `cards/csawctf2026quals_hemispheres.yaml` (solved) |
| PHP endpoints that accept a JSON body and directly mass-assign fields onto a privileged column (role, is_admin | `cards/csawctf2026quals_juggler.yaml` (needs_verification) |
| Deeply obfuscated malware chains (DLL sideload -> process injection -> downloader -> donut shellcode -> Confus | `cards/csawctf2026quals_keep_walking_forward.yaml` (solved) |
| A backend that trusts a specific literal User-Agent string to skip an otherwise-enforced time/token check, com | `cards/csawctf2026quals_low_tide.yaml` (paused) |
| A custom-VM 'crackme in a language you won't find in any disassembler' is best solved by writing a tiny symbol | `cards/csawctf2026quals_machine_head.yaml` (solved) |
| When a server state machine is built from xorshift-style XOR/shift/rotate operations only (no addition/multipl | `cards/csawctf2026quals_polly.yaml` (solved) |
| When reverse image search is deliberately defeated by cropping, fall back to landmark/logo recognition via mul | `cards/csawctf2026quals_recon_two_marks_one_score.yaml` (solved) |
| When two lists of names/handles must be reconciled and a mapping table links multiple aliases to one canonical | `cards/csawctf2026quals_roll_call.yaml` (solved) |
| A subset-sum / knapsack public-key cryptosystem with density below ~0.9408 is solvable in polynomial time via  | `cards/csawctf2026quals_secret_treaties.yaml` (solved) |
| Multi-stage 'escape room' web challenges that gate each stage behind the previous stage's derived key should b | `cards/csawctf2026quals_testing_out_the_temple.yaml` (needs_verification) |
| A PDF whose only content is a single near-white (luma 252-255, R=G=B) embedded image with no visible page text | `cards/csawctf2026quals_the_vantage_job.yaml` (paused) |
| When a service trusts a self-describing certificate embedded in a JWT header (x5c) across multiple issuers, ce | `cards/csawctf2026quals_trustdinoidc.yaml` (solved) |
| Smuggle extra curl argv tokens past a hostname-only allowlist by putting a space inside an otherwise-valid, al | `cards/dctf2026quals_aethergate.yaml` (solved) |
| Instead of relaying through the (aliased, mismatched) bridge path, redeploy the exact same owner contract byte | `cards/dctf2026quals_arbitrary_funds_sweep.yaml` (solved) |
| A seccomp-bpf filter that checks only the syscall number and never the arch field is exploitable across callin | `cards/dctf2026quals_bitdebit.yaml` (paused) |
| Never extract a multi-GB archive to disk: pipe the archive tool's stdout extraction directly into the analysis | `cards/dctf2026quals_kanji.yaml` (needs_verification) |
| Force the root-owned backup parser to blow its timeout budget by planting a note containing one absurdly large | `cards/dctf2026quals_legacy.yaml` (solved) |
| Reclaim the freed kmalloc-128 descriptor (via a controlled spray, stopping at the first contiguous reusable ru | `cards/dctf2026quals_nephilim.yaml` (solved) |
| Exploit that distinct integer powers of one matrix commute. Writing U_i = M_i + K_i, the commutator [U1-K1, U2 | `cards/dctf2026quals_power_with_errors.yaml` (solved) |
| GitHub serves a plaintext list of every user's public SSH keys at `https://<host>/<username>.keys` with no aut | `cards/deadfacectf2026_alice_and_bob.yaml` (solved) |
| When a challenge's "database access" is literally a SQL console wrapped in a WebSocket text/binary frame, hand | `cards/deadfacectf2026_aurora_db_forensics.yaml` (solved) |
| When the "integrity check" is a plain hash over attacker-editable data plus a salt that is also attacker-reada | `cards/deadfacectf2026_bad_calibration.yaml` (solved) |
| For DNS-tunneled exfiltration with an XOR-obfuscated payload, reassemble the Base32 chunks in label-sequence-n | `cards/deadfacectf2026_bad_guys_be_bad.yaml` (solved) |
| Multi-stage binary protections chain together — decode a custom alphabet first (map each byte through the bina | `cards/deadfacectf2026_cereal_killer_01.yaml` (solved) |
| To pull a crackable/identifying NTLMv2 value out of a pcap showing LLMNR poisoning, find the poisoned response | `cards/deadfacectf2026_challenge_accepted.yaml` (solved) |
| To recover printer tracking-dot steganography from a scanned/photographed document, compute a yellow-detector  | `cards/deadfacectf2026_conduct_unbecoming.yaml` (solved) |
| A login form showing only a generic error message does not mean the backend response is equally minimal — alwa | `cards/deadfacectf2026_doctor_appointment.yaml` (solved) |
| When a set of files looks unordered or deliberately shuffled (misleading filenames) but each carries its own m | `cards/deadfacectf2026_exfiltration.yaml` (solved) |
| A self-signed or custom TLS certificate's Subject (and Issuer) fields are attacker/operator-controlled free te | `cards/deadfacectf2026_exposing_myself.yaml` (solved) |
| When you cannot or do not want to rely on androguard/jadx, a hardcoded secret in a DEX file can be recovered d | `cards/deadfacectf2026_hard_kept_secrets.yaml` (solved) |
| To find a specific browsing event in a Chrome profile image, open the `History` SQLite file directly and query | `cards/deadfacectf2026_hooked.yaml` (solved) |
| When a binary's custom cipher is deterministic and the valid-input keyspace is small (here due to a no-repeat- | `cards/deadfacectf2026_keypad_oracle.yaml` (solved) |
| Rather than extracting a multi-GB memory image to disk, pipe the archive's decompressor to stdout (`7z.exe e - | `cards/deadfacectf2026_memory_dump_streaming_search.yaml` (solved) |
| Once authenticated as *any* user (even a leaked low-value credential), test object-reference endpoints by vary | `cards/deadfacectf2026_no_holding_back.yaml` (solved) |
| For a covert-exfiltration-style pcap challenge, first isolate the small anomalous subset of traffic (odd User- | `cards/deadfacectf2026_pcap_sequenced_fragment_reassembly.yaml` (solved) |
| When a boolean/UNION-less SQLi only reveals one row at a time (e.g. the first row matching `OR 1=1`), iterativ | `cards/deadfacectf2026_real_pain_in_the_prostate.yaml` (solved) |
| When a device has a secondary/maintenance output (debug HDMI mirror, diagnostic port, service display) distinc | `cards/deadfacectf2026_second_opinion.yaml` (solved) |
| AES-CTR is C = P XOR keystream(nonce,counter); if two messages reuse the same nonce/counter, recovering the ke | `cards/deadfacectf2026_second_shift.yaml` (solved) |
| When a sniffed capture has a low-traffic characteristic/handle distinct from the noisy bulk stream, filter to  | `cards/deadfacectf2026_signals_from_the_skull.yaml` (solved) |
| When a ret2win target function checks one of its arguments before doing anything useful, extend the simple ret | `cards/deadfacectf2026_skeleton_key.yaml` (solved) |
| When a forum/chat hint names a tool or project but not its repo, search the hosting platform (GitHub) for the  | `cards/deadfacectf2026_the_vibes_are_freaking_me_out.yaml` (solved) |
| A DNS answer with many resource records for one query/zone is the fingerprint of an AXFR zone transfer; a misc | `cards/deadfacectf2026_twilight_zone_transfer.yaml` (solved) |
| The Unicode Tag Block (U+E0000-U+E007F) maps 1:1 onto ASCII (code point - 0xE0000 == ASCII code point) and ren | `cards/deadfacectf2026_you_wouldnt_git_it.yaml` (solved) |
| Classic UAF via stale global pointer: free the tracked object without clearing the alias, reallocate the same  | `cards/fortidctf2026_baby_pwn.yaml` (solved) |
| A git repository's commit-date history, independent of any file content, can itself be the covert channel: ren | `cards/fortidctf2026_breaking_news.yaml` (paused) |
| The native library's geofence/what3words targets are fully reversed (4 coordinates, matching table) but the vi | `cards/fortidctf2026_crypto_wallet.yaml` (paused) |
| A key made of one repeated byte is invariant under any byte-position permutation, so permute(c^N)=c^N determin | `cards/fortidctf2026_desbox.yaml` (solved) |
| Chain three independent gaps: pollute Object.prototype via constructor.prototype (bypassing a __proto__-only b | `cards/fortidctf2026_do_you_know_lika.yaml` (solved) |
| Even when a WHERE clause prevents a row from ever appearing in the output, an ORDER BY CASE WHEN (condition) T | `cards/fortidctf2026_doctor_bye_bye.yaml` (solved) |
| The overflow and RWX-shellcode execution mechanics are confirmed locally (stubbed validator), but no article h | `cards/fortidctf2026_editorial_board.yaml` (paused) |
| Craft a minimal ELF whose DWARF line-table names its 'source file' as flag.txt (which sits in the same temp di | `cards/fortidctf2026_gdb_saas.yaml` (solved) |
| A full offline-analysis pipeline (QR geometry/RS decoder, affine key-bit structure, multiple video/audio featu | `cards/fortidctf2026_human_rng.yaml` (paused) |
| Because CSP nonces are drawn from a small known set, pre-compute ten <script nonce=...> tags (one per possible | `cards/fortidctf2026_king_admin.yaml` (solved) |
| Multi-stage live-quiz OSINT challenges require replaying already-accepted answers to reach the current unanswe | `cards/fortidctf2026_osint_exam_ii.yaml` (paused) |
| A 4/4 RS block decode is a necessary but not sufficient signal of a correct reconstruction -- QR data bytes mu | `cards/fortidctf2026_spill_the_tea.yaml` (paused) |
| An unbounded array-of-std::string index is both an arbitrary out-of-bounds read (get) and write (put) of raw m | `cards/fortidctf2026_string_peek_and_poke.yaml` (paused) |
| A backdoor can be split across several LoRA adapters that are individually benign; only summing their delta we | `cards/h7ctf2026_adapter_cartel.yaml` (solved) |
| Chain several classic web primitives: (1) GraphQL endpoints that rate-limit "per request" rather than per fiel | `cards/h7ctf2026_bartbrack.yaml` (solved) |
| When an AEAD nonce is stuck/reused across many frames, (1) recover the keystream for free from any frame whose | `cards/h7ctf2026_broken_telephone.yaml` (solved) |
| Before doing the "intended hard path" (build a Volatility ISF, find the ransomware process, carve the AES key  | `cards/h7ctf2026_deep_freeze.yaml` (solved) |
| Chain privilege escalation across an emulated multi-account AWS environment: invoke an over-privileged Lambda  | `cards/h7ctf2026_deputy.yaml` (solved) |
| When an automated analysis/agent pipeline gates a privileged report behind a corroboration-count threshold fed | `cards/h7ctf2026_echo_chamber.yaml` (solved) |
| A coroutine frame storing a reference/pointer into a manually-managed allocator cell is a UAF if the cell is f | `cards/h7ctf2026_frame_of_reference.yaml` (solved) |
| Two chained forensic recoveries: (1) AV quarantine vaults are typically encrypted with a static key embedded i | `cards/h7ctf2026_frozen_assets.yaml` (solved) |
| The classic first-depositor/share-inflation attack on a vault normally requires the vault to read its real tok | `cards/h7ctf2026_genesis.yaml` (solved) |
| On ext4 (and similar modern filesystems with extra inode fields), atime/mtime are trivially user-settable (uti | `cards/h7ctf2026_ghost_in_the_timeline.yaml` (solved) |
| Always decode the plaintext UART channel in a multi-bus VCD capture FIRST -- firmware debug/boot logs frequent | `cards/h7ctf2026_ghost_on_the_bus.yaml` (solved) |
| SQLite DELETE does not zero the freed B-tree cell bytes -- it only marks the page's freelist/cell-pointer-arra | `cards/h7ctf2026_gone_not_forgotten.yaml` (solved) |
| Scan BLE captures for any GATT read/notification whose payload is plaintext firmware debug output describing t | `cards/h7ctf2026_hear_no_evil.yaml` (solved) |
| Mobile "authorization" is often purely cosmetic -- the UI code chooses not to display a field, while the backe | `cards/h7ctf2026_help_yourself.yaml` (solved) |
| Recognize the UDS/ISO 15765-2 (ISO-TP) framing on the diagnostic request/response CAN IDs (commonly 0x7E0/0x7E | `cards/h7ctf2026_kick_the_can.yaml` (solved) |
| On recent glibc (>=2.39) tcache poisoning via a UAF must account for safe-linking (the fd pointer is XORed wit | `cards/h7ctf2026_loose_ends.yaml` (solved) |
| When an RLWE/LWE-style scheme uses a small-dimension ternary (or otherwise tiny-range) secret key, request an  | `cards/h7ctf2026_loose_lips.yaml` (solved) |
| When no binary is given for a format-string bug, bootstrap entirely from the live service: find the varargs of | `cards/h7ctf2026_manifest_destiny.yaml` (solved) |
| Decompiled mobile API clients frequently reveal three compounding flaws at once: (1) a static, hardcoded "atte | `cards/h7ctf2026_meridian_pay.yaml` (solved) |
| When a challenge presents a live streamed feed (HLS/RTSP/etc.) rather than a static file, first find and downl | `cards/h7ctf2026_mic_drop.yaml` (solved) |
| A PyTorch checkpoint loaded with weights_only=False is an arbitrary-pickle-execution vector; inspect the embed | `cards/h7ctf2026_model_package_autopsy.yaml` (solved) |
| "Unguessable" per-press codes in cheap remotes are frequently just a monotonic counter plus a short-period che | `cards/h7ctf2026_open_sesame.yaml` (solved) |
| Emptying __builtins__ in the eval globals dict does not remove the real builtins from already-loaded objects'  | `cards/h7ctf2026_out_of_the_box.yaml` (solved) |
| Don't rely on a ZIP library's normal listing (which reads the central directory) when a challenge hints the di | `cards/h7ctf2026_overexposed.yaml` (solved) |
| SHA256(secret//msg) with unknown secret length is vulnerable to Merkle-Damgard hash length extension: brute-fo | `cards/h7ctf2026_owners_draw.yaml` (solved) |
| With no PIE and no canary but NX enabled and no leaked libc base, a two-stage ret2plt/ret2libc works cleanly i | `cards/h7ctf2026_parcel_bomb.yaml` (solved) |
| If ECDSA nonces follow a polynomial recurrence k_{i+1} = sum(a_j * k_i^j), express each k_i as an affine funct | `cards/h7ctf2026_polynonce.yaml` (solved) |
| This "license checker" shape recurs across many stripped/obfuscated reversing challenges in this event (Constr | `cards/h7ctf2026_rev_license_aes_pattern.yaml` (solved) |
| When a shellcode sandbox blocklists only execve (or a small syscall set), the standard bypass is Open-Read-Wri | `cards/h7ctf2026_safe_space.yaml` (solved) |
| When many RSA public moduli are generated under shared or low-entropy conditions, compute gcd(N_target, N_i) a | `cards/h7ctf2026_shared_blood.yaml` (solved) |
| When a mobile API's request-signing scheme derives its HMAC key purely from a hardcoded app-wide constant plus | `cards/h7ctf2026_signed_sealed_delivered.yaml` (solved) |
| When a user-controlled string is inserted directly into a subprocess argv (not through a shell) and later toke | `cards/h7ctf2026_splice.yaml` (solved) |
| WOTS hash chains are one-way (you can advance H^a(sk) forward to H^b(sk) for b>=a but never backward); if a st | `cards/h7ctf2026_take_two.yaml` (solved) |
| When a formal-equivalence checker widens/zero-extends a smaller symbolic variable to compare against a full-wi | `cards/h7ctf2026_tapeout.yaml` (solved) |
| If ECDSA nonces are produced by a linear congruential generator (k_{i+1} = a*k_i + b mod n), the second differ | `cards/h7ctf2026_the_ledger_never_sleeps.yaml` (solved) |
| Files that were `git add`ed (staged) and then removed/reset/amended before a commit, or committed and later re | `cards/h7ctf2026_time_capsule.yaml` (solved) |
| Classic Correlation Power Analysis (CPA): for each of the 16 AES-128 key bytes independently, hypothesize all  | `cards/h7ctf2026_trace_amounts.yaml` (solved) |
| When a protocol's self-consistency (e.g. "debt can never exceed collateral value") relies on a shared price/va | `cards/h7ctf2026_trompe_loeil.yaml` (solved) |
| When a custom ASN.1 structure derives a context tag number dynamically from the length of a preceding variable | `cards/h7ctf2026_vouchsafe.yaml` (solved) |
| When a controller validates a multi-document manifest stream by checking only that some document matches an ex | `cards/hackluctf2026_challenge_deployment.yaml` (solved) |
| When an interpreted VM's state (including saved return address) is reachable via an unbounded index-register O | `cards/hackluctf2026_chip.yaml` (solved) |
| When a string-replace routine expands its match in place without adjusting the destination buffer's bound chec | `cards/hackluctf2026_declassifier.yaml` (solved) |
| A primitive that can corrupt a file-descriptor-number variable via `/proc/self/mem` before a program's second, | `cards/hackluctf2026_doppelflip.yaml` (paused) |
| When a generator claims exhaustive coverage of a huge discrete puzzle space but most instances are provably un | `cards/hackluctf2026_every_7x7_nonoflag.yaml` (solved) |
| Recognize that a sprawling systemd unit-file graph using only `Requisite=`/`OnSuccess=`/`OnFailure=` dependenc | `cards/hackluctf2026_flag_check_appliance.yaml` (solved) |
| When a protected IL2Cpp binary breaks standard dumpers by modifying only the metadata's string-literal encodin | `cards/hackluctf2026_il2flag.yaml` (solved) |
| Don't assume a strong 'use GDB' hint in the challenge description means the debugger-specific code path is req | `cards/hackluctf2026_license_validation_suite.yaml` (solved) |
| Combine a CBC padding oracle (full block-decryption primitive) with CBC-R backward chaining to forge a multi-b | `cards/hackluctf2026_linkedinspirator.yaml` (solved) |
| A network-safety allowlist that blocks obviously dangerous commands (shell/run/bind/source) but forgets that ` | `cards/hackluctf2026_remote_dj.yaml` (paused) |
| When an installer deliberately jumps over dead code that computes part of a decryption key, don't assume those | `cards/hackluctf2026_selene_protocol.yaml` (solved) |
| Exploit a realloc that copies the OLD size instead of min(old,new) by placing the vulnerable allocation flush  | `cards/hackluctf2026_turbo_malloc.yaml` (solved) |
| Passing a binary hash digest across an FFI/Cgo boundary into a C function that calls `strlen()` on it silently | `cards/hackluctf2026_vaulty.yaml` (solved) |
| When a VM-based obfuscation processes one input byte per independent linear-arithmetic chunk and the chunk's o | `cards/hackluctf2026_verymildhidden.yaml` (solved) |
| Best hypothesis only (unsolved): a published 576-byte XXH3-128 weak-key multicollision family (16 messages fro | `cards/hitconctf2026_fastcoll.yaml` (paused) |
| The straightforward symlink-then-unlink trick to clobber root's private flag path is blocked because permissio | `cards/hitconctf2026_io_urust.yaml` (paused) |
| When a 'walk a Python module graph' challenge relies on a not-yet-stable language feature (PEP 810 lazy import | `cards/hitconctf2026_lazy_maze.yaml` (paused) |
| A full 6-hop/19-step BFS of the object graph reachable from `math`, cross-checked against the real Docker imag | `cards/hitconctf2026_mathclipse.yaml` (paused) |
| Map the full D-Bus object/method/policy surface from the outside using systematic probing (benign calls, malfo | `cards/hitconctf2026_night_shift_archive.yaml` (paused) |
| Ignore the agent-bait prose/binaries entirely; parse the Iloc records out of each folder's .DS_Store, rank-clu | `cards/hitconctf2026_research_md.yaml` (solved) |
| Reduce the home-grown TPM cipher's key recovery to a 128-bit SMT problem over K0,K1 using a single-round (COST | `cards/hitconctf2026_spi_tpm_free_trial.yaml` (paused) |
| Chain two independent weak-PRNG breaks: (1) recover a Mersenne Twister's full internal state from torsion-subg | `cards/hitconctf2026_voteme.yaml` (solved) |
| A custom Windows kernel driver's own device security descriptor (SDDL) is the first thing to check -- here Bui | `cards/hitconctf2026_vulcreator.yaml` (paused) |
| A full Plus Code has ~14m cell resolution, so when multiple legitimate sources for the same building differ by | `cards/hitconctf2026_will_be_there_osint.yaml` (paused) |
| Correlate a suspicious command-timestamp window in shell history against SSH session start/end windows to uniq | `cards/htbtryout_an_unusual_sighting.yaml` (solved) |
| Chain four independently-small bugs: use wkhtmltopdf's JS execution on a data:text/html document to XHR-read t | `cards/htbtryout_blueprint_heist.yaml` (solved) |
| Chain path traversal (topic='../config.py') to load the app's own config file (containing the per-run-random c | `cards/htbtryout_chrono_mind.yaml` (solved) |
| Hidden text in a PCB fabrication file is not necessarily on the silkscreen; sabotaged/flag-bearing text can be | `cards/htbtryout_critical_flight.yaml` (solved) |
| A per-character comparison split into many tiny closures assembled through a function-pointer table is a commo | `cards/htbtryout_dont_panic.yaml` (solved) |
| Rather than reimplementing glibc's rand() algorithm by hand (error-prone: discard counts, pointer wraparound,  | `cards/htbtryout_flagcasino.yaml` (solved) |
| Use the WAF-filtered bio SSTI only to read data (leak the admin's email via the ORM object already in Jinja2 c | `cards/htbtryout_guild.yaml` (solved) |
| An invisible Unicode character used as a valid JS property/variable name can silently add a hidden element to  | `cards/htbtryout_hidden_path.yaml` (solved) |
| Bypass the hostname-prefix SSRF blocklist using a wildcard DNS service (sslip.io) to reach the internal IP und | `cards/htbtryout_htb_proxy.yaml` (solved) |
| Statically read the VHDL sources to extract the exact backdoor trigger pattern and the key constant directly ( | `cards/htbtryout_its_oops_pm.yaml` (solved) |
| When redirecting execution into a win()-style function via a stack-smash ret (not a real call instruction), th | `cards/htbtryout_labyrinth.yaml` (solved) |
| Don't trust a project's apparent branding/artifact name as the template engine identity; verify by checking th | `cards/htbtryout_labyrinth_linguist.yaml` (solved) |
| Build the target function's name at runtime from chr(ord) codes (avoiding any literal string containing a bloc | `cards/htbtryout_locked_away.yaml` (solved) |
| abi.encodePacked on two dynamic strings is ambiguous: ("SatoshiNakamoto", "") packs to the same bytes as ("Sat | `cards/htbtryout_notademocraticelection.yaml` (solved) |
| A pure-Python pcap/TCP/SMTP parser (no scapy/tshark needed) extracts 15 raw emails from port-25 streams; each  | `cards/htbtryout_phreaky.yaml` (solved) |
| SSRF with file:// support becomes full arbitrary local file read; use it to steal the private npm registry's a | `cards/htbtryout_prison_pipeline.yaml` (solved) |
| Modbus function codes >= 65 (0x41) are reserved for vendor-specific/custom protocol extensions; when a pcap sh | `cards/htbtryout_shush_protocol.yaml` (solved) |
| Breaking out of the single-quoted date format argument with a closing quote and semicolon lets you inject arbi | `cards/htbtryout_timekorp.yaml` (solved) |
| With no leak primitive and NX enabled but a known glibc/ld pair available, forge fake ELF64_Rela/Sym/strtab st | `cards/htbtryout_void.yaml` (solved) |
| Reconstruct a named CTF team's public competition history (year, host city, final ranking) from CTFtime team/e | `cards/kalictf26_havok_trail.yaml` (solved) |
| Treat an invoice/document image as a seed for corporate OSINT -- run subdomain enumeration on the named domain | `cards/kalictf26_oshit.yaml` (solved) |
| When a proxy/WAF regex-filters a raw request body before a backend parses it with awareness of encoding, a cha | `cards/l3akctf_platform_protection_part1.yaml` (needs_verification) |
| To get a value JSON-decoded a second time without the framework doing it for you, abuse the react2shell primit | `cards/l3akctf_platform_protection_part2.yaml` (needs_verification) |
| The same nested-resolved_model-chunk trick from Part 2 generalizes: wrap the RCE primitive in a configurable n | `cards/l3akctf_platform_protection_part3.yaml` (needs_verification) |
| Three independently well-known bug classes chained: (1) a json vs ujson parser differential on dangling UTF-16 | `cards/l3akctf_squid.yaml` (solved) |
| Treat the attachment as a Subleq program: each 16-bit cell triple is `subleq a, b, c` meaning memory[b] -= mem | `cards/l3akctf_subleq_scramble.yaml` (paused) |
| In a seccomp-unotify-based sandbox/supervisor design, the real attack surface is not "can the child escape the | `cards/l3akctf_supervisor.yaml` (paused) |
| When a capture contains one side of a custom encrypted protocol and the corresponding legitimate binary that a | `cards/l3akctf_yet_another_chat.yaml` (solved) |
| A file of literal ASCII '0'/'1' text is almost always a byte stream written out as binary digits rather than b | `cards/picoctf2026_binary_digits.yaml` (solved) |
| When a challenge frames hash-cracking around personal profile details (name/nickname/birthdate/family), replic | `cards/picoctf2026_password_profiler.yaml` (solved) |
| Not every "Binary Exploitation" challenge requires crafting a live exploit — some are knowledge-check quizzes  | `cards/picoctf2026_quizploit.yaml` (solved) |
| When a DH exchange's "leaked something" hint accompanies a full set of public parameters plus one party's priv | `cards/picoctf2026_shared_secrets.yaml` (solved) |
| Blind CSS exfiltration: inject <style> rules using attribute-selector string-prefix matching ([value^="prefix" | `cards/ptitctf2026_approve_please_genie.yaml` (solved) |
| Deep PCAP timeline reconstruction (apt package downloads identifying attacker tooling: masscan then gobuster+S | `cards/ptitctf2026_bug_bounty.yaml` (paused) |
| Native Android license checks hide the real comparison in ARM64 native code (JNI) while the Java layer only en | `cards/ptitctf2026_phonefarm_detail.yaml` (solved) |
| The flag-bearing cipher function is never called by any executed code path -- it is reachable only via a funct | `cards/ptitctf2026_procesess.yaml` (solved) |
| A 16-bit truncated bounds check next to a 64-bit read() size enables a large stack overflow despite a seemingl | `cards/ptitctf2026_seccomp_v3.yaml` (solved) |
| Pure OSINT + git-history mining on a named individual's public GitHub account recovered a strongly flag-shaped | `cards/ptitctf2026_tiger_bac.yaml` (paused) |
| This is a fully statically solvable deterministic maze (recover width/height/edges/start/exit from .rdata, BFS | `cards/ptitctf2026ck_escape_maze.yaml` (needs_verification) |
| A working, reliable libc-base leak was achieved live against the real challenge instance via a size-truncation | `cards/ptitctf2026ck_infosecptit_code_cli.yaml` (paused) |
| A layered reverse challenge where the real validation logic is a custom bytecode VM whose program is itself de | `cards/ptitctf2026ck_racing_monster.yaml` (solved) |
| Web challenges that ship a photo attachment alongside a live login portal often hide the login credentials vis | `cards/rstconctf2026_bad_medicine.yaml` (solved) |
| On embedded/RTOS pwn challenges, an unbounded array-index write that is reachable via a debug command can be w | `cards/rstconctf2026_carbon_noneoxide.yaml` (solved) |
| When a pun/title hints at DNS specifically, filter the capture to DNS query records and regex the subdomain la | `cards/rstconctf2026_do_not_service.yaml` (solved) |
| Best hypothesis (unconfirmed by server response): interior panel/seat style and FRA glazing stamp identify the | `cards/rstconctf2026_foamer.yaml` (paused) |
| When a challenge has zero attached files and only a prompt pointing at a social-media post, find the org's off | `cards/rstconctf2026_hey_listen.yaml` (solved) |
| Decode layer by layer by alphabet/shape recognition (hex = 0-9a-f only; base64 = mixed case+digits with traili | `cards/rstconctf2026_intercepted.yaml` (solved) |
| Classic format-string leak. Compute the stack distance (in qwords) between the format-string buffer's own vara | `cards/rstconctf2026_leaky_logger.yaml` (solved) |
| Best hypothesis (unconfirmed): decode speed/yaw-rate/steer-angle CAN signals via the Toyota DBC, integrate spe | `cards/rstconctf2026_life_is_a_highway_detail.yaml` (paused) |
| When a client-side "random" game exposes its full PRNG parameters (A/C/M/seed) and a symbol pool in readable J | `cards/rstconctf2026_new_money.yaml` (solved) |
| When e is tiny (3 here) and the unpadded message m satisfies m^e < n, the modular reduction never actually wra | `cards/rstconctf2026_shallow_exponent.yaml` (solved) |
| The actual vulnerability is a normal format-string bug (`printf` on attacker-influenced data), but the attacke | `cards/rstconctf2026_thought_slop.yaml` (solved) |
| At USB link-layer capture granularity, a file write shows up as separate OUT token packets (announcing device/ | `cards/rstconctf2026_universal_suffering_begins_usb.yaml` (solved) |
| A substring blacklist on the raw source text does not stop you from CONSTRUCTING the banned identifier at runt | `cards/securinets2026_banned_in_leonida.yaml` (solved) |
| A 6-part DFIR series built around ONE maldoc infection chain: a PDF's /OpenAction JavaScript (app.launchURL) p | `cards/securinets2026_chilla_box_maldoc_chain.yaml` (solved) |
| Craft a tar archive whose single member 'report.txt' is a symlink (tarfile.SYMTYPE) pointing at an absolute pa | `cards/securinets2026_follow_me.yaml` (solved) |
| Spell the banned identifier using JavaScript's unicode escape sequences inside an identifier (e.g. replacing o | `cards/securinets2026_js_1_0.yaml` (solved) |
| A PDF font's /Differences array can make two different byte values render as visually identical glyphs; this i | `cards/securinets2026_khloss_lmouhami.yaml` (solved) |
| When a binary needs specific immediate constants loaded via movabs (a 10-byte instruction whose last bytes are | `cards/securinets2026_xyz.yaml` (solved) |
| A Flutter app's real crypto key material can be bound to the APK's own code-signing certificate hash (verified | `cards/securinetsquals2026_backdrop.yaml` (solved) |
| When a menu-driven heap challenge has a trait-object dispatch where `activate`/similar performs an unchecked i | `cards/securinetsquals2026_crust.yaml` (solved) |
| To fingerprint a bespoke/unknown packer with no public signature, read the PE's own section names in order (au | `cards/securinetsquals2026_cur53d_entr0py.yaml` (paused) |
| When Volatility 3 can't parse a given Windows crash-dump subtype, patch the specific layer class to read the v | `cards/securinetsquals2026_dumpwn.yaml` (solved) |
| Manually implementing LUKS2 unlock (PBKDF2 keyslot-area decrypt -> AF-merge -> master key -> segment decrypt)  | `cards/securinetsquals2026_gelatino.yaml` (solved) |
| Layered anti-analysis (self-decrypting memfd+execveat ELF launcher, a Go binary requiring a newer GLIBC than a | `cards/securinetsquals2026_letmethink.yaml` (paused) |
| A fixed/predictable ECDSA nonce derived from any public value (even a hash of a known string) fully breaks the | `cards/securinetsquals2026_misdirection_part1.yaml` (solved) |
| When an OSINT challenge's 'only evidence file' turns out to be a large self-contained game engine export rathe | `cards/securinetsquals2026_murder.yaml` (paused) |
| When a managed (.NET/Mono) application embeds its real crackme/validation logic as native resource DLLs rather | `cards/securinetsquals2026_nightfall.yaml` (paused) |
| A length check using a SIGNED comparison against an int32 user input can be bypassed with negative values, but | `cards/securinetsquals2026_over_flow.yaml` (paused) |
| When a seccomp filter permits literally only `exit(code)` after secrets are already loaded into memory, the so | `cards/securinetsquals2026_void.yaml` (paused) |
| GLIBC safe-linking only obfuscates a tcache fd pointer with (chunk_addr>>12) XOR target; when the target of th | `cards/sunshinectf2026_cache_money.yaml` (solved) |
| Reversing a custom encrypted wire protocol is a necessary precondition, not the vulnerability itself; once the | `cards/sunshinectf2026_code_breaker.yaml` (solved) |
| When a privileged cookie is HttpOnly (can't be overwritten by injected JS) but shares the browser's default (n | `cards/sunshinectf2026_cookiecorp.yaml` (solved) |
| A binary-patch-format challenge (BPS/IPS/xdelta) does not require reconstructing the full patched target to ex | `cards/sunshinectf2026_flameon.yaml` (solved) |
| A disabled/commented-out URL-override parameter left in client source is still worth testing server-side; if t | `cards/sunshinectf2026_groundhog_day.yaml` (needs_verification) |
| An off-by-one in a bounds check (<= vs <) that writes one extra attacker-influenced byte (such as a trailing c | `cards/sunshinectf2026_homemaker.yaml` (solved) |
| A verification routine split into (a) a small number of individually-invertible register operations driven by  | `cards/sunshinectf2026_intmod.yaml` (solved) |
| When a format-string bug is inside a loop that calls printf(buf) on freshly-read user input every iteration, o | `cards/sunshinectf2026_mad_libs.yaml` (solved) |
| A .klc (Microsoft Keyboard Layout Creator) file with an extensive DEADKEY section encodes a hidden message as  | `cards/sunshinectf2026_my_eyes_burn.yaml` (solved) |
| A macro-enabled Office file's VBA project (vbaProject.bin, an OLE compound document reachable via its ZIP/OOXM | `cards/sunshinectf2026_nas_coal.yaml` (solved) |
| A boolean-only (no error/time feedback) blind SQLi oracle is solved by binary-searching each character's ASCII | `cards/sunshinectf2026_planetary_probe.yaml` (solved) |
| A custom (non-glibc) printf reimplementation can still be exploited exactly like a real format-string bug (lea | `cards/sunshinectf2026_print_print_revolution.yaml` (solved) |
| When a program plants secret chunks at specific, varying depths below a baseline stack pointer and offers an u | `cards/sunshinectf2026_robocall.yaml` (solved) |
| When a .klc file's 'normal' character values are direction glyphs (arrows / a stop square) rather than printab | `cards/sunshinectf2026_suntrail.yaml` (solved) |
| When a binary has almost no ROP gadgets but DOES have a read-like gadget whose return value lands in rax, that | `cards/sunshinectf2026_total_recall.yaml` (solved) |
| Always run full GraphQL introspection first on any discovered /graphql endpoint when the schema isn't otherwis | `cards/sunshinectf2026_used_goods_of_tomorrow.yaml` (solved) |
| A vector-database (ChromaDB-style) item that has a non-null embedding but a null/empty document field is delib | `cards/sunshinectf2026_vecnet.yaml` (solved) |
| A pcap carrying a VoIP call should be parsed for its SIP/SDP negotiation to find the actual RTP media ports an | `cards/sunshinectf2026_welcome_call.yaml` (solved) |
| When `kid` (or any attacker-controlled field) selects which file's bytes are used as the verification key, and | `cards/sunshinectf2026_you_are_kidding_me.yaml` (solved) |
| If a PNG visually looks truncated/cut off but is not corrupt (opens fine, valid CRCs), check whether the decom | `cards/sunshinectf2026_you_cut_me_off.yaml` (solved) |
