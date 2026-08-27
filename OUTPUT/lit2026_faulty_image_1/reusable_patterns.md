# Reusable pattern
Periodically-inserted marker in a zlib/PNG stream is reversible: find the
equally-spaced marker bytes, strip on the stride, decompress, verify raw size
== h*(1+w*channels). Repetitive compressed bytes can be legit (flat color).
