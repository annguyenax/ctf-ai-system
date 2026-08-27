# Report — bushbash_turned_around

## Goal

Recover password from turned-around Brainfuck.

## Enumeration

Standard BF → decoy message. Title implies reverse/orientation.

## Exploitation

Orientation transforms expose halves `(d0Ub13*_______` and `________-*b4ck!`; mask-merge.

## Flag

`bushbash{(d0Ub13*-*b4ck!}`
