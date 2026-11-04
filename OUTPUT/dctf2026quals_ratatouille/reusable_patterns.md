# reusable — ratatouille

Signal: custom ELF section + host profile + FNV/xorshift constants.
Decision: hash literals, not live uname; decrypt section offline.
Method: PLAYBOOKS/elf_telemetry_fnv_xorshift_section.md
Verify: ASCII flag, length = section size.
Pitfalls: running the binary; field delimiter/order.
