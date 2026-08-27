# Playbook — C++ template / SFINAE constraint crackme → Z3

## Preconditions

- Source defines flag as template ints / chars.  
- Many `enable_if` / concept-style constraints on those values.  
- Flag body deleted or zeroed; only constraints remain.

## Minimal chain

1. Count variables (`FlagValue<0..N-1>` or similar).  
2. Catalog constraint macros/templates (`Lt`, `Equ`, …).  
3. Parse all constraint instantiations (robust arg splitter for nested `<>`).  
4. Map each to Z3 / SMT assertions.  
5. Bound to printable ASCII or known flag alphabet.  
6. `sat` → decode; extract `event{...}`.  
7. Optional: inject solution back into `FLAGMESSAGE(...)` and try compile.

## Success indicators

- `sat` with unique (or flag-shaped) model.  
- Message contains valid flag format.

## Fallbacks

- Underconstrained: add `bushbash{` prefix equalities.  
- Parse fail: dump unmatched constraint lines.  
- Too slow: bit-blast Bool for 7-bit ASCII, or use OR-Tools CP-SAT.

## Time-saving

Do **not** solve hundreds of inequalities by hand. One parser + Z3 beats hours of manual work — exactly what this challenge mocks.
