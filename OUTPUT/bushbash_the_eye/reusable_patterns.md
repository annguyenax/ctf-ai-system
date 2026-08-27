# Reusable patterns

1. Treat domain poetry as an ordered entity-resolution problem: identify the culture/system, map each clue to a canonical name, then map names to physical objects.
2. In annotated astronomy images, use a constellation transform to narrow locations but verify label ownership visually. Blooming/merged star halos make nearest-centroid association unreliable.
3. Use the supplied decryptor as a specification: here eight four-hex labels concatenate to 32 hex characters, `bytes.fromhex` gives a 16-byte AES key, and the mode is ECB.
4. Use decryption as an oracle only with strong validation: valid PKCS#7 padding alone can occur by chance; require coherent UTF-8/plaintext and the event flag format.
5. Keep automated OCR alternatives bounded around ambiguous glyphs (`B/8/6`, `D/B`, `0/9`) and confirm final labels from enlarged raster crops.
