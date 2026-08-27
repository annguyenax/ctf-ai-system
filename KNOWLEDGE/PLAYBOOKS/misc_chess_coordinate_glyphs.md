# Chess move coordinates as drawn glyphs

## Signal

- A PGN contains many artificial-looking moves by the same piece.
- Successive destinations are mostly horizontal, vertical, or diagonal neighbours.
- The number of games is close to the length of a short message.
- Engine evaluation does not expose one stable anomaly per game.

## Workflow

1. Parse games in their original order.
2. Separate moves by side and piece.
3. For each game, collect the destination square of the repeatedly moved piece.
4. Plot consecutive destinations as a polyline on an 8x8 coordinate grid.
5. Render all games as a labelled contact sheet and read the glyphs in game order.
6. Re-run from the original PGN and preserve the input hash plus coordinate lists.

For SAN, extract the destination square at the end of the token rather than slicing at a fixed offset. Captures, checks, mates, and promotions add punctuation such as `x`, `+`, `#`, or `=Q`.

## Triage heuristic

Before spending time on a chess engine, print the move counts per piece and the coordinate sequences. Repeated movement by one high-mobility piece can encode strokes. If engine scores oscillate around mate without yielding a consistent selection rule, treat that as evidence against the engine hypothesis.

## Pitfalls

- Adding a piece's normal starting square when the encoding begins at its first destination.
- Mixing both colours or multiple pieces.
- Reordering games by player, date, or result.
- Treating square names as byte values instead of geometry.
- Overfitting noisy engine evaluations instead of testing the visible coordinate pattern.

