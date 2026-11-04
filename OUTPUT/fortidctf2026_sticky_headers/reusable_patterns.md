# Reusable patterns
1. Gateway smuggling: look for "1 request per connection" + lenient body parsing;
   chunked TRAILER sections (after 0\r\n) are a classic desync point — calibrate
   the byte offset the proxy swallows with a marker (XX prefix) experiment.
2. Hint decoding: "older courier protocol" = old HTTP encoding, "more than one
   encoding" = Transfer-Encoding; "sticky" = the leftover bytes stick to the next
   request.
3. After ACL bypass, staff preview fields are prime SSTI spots; test {{7*7}}
   first, then builtins-chain file read.
4. robots.txt on gated apps often names the private form fields.
