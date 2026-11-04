# Tangled — FortID CTF 2026

Status: needs verification; no flag recovered.

Two Factorio blueprint strings encode complementary 25×25 masks. XORing factory-entity occupancy with the landfill-tile mask, inverting polarity, and decoding the resulting QR yields the clue `_5p49hett1_tr41n5_8ec0m3_`. ZXing-C++ and OpenCV independently agree on that QR payload.

The portal rejected both `FortID{_5p49hett1_tr41n5_8ec0m3_}` and the title-based guess `FortID{spaghetti_trains_become_tangled}`. Therefore, the QR payload is not a verified flag.

Event artifacts and rejection evidence: `D:/download/CTFTimeWriteup/FortIDCTF2026/Misc/Tangled/`.
