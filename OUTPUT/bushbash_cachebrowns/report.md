# Report — bushbash_cachebrowns

## Goal

Authenticate to Java hash-browns service.

## Bug

`Integer == Integer` reference equality + Integer cache [-128,127]. Only permitted hash in range: **-110**.

## Exploit

MITM for `String.hashCode() == -110`, len ≥ 16 → `%xhaaaaaaaaaa:q~`.

## Flag

`bushbash{doNt-Dr1nk-jav4-foR-br3kkie}`
