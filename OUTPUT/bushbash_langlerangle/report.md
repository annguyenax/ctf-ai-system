# Report — bushbash_langlerangle

## Goal

Recover 214-character message / flag from deleted `FLAGMESSAGE` via template constraints.

## Environment

- `out.cpp` with SFINAE constraint structs  
- No runtime binary required  

## Enumeration

Constraint types map to arithmetic/comparisons; 1581 instances.

## Exploitation

Z3 model over printable ASCII; decode to string containing flag.

## Verification

`sat`; flag token `bushbash{d1d_y0U_Us3_z3?}` matches format and author taunt.

## Flag

`bushbash{d1d_y0U_Us3_z3?}`
