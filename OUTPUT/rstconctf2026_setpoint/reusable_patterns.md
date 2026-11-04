# Reusable pattern

Signal: Modbus FC16 multi-register write.

Using only the low byte of each register discards half the message. Do not treat the acknowledgement as the write payload.

Verify: replay, length/structure constraints, and evidence provenance.
