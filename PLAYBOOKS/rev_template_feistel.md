# Playbook — C++ template metaprogram = Feistel / real cipher

## Preconditions

- Obfuscated headers with type-lists, random names, `template` ops.  
- Embedded **key list** + **output array** / ciphertext path.  
- Loop combinator with fixed count (e.g. `HPFP<…, 16>`).  
- Flag slot zeroed (`KVRP` all zeros) but encrypt pipeline present.

## Minimal chain

1. Map primitive ops (`+ * % ^`, cons/nil, nth, env get/set).  
2. Find loop bound → likely **round count** (16 classic Feistel).  
3. Find pair walk over 18 / 2n bytes.  
4. Recover `F(R,k)` and key schedule constants.  
5. Invert Feistel round-by-round.  
6. Decode ASCII; wrap `event{…}` if needed.  
7. **Re-encrypt** must match challenge CT / `output[]`.

## Success indicators

- Re-encrypt == provided ciphertext exactly.  
- Flag format valid.

## Fallbacks

- Compile with known test plaintext if build works; diff type-level output.  
- Symbolic interpret one round in Python before full reverse.  
- If only constraints (no key/CT) → switch to `rev_template_z3` playbook.

## vs Z3-template challenges

| Feature | Feistel-template | Constraint-template |
|---------|------------------|---------------------|
| Key/CT | yes | no |
| Tool | reverse + script | Z3/SMT |
| Loop count | rounds | N/A |
| Flag tease | “maybe SFINAE next?” | “did you use z3?” |

## Time-saving

Name obfuscation is noise — tag **operators and loop depth** first, not identifiers.
