# Reusable pattern
Flag hidden in a non-standard or bad-CRC PNG chunk while IDAT is a decoy.
tEXt often stores the key (may be hex). Payload may start with a big-endian
length prefix - skip it before XOR. Verify via round-trip.
