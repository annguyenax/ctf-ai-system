# Reusable patterns — PhoneFarm

- Android “enter API key” UIs often only check non-empty in Java; the real compare is JNI/native on the first std::string.
- Immediate `0x6c6c6568` + `0x6f` is `"hello"` little-endian — search ARM64 `movk` chains.
- A long random string next to `Invalid API Key` can be a transport cryptor key, not the license.
- Challenge text “someone cracked it” often means the compare was replaced with a short backdoor (`hello`), not that you need OSINT on the nickname.
