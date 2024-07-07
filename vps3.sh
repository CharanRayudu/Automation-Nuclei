#!/bin/bash

# Check if the directory for the domain does not exist, then create it
if [ ! -d "/home/andr0idh4ppi3r/Recon/$1" ]; then
    mkdir -p /home/andr0idh4ppi3r/Recon/$1
    touch /home/andr0idh4ppi3r/Recon/$1/$1.txt
    touch /home/andr0idh4ppi3r/Recon/$1/urls.txt
fi

# Run subdomain enumeration tools
findomain -q -t $1 | tee -a /home/andr0idh4ppi3r/Recon/$1/findomain.txt
subfinder -silent -d $1 -o /home/andr0idh4ppi3r/Recon/$1/subfinder.txt
assetfinder -subs-only $1 | tee -a /home/andr0idh4ppi3r/Recon/$1/assetfinder.txt

# Run knockpy with recon and bruteforce options
knockpy -d "$1" --recon --bruteforce --save /home/andr0idh4ppi3r/Recon/$1
file=$(ls /home/andr0idh4ppi3r/Recon/$1/*.json | head -n 1)
jq -r '.[].domain' "$file" > /home/andr0idh4ppi3r/Recon/$1/knockpy.txt

# Run puredns for bruteforce subdomain enumeration
puredns bruteforce /usr/share/seclists/Discovery/DNS/deepmagic.com-prefixes-top50000.txt $1 > /home/andr0idh4ppi3r/Recon/$1/puredns.txt

# Combine all subdomains into one file and remove duplicates
cat /home/andr0idh4ppi3r/Recon/$1/findomain.txt /home/andr0idh4ppi3r/Recon/$1/subfinder.txt /home/andr0idh4ppi3r/Recon/$1/assetfinder.txt /home/andr0idh4ppi3r/Recon/$1/knockpy.txt /home/andr0idh4ppi3r/Recon/$1/puredns.txt > /home/andr0idh4ppi3r/Recon/$1/all.txt
sort -u /home/andr0idh4ppi3r/Recon/$1/all.txt -o /home/andr0idh4ppi3r/Recon/$1/$1.txt

# Use httpx to check for live subdomains and store URLs
httpx -silent -follow-host-redirects -l /home/andr0idh4ppi3r/Recon/$1/$1.txt -o /home/andr0idh4ppi3r/Recon/$1/urls.txt
sort -u /home/andr0idh4ppi3r/Recon/$1/urls.txt -o /home/andr0idh4ppi3r/Recon/$1/urls.txt

# Run nuclei for vulnerability scanning on the collected URLs
nuclei -silent -l /home/andr0idh4ppi3r/Recon/$1/urls.txt

# Cleanup
rm -rf /home/andr0idh4ppi3r/Recon/$1/all.txt