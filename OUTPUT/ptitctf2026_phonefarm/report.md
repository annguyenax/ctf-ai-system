# Report - ptitctf2026_phonefarm

## Goal

Find the cracked ViChanger/Octopus license key in `maxchangev2.apk` and MD5 it.

## Environment and artifact hashes

- APK `maxchangev2.apk`, package `vn.vichanger.app`.
- Native `libOctopus.so` ARM64, `Main::changeDevice` at `0x147a0`.

## Enumeration and decisive signals

- Xposed module; Java login only checks non-empty `apiKey`.
- Native compare: length 5, first dword `0x6c6c6568` (`hell` LE), fifth byte `0x6f` (`o`).
- Fail path returns `Invalid API Key`.

## Exploitation / recovery

The backdoor key is `hello`. MD5 `5d41402abc4b2a76b9719d911017c592`.

## Verification

Independent Capstone AArch64 of `changeDevice` at `0x147a0` (`cmp x9, #5`, `movk` `0x6c6c6568`, `ccmp` `#0x6f`). `hashlib.md5(b"hello")`.

## Failed paths and why

- MD5 of `8F3K5nX29tZaQ1BpYrW7JL6Cd4EmHo` (cryptor static key for JSON response, not the license).
- OSINT for username `luongvd` (not in the APK).

## Lessons and faster path

Android license: skip Java empty-check, go to JNI/native compare on the first `std::string`. Nearby long random strings may be crypto keys, not the password.

## Alternative approaches

Frida hook `changeDevice` (unnecessary once the compare is visible).
