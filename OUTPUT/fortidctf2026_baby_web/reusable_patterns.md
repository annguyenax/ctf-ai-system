# Reusable pattern

## Trigger

A static HTML challenge describes a button or link that is difficult to click, while the page includes client-side JavaScript.

## Method

Read the DOM handlers and inspect every client-side constant. Reproduce string operations in their actual order; decode the result locally. For this challenge, concatenate all fragments first, reverse the complete string, then Base64-decode.

## Verification

Replay the deterministic solver and compare its output with an independent implementation and the expected flag format.

## Pitfalls

- Do not spend time automating mouse movement when the click handler is visible in source.
- Reverse the concatenated string as one value; reversing each fragment separately changes the result.
- Client-side obfuscation is not secrecy.
