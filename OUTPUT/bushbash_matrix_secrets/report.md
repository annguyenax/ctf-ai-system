# Report — bushbash_matrix_secrets

## Goal

Recover the hidden flag from the provided PEFT LoRA adapter for the BushBash2026 misc challenge `matrix_secrets`.

## Approach

The challenge uses a LoRA adapter that only updates `embed_tokens`. That means the fine-tuning footprint lives in the embedding table rather than in the transformer weights. By inspecting the adapter tensors directly and computing the LoRA delta $\Delta W = (\alpha/r)BA$, the changed tokens can be identified from the embedding-column norms.

The strongest suspicious tokens include `bush`, `bash`, `code`, `launch`, `0`, `3`, and the brace characters. Repeated sampling from prompts such as `The code` or `The launch` consistently produced the flag candidate:

`bushbash{vect0rl3ak}`

## Flag

`bushbash{vect0rl3ak}`
