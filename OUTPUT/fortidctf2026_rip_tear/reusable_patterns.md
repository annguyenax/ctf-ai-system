# Reusable patterns

- A modified PRNG table does not make observed transients equivalent to PRNG outputs. Establish the sound/event class, output transform, and exact call index before decoding bits.
- For a proposed pitch side channel, compare repeated instances of the same sound under a bounded resampling sweep. If no discrete scale differences appear, do not infer a bitstream from amplitude peaks alone.
- A deterministic transition animation can expose PRNG output through state boundaries. Fit both source and destination regions under the exact rendering recurrence, and check for lossy state maps: distinct table values may become observationally identical after clamping or reflection.
