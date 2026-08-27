# Reusable pattern

When structured records contain ordered coordinates, test a geometric interpretation before treating values as character codes. In chess PGN, repeated moves by one piece may be pen strokes: isolate side/piece, extract destination squares, connect them on an 8x8 grid, and preserve record order.

