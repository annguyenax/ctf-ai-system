# Hacker Cinema — FortID CTF 2026

Status: solved and platform-confirmed on 2026-10-10.
Flag: FortID{F0rg3_7h3_T1ck37_4nd_H4CK_TH3_PL4N3T!_4a87e16651}

## Intake

- Category: Cryptography. Author: ipaljak.
- Handout: PHP 8.4.16 ticket service with hand-rolled ECDSA secp256k1-SHA256
  (CTFTimeWriteup/FortIDCTF2026/Crypto/Hacker Cinema/files/handout.zip).
- Remote instance started via
  `PUT /api/v2/integrations/challs/8594ef8c-dc41-48e8-9349-9b521f57968a/instance`.

## Vulnerability

`derive_nonce()` derives the ECDSA nonce k deterministically from
(movie, screen, seat, `kiosk_partition_date(ts)`, winner) where
`kiosk_partition_date` uses `new DateTimeImmutable('@' . $ts)`. The signed ticket
message instead contains `ticket_date_from_timestamp(ts)` computed with
`DateTimeImmutable::createFromFormat('U', ...)`. On PHP 8.4.16 (the version
pinned by the Dockerfile) the two disagree around year 0: the `@` constructor
maps both Unix days [-62164800000, -62164627200) to partition date `0000-01-29`
(a 172800-second "day"), while `createFromFormat` rolls to `0000-01-30` at
-62164713600. Same seat + same partition date + different ticket date yields two
distinct messages signed with the same nonce — fatal ECDSA repeated-nonce
exposure (identical r values observed remotely).

## Exploit

1. `POST /buy` seat A01 at ts=-62164800000 and ts=-62164713600; decode each
   ticket QR (`/ticket.png` + zbarimg) to get two envelopes with identical r.
2. Recover k = (z1-z2)/(s1-s2) mod n and d = (s1*k - z1)/r mod n.
3. Verify by re-signing message 1 with (d, k) reproducing (r, s1).
4. Forge envelope {date:0000-01-29, movie:Hackers, screen:mainframe-1,
   seat:A01, winner:true} with a fresh nonce, render QR, POST to `/check` ->
   JACKPOT ACCEPTED + flag.

## Evidence

- Event writeup + solver + evidence manifest:
  CTFTimeWriteup/FortIDCTF2026/Crypto/Hacker Cinema/{writeup,solve}
- Recovered private key d = 26e6cbedf60c78fd3996e9899e2febe4ff7a7eafbcf569c69eedc1fce77222d5
  (instance-scoped; the signing seed is per-instance).
- Platform accepted the flag via submit_flag.py.

## Notes

- The quirk does not exist on PHP 8.4.24 (WSL) — verify version-specific
  behavior on the exact pinned runtime (downloaded PHP 8.4.16 Windows binary).
- The prior static analysis note concluded "no useful nonce reuse" because it
  only considered same-day timestamps; the divergence scan over the full
  allowed timestamp range (including negative extremes) was the missing step.
