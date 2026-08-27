# Cheat sheets (high-signal only)

## Flag formats (common)

`flag{…}`, `CTF{…}`, `jail{…}`, `BB{…}`, `picoCTF{…}`

## Web one-liners

```bash
# baseline
curl -sS -D- -o body.txt 'http://TARGET/' 

# ffuf single dir
ffuf -u 'http://TARGET/FUZZ' -w wordlist.txt -mc all -fc 404 -t 20
```

## Pwn

```bash
checksec --file=./bin
pwn cyclic 200
# pwntools template: process/remote, flat, ELF, ROP
```

## Crypto / hash

```bash
hashid '51f8…'
hashcat -m 0 hash.txt wordlist.txt
hashcat -m 0 hash.txt -a 3 '?l?l?l?l?l?l'
```

## Forensics

```bash
strings -n 8 file | rg -i 'flag\{|ctf\{'
tshark -r dump.pcap -Y http -T fields -e http.request.uri
binwalk -e firmware.bin
```

## Jail mindset

1. Charset map  
2. 0-arity inventory  
3. Secret handle  
4. Oracle model  
5. Offline first  
