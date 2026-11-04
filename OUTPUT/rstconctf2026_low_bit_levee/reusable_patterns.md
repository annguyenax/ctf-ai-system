# Reusable pattern

Signal: RGB least significant bits with length prefix.

Reading compressed IDAT bytes as if they were pixels is wrong. Ignoring the two-byte prefix also includes unrelated trailing bits.

Verify: replay, length/structure constraints, and evidence provenance.
