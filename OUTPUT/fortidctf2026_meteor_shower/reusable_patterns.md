# Reusable pattern

## Trigger

A retro console ROM contains a hidden screen that mentions Bacon and an unusual count such as five strips, while a button-input verifier processes a fixed-length bitstream.

## Method

1. Trace the 6502 verifier and determine the exact input-bit mapping and success condition.
2. Recover expected bits from the PRG tables using the loop's state initialization, index permutation, and bit formula.
3. Match the bit count to the hint: 95 bits form 19 groups of five.
4. Decode each 5-bit value as A=0 through Z=25 and apply the requested flag formatting.

## Verification

Independently recompute the bitstream from the raw ROM tables, verify that the decoded letters are within 0..25, then compare against the recorded platform acceptance.

## Pitfalls

- The visible Easter Egg prose is a cipher hint, not the flag itself.
- Read carry behavior precisely: the code accepts the input when the mismatch accumulator remains zero.
- Verify the controller mapping (A=0, B=1) before interpreting the bitstream.
