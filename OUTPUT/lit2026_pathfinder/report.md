# pathfinder (LIT 2026)

## Summary
The binary verifies if the input is a valid sequence of 70 parentheses (35 open, 35 closed). It computes the 0-based lexicographical index of the sequence and expects it to be exactly 0x128e740722b291ad (1337133713371337133). We reverse this by computing the DP matrix (which counts valid paths to completion) and then finding the exact target valid sequence using unranking.

## Flag
LITCTF{((())((()))())(((()())))(()(()((((()())))))((()((())((())(()))))(())))}
