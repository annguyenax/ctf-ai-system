# Playbook — Boolean-oracle language jail

## Preconditions

- Interpreter accepts restricted expression.  
- Feedback only ok/error (or true/false).  
- Secret in env/file.

## Minimal chain

1. Map charset + 0-arity gadgets.  
2. Read handle (`env`, `open`, …).  
3. Reduce to integers (`length`, char codes).  
4. Local fingerprint table of math/error oracles.  
5. Prove uniqueness offline.  
6. Sparse remote queries → reconstruct.  
7. Positional access if needed (hard under charset).

## Success indicators

- Full flag unique under fingerprints + format check.

## Fallbacks

- Aggregates (sum/min/max/first/last) + constraints.  
- Local docker version pin.

## Time-saving

Never query remote before local collision-free DB.
