# Reusable patterns

- For Modbus CTFs, compare independent mirrors before assuming they share state or memory.
- Treat function-code echoes as protocol acknowledgments; verify register readback and neighboring data.
- Preserve and restore a register after a reversible test write; a successful FC06 echo alone does not establish application-level state transition.
- Familiar hex constants and plausible ASCII fragments are leads, not flags. Use official acceptance or independent reconstruction.
