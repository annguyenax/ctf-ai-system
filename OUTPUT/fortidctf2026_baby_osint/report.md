# Baby OSINT — FortID CTF 2026

Status: needs verification; previous candidate rejected by the platform.

## Result

Flag: FortID{hodaj_za_liku_hodaj_za_hrvatsku:zegevege_festival:wednesday:269}

## Evidence chain

1. The supplied JPEG records 2026-09-05 12:03:02 in EXIF.
2. The labor-union announcement gives the event title “Hodaj za Liku, hodaj za Hrvatsku” for September 5.
3. The 18th ZeGeVege festival ran September 4–6, including September 5.
4. The Bajs dashboard's weekday averages show Wednesday highest (17,493.5 rides).
5. Comparing the history series for the 49 station IDs returned by the public station-list endpoint over 2025-11-04–2026-10-10 gives a maximum of 269 at station 21228, Trg Kralja Tomislava, on September 5 at 12:15:39 +02:00.

Q3 is translated to English per the challenge's answer-format instructions. The complete source details and captured values are in the event folder's solve/evidence/verification.txt.

## Reproduction

Run the event-folder solver to validate the recorded evidence and flag formatting. The public data was queried live during solving; the recorded date range is pinned in the evidence file because the dashboard changes over time.


## Verification correction (2026-10-11)

The earlier solved claim is withdrawn. `solve/out.txt` records `badFlag` for the exact previous candidate. The current portal shows Unsolved. The event/festival source is corroborated, but the historical station query used the default list limit and did not establish a system-wide maximum. Querying `/api/stations?limit=250` returns 219 entries. A bounded audit of the omitted station IDs is in progress. No new flag is verified.
