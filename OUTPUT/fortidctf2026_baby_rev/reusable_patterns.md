# Reusable pattern

## Trigger

A Python bytecode challenge exposes a phone keypad or touch-tone clue and a hash constraint.

## Method

Read constants statically. Map letters through the standard T9 keypad, preserve separators and digits, apply the indicated reversal, then compare with the embedded tone string. Use the hash to disambiguate words that share the same T9 sequence.

## Verification

Check the T9 transform and candidate hash independently against constants in the original artifact. Avoid executing the bytecode when static evidence is sufficient.

## Pitfalls

- T9 is many-to-one; a tone match alone does not uniquely identify words.
- A guessed phrase is not verified until its hash matches.
- Do not claim scoreboard acceptance based only on offline reproduction.
