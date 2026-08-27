# Web Execution After Redirect (EAR)

**Trigger:** A protected endpoint returns a 30x Redirect (e.g., to a login page) when accessed without authentication.

**Preconditions:**
- Target endpoint is known.
- The backend language (commonly PHP) continues executing code after sending the redirect header.

**Minimal Method:**
Use a tool that does NOT automatically follow redirects, such as curl or Burp Suite.
`ash
curl -i -s http://target.com/admin.php
`
If the response body contains HTML data rather than just empty content or a standard redirect message, EAR is present. 
You can interact with the page by passing the required parameters (e.g., ?action=delete) directly to the endpoint:
`ash
curl -i -s "http://target.com/admin.php?action=delete"
`

**Verification:**
The action is performed or sensitive data is leaked in the response body despite the 302 Found header.

**Pitfalls:**
- Modern frameworks usually abstract redirect logic to prevent this. It's most common in plain PHP scripts (missing die(); after header('Location: ...');).
