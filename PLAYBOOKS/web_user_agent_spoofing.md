# Web User-Agent Spoofing

**Trigger:** Server restricts access or shows different content based on the browser/bot, or hints mention specific browsers, mobile devices, or search engine bots (like Googlebot).

**Preconditions:**
- Target URL is known.
- The required User-Agent string can be guessed or is explicitly mentioned.

**Minimal Method:**
Use curl with the -A (or --user-agent) flag:
`ash
curl -s -A "Googlebot" http://target.com/
`
In Python:
`python
import requests
requests.get("http://target.com/", headers={"User-Agent": "Googlebot"})
`

**Verification:**
The response content or HTTP status code changes compared to a standard request.

**Pitfalls:**
- Some WAFs might block requests if the IP doesn't match known IP ranges for the spoofed bot (e.g., verifying Googlebot IPs).
