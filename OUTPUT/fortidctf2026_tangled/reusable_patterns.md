# Reusable patterns

- For blueprint puzzles, parse the serialized object structure first; entity centers and tile coordinates may represent complementary layers on a shared grid.
- XORing occupancy maps can remove a decoy layer and expose a barcode even when either map alone does not decode.
- Independent QR decoders establish the recovered payload, not necessarily the final flag; portal rejection means the clue still needs interpretation.
- Keep old failed hypotheses as history, but mark the exact later solver/evidence that supersedes them.
