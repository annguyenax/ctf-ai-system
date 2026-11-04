# Reusable pattern

## Trigger

A program passes user-controlled text directly to `printf` and a separate menu action checks a global authorization value.

## Method

Use the format-string bug to leak a PIE pointer, calculate the PIE base, and write the required integer to the authorization global. Then invoke the guarded action that prints the flag.

## Verification

Confirm the exact `printf(user_input)` sink and gate in source or disassembly. A scoreboard acceptance record is strong confirmation of the final candidate; do not treat a plausible `%n` payload alone as proof.

## Pitfalls

- The format argument index and PIE offsets are binary-specific; verify them against the exact artifact.
- A short `%n` write must emit the intended byte count and point to the correct writable address.
- Replaying a network solver can submit a flag and write local files; inspect its effects before rerunning it.
