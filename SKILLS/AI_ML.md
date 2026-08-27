# Skill - AI/ML model forensics

Use for checkpoints, adapters, tokenizers, embeddings, model extraction, adversarial ML, and prompt/model puzzles.

## Triage

1. Hash and inventory files; never load untrusted pickle-based models before format review.
2. Read configs/tokenizer metadata and identify base model, task, adapter type, target modules, ranks, dtypes, and vocabulary.
3. Inspect tensor names, shapes, sparsity, norms, and outliers before downloading/running the base model.
4. Decide whether the signal is static (weights/tokenizer/config) or behavioral (generation/logits/oracle).

## High-value branches

| Signal | First hypothesis |
|---|---|
| LoRA targets only embeddings | token-wise delta norm/rank and changed-token fingerprint |
| Added/suspicious tokenizer tokens | inspect token IDs, merges, special-token behavior |
| Output suppression/rambling | compare logits/ranks, constrained decoding, prefix probes |
| Small changed parameter subset | diff tensors and map parameters to model behavior |
| Remote model oracle | information-efficient prompts; cache results; respect rate limits |
| Pickle/joblib/torch archive | static archive inspection in isolation before deserialization |

## LoRA relation

For standard LoRA, derive the effective update from the adapter config and tensor orientation. Commonly:

```text
delta_W = (lora_alpha / r) * B @ A
```

Confirm shapes and framework conventions instead of assuming orientation. Rank the axis corresponding to vocabulary tokens when the target is an embedding table.

## Efficient workflow

1. Static tensor/tokenizer inspection.
2. Produce a small suspicious-token set with scores.
3. Tokenize likely flag prefixes and delimiters to understand fragmentation.
4. Probe next-token logits/ranks after controlled prefixes.
5. Use beam/constrained search only over evidence-backed tokens.
6. Repeat across prompts/seeds and compare against the base model when available.

## Verification

Generated flag-shaped text is a candidate. Verify with repeated independent prompts/seeds, logit or weight evidence, deterministic reconstruction, and preferably scoreboard acceptance. Record model revision and generation parameters.

See `PLAYBOOKS/misc_embedding_lora_extraction.md`.
