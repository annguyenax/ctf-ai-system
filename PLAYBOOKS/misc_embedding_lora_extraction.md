# Playbook - embedding-only LoRA secret extraction

## Trigger

- PEFT/LoRA adapter is supplied with tokenizer/config.
- `target_modules` contains only `embed_tokens` or another vocabulary-facing embedding.
- Normal generation is evasive, repetitive, or hides the likely secret.

## Minimal method

1. Inspect adapter config and safetensor keys/shapes without loading executable model code.
2. Compute the effective LoRA update using the configured scale and verified tensor orientation.
3. Rank per-token update norms; decode the highest-ranked token IDs.
4. Separate narrative/training-template tokens from flag alphabet/prefix/body candidates.
5. Inspect tokenizer segmentation for the event prefix, braces, digits, and suspicious fragments.
6. Probe logits after controlled prefixes and compare multiple prompts; compare base vs adapter when possible.
7. Run constrained/beam reconstruction over the evidence-backed token set.
8. Verify the same candidate through independent prompts/seeds and static token evidence; submit to the scoreboard when available.

## Evidence to retain

- artifact hashes, adapter/base revisions, config;
- tensor names/shapes and delta formula;
- ranked token table with IDs, decoded text, and norms;
- prompt, seed, decoding parameters, output, and next-token ranks;
- solver script and final verification result.

## Pitfalls

- Matrix orientation differs across modules/framework versions.
- A high-norm token may reflect formatting or cover-story text.
- Token decoding is not character decoding; braces/prefix may split unexpectedly.
- One sampled generation is not verification.
- Loading untrusted pickle checkpoints can execute code; prefer safetensors/static archive inspection.

## Faster path

When only embeddings are targeted, do static delta ranking before downloading or running the full base model.
