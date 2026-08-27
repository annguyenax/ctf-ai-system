# Playbook — PCAP forensics

## Preconditions

- `.pcap` / `.pcapng` provided.

## Minimal chain

1. `capinfos` / protocol hierarchy.  
2. Filter high-value: `http`, `ftp`, `smtp`, `dns`, websocket.  
3. Export HTTP objects / FTP data.  
4. Regex flag in `strings` / follow TCP stream.  
5. Reconstruct files (`tcpflow`, Wireshark export).  
6. Deeper: tunneled protocols, XOR “encryption”, malformed reassembly.

## Success indicators

- Flag in stream or extracted file.

## Fallbacks

- Carving endpoints; DNS exfil decode; TLS with provided key log.

## Time-saving

Keyword flag format before manual packet-by-packet.
