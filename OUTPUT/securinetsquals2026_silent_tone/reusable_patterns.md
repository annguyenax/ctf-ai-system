# Reusable patterns

- Validate native capture chunks against duration before any DSP.
- Display pyramids can imitate sample spikes and corrupt carrier/timing estimates.
- ZC timing/CFO ambiguity needs a UID CRC or other independent pilot check.
- Compare repeated decoded codewords, including padding, before modelling cancellation.
- Subtract nonlinear/delayed strong-source reconstructions to expose weak emitters.
- Combine repetitions with phase refinement and bit-level RS erasures, but require
  an independent CRC; a codeword fitted with maximum erasures can still be wrong.
- A firmware-update clue need not force processing the updated segment when the
  pre-update segment already contains the required payloads.
