# Report - Misdirection: Part 2

## Goal

Recover the admin scalar for https://xch2.bit-raven.com and decrypt the alternate-path hint.

## Environment and artifact hashes

Handout `files/misdir2.zip`. Live host `https://xch2.bit-raven.com`. Hint id 5, cost 0, title "Alternate path".

## Enumeration and decisive signals

`forgeAuthentication` signs with a random nonce. `forgePrf` multiplies `ADMIN_PRIVATE_KEY` by an unchecked point and returns SHA256 of the x-coordinate. The browser stub maps `extensions.prf.eval.first` onto that oracle and stores the digest in `userHandle`. `App.tsx` still merges a `settings` query with `constructor.prototype`.

## Exploitation / recovery

Thirteen invalid-curve points of smooth odd order, delivered by polluting `baseURL` and answering `login_start`. Each `userHandle` matched `k` and `M-k`. CRT produced one 32-byte scalar whose ASCII hex hashes to the AES-256-ECB key.

## Verification

`solve/solve.py` prints `Securinets{c0unterfeiting_d0Ma1ns_like_th3_M4fiA}`. `submit_flag.py` returned Correct.

## Failed paths and why

The Part 1 scalar and the `.env.example` scalar do not decrypt this ciphertext. A forged admin login was not attempted; the hint exists because that path stays locked.

## Lessons and faster path

Read the bot's new PRF helper before replaying the nonce attack. Mine the smooth moduli offline, then spend one report per modulus.

## Alternative approaches

Same AES key schedule once any method yields `d`.
