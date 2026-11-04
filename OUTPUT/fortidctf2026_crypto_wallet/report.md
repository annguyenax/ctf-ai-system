# Crypto Wallet — paused

Status: no seed or flag candidate recovered. The locally verified APK checks a 12-word BIP-39 phrase and a fixed Ethereum address before decrypting the bundled flag.

The latest bounded test scanned 14,404 bit windows from the 12 `TrendChartView` float constants. It produced 463 BIP-39 checksum-valid phrases and zero target-address matches. Details and hashes are recorded in the event notes; raw outputs remain in `D:\download\ctf-scratch\fortid2026_crypto_wallet\`.

Next actions:
1. Inspect remaining custom Java/Kotlin code for non-string constants or alternate key/decrypt paths not covered by the current notes.
2. Revisit the chart only if a concrete mapping from its rendering/data to BIP-39 indices appears; do not expand arbitrary word or float searches.
3. Keep the exact address and decrypted flag as offline verification requirements; current scope prohibits submitting any new flag.

Additional local check: the APK has 724 entries and 150 PNG resources. All PNGs were structurally valid and had no text metadata, nonstandard chunks, or trailing bytes. This closes the resource-image metadata branch; no mnemonic or flag was recovered.

The manifest/intent audit found only the exported launcher activity with MAIN/LAUNCHER, no deep link or Intent-extra route; the other exported receiver requires `android.permission.DUMP`. No direct route to bypass mnemonic/address checks was found. The next useful step needs a new concrete seed clue; all three bounded local hypotheses are recorded in `attempts.json`.
