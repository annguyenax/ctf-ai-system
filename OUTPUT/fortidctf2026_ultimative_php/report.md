# Ultimative PHP — FortID CTF 2026

Status: solved and platform-accepted on 2026-10-10.

Flag: `FortID{C0RP_M1GR4T10N_1S_WH3R3_D4T4_G03S_T0_D13_cdbe8b1741}`

## Intake

- Category: Web.
- Challenge ID: `b1f77b73-8a7b-4c02-8dad-b343137594f0`.
- Source: `CTFTimeWriteup/FortIDCTF2026/Web/Ultimative PHP/files/ultimative_php/src/index.php`.
- A prior solver received the flag in the target response and recorded successful platform submission. The current status query also lists the challenge as SOLVED.

## Solve chain

The request passes four checks in one flow:

1. `access.level=administrator` passes the raw-query block while PHP normalizes the key to `$_GET['access_level']`.
2. `primary[]` and `backup[]` hold different arrays of the same type; concatenation converts both to the same string, so their recovery hashes match.
3. The code `59036305` produces distinct MD5 and SHA-256 prefixes that both compare numerically as zero (`0e...`) under loose `==`.
4. An allowed serialized `LegacyTemplate` object uses a path beginning with `../`; `strpos` returns integer zero, which is false in the guard, enabling a read of `/flag`.

The response and successful submission are preserved in `solve/evidence/verification.txt`. The saved solver now reads its platform credential from `FORTID_PLATFORM_TOKEN` rather than storing it in the file.
