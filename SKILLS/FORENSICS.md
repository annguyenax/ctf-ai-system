# SKILL — FORENSICS

## Triage signals

| Signal | Likely |
|--------|--------|
| `.pcap` / `.pcapng` | network forensics |
| disk image / memory | DFIR |
| stego image/audio | steganography |
| logs | timeline / IOC |
| office/pdf | macros / embedded |

## Fast path checklist

1. Identify artifact type (`file`).  
2. Extract filesystem/objects without full manual parse when tools exist.  
3. Search flag format regex early (`flag{`, `CTF{`, `jail{`).  
4. Build minimal timeline of interesting events.  
5. Deep carve only if shallow search fails.

## Discriminative tests

- PCAP: `http`/`dns`/`ftp` filters; export objects.  
- Image: `exiftool`, `zsteg`, `binwalk`.  
- Mem: `strings` + volatility plugin shortlist.

## Tool whitelist

`wireshark`/`tshark`, `binwalk`, `foremost`, `exiftool`, `volatility`, `zsteg`, `strings`.

## Avoid early

Carving entire disk before keyword search; full malware detonation outside sandbox.

## Deliverables

- Artifact → finding chain  
- Extracted flag + source object  
- Timeline of key events  
