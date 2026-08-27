# Report - ptitctf2026_mmo

## Goal

Name the primary proxy-list API used by the packed MMO proxy tool (`main.exe`).

## Environment and artifact hashes

- Outer `main.exe` SHA256 `5cbe2adb59cde80413b5a248f52ed30fca4071c425862ca2f9df50f672a25890`, 26217984 bytes.

## Enumeration and decisive signals

- Nuitka onefile (strings `NUITKA_ONEFILE_PARENT`, GCC 14.2.0).
- Payload: RT_RCDATA ID 27, magic `KAY` + zstd.
- Inner Nuitka standalone Python 3.10 + PyQt5 (`gui_proxy.py`, `proxy_checker.py`).

## Exploitation / recovery

Extract resource, zstd-decompress after `KAY`, walk UTF-16LE archive. ASCII search of inner `main.exe` yields the GitHub raw `api.json` bound to `ProxyChecker.get_config_api`.

## Verification

URL is a literal ASCII string at inner offset `0x1073380` / `HungHT1890` at `0x10733a3`. `api.myip.com` is only the live-check endpoint.

## Failed paths and why

- PyInstaller/Electron assumption.
- Full-frame zstd without skipping `KAY`.

## Lessons and faster path

Nuitka Windows onefile → RT_RCDATA/27 `KAY`+zstd, then strings on the inner PE.

## Alternative approaches

Run the GUI and intercept HTTP (heavier than strings on unpacked inner).
