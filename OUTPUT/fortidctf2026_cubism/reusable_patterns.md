# Reusable patterns
1. quirc (ZXing too on some versions) decodes fliplr(matrix) as transpose — anchor
   choice; dual-QR M & M.T puzzles reduce to linear algebra.
2. RS parity is GF(2)-linear in data bits: any "fill QR payload" task = Gaussian
   elimination, not search.
3. 3D "any voxel along black fiber" assembly = MILP; HiGHS handles 240 vars fast.
