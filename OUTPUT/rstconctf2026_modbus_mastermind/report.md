# Modbus Mastermind

Status: needs_verification. No flag claimed. Two Modbus mirrors have different register maps. Mirror 1 exposes `ARMED!` and `MIND`, but the candidate derived from those words was rejected. Mirror 2 contains a repeated seven-word complement pattern and `04D2 600D 04D2` around registers 197–199; no verified decoding or flag yet.

SHOW evidence: `D:\download\CTFTimeWriteup\RSTCONCTF2026\Misc\Modbus Mastermind\solve\evidence\manifest.md`.

Next action: inspect official challenge hints/protocol details to map the repeated words to a narrow state transition before any further writes.
