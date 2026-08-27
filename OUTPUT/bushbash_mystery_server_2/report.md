# Report — bushbash_mystery_server_2

## Goal

Chained from mystery server I: "trigger a bug on the server so we can find a
debug code while the server recovers" on the same `nc 34.40.133.67 6767`.

## Enumeration

Reused DWARF recovery from part I. `ReadMultipleMessages` struct (field 5,
unused by the CLI) = `{ start: u32, count: u32 }` — confirmed via disassembly
of its `encode_raw` (skip-if-zero field encoding, tag 1=start varint, tag
2=count varint).

Live protocol testing showed: `count` = number of *additional* indices read
beyond `start` (i.e. reads indices `[start, start+count]` inclusive — total
`count+1` responses). `count=0` → explicit rejection ("You can't read 0
messages"); normal in-range values → repeated "No message at that index".

## Exploitation

`start = u32::MAX (4294967295)`, `count = 1` → server computes `start + count`
in u32 arithmetic with overflow checks enabled (debug build) → panics. The
panic is caught by a top-level handler that responds directly on the same
connection with the debug/flag text before "restarting".

Wire bytes: `0B 2A 08 08 FF FF FF FF 0F 10 01 00` (len=11, field5 len-delim,
inner: field1=4294967295 varint, field2=1 varint, trailing NUL).

## Flag

`bushbash{u32_0v3rfl1w!}`

## Note

No crash/DoS risk beyond the single panicking connection — response arrived in
under a second, no need for repeated attempts or large loops.
