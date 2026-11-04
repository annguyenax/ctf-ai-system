# EU Gift — FortID CTF 2026

Status: artifact-verified on 2026-10-10; not submitted to the platform.

Flag: `FortID{Erling_15_7h3_5olut10n_7o_Th3_Norw4y_Pr0bl3m}`

The handout's `blocked_countries` list contains bare YAML scalar `NO`. Under the configured PyYAML safe loader it becomes boolean `False`, so the string `NO` does not match the blocklist. Existing local protocol notes record a PID presentation accepted with `VERIFICATION_SUCCEEDED` and `issuing_country=NO`; the protected result route returned the retained JPEG showing the flag. The image hash and source archive hash are recorded in the event manifest.

Event artifacts: `D:/download/CTFTimeWriteup/FortIDCTF2026/Misc/EU Gift/`
