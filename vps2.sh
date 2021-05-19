


#!/bin/bash


if [ ! -d "$1" ]; then
        mkdir -p /home/andr0idh4ppi3r/Recon/$1
        touch /home/andr0idh4ppi3r/Recon/$1/shuffledns.txt
        touch /home/andr0idh4ppi3r/Recon/$1/$1.txt
fi

findomain -q -t $1 | tee -a /home/andr0idh4ppi3r/Recon/$1/findomain.txt
subfinder -d $1 -o /home/andr0idh4ppi3r/Recon/$1/subfinder.txt
assetfinder -subs-only $1 | tee /home/andr0idh4ppi3r/Recon/$1/assetfinder.txt
amass enum -passive -norecursive -noalts -d $1 -o /home/andr0idh4ppi3r/Recon/$1/amass.txt
shuffledns -d $1 -w /usr/share/seclists/Discovery/DNS/deepmagic.com-prefixes-top500.txt -r resolvers.txt -o /home/andr0idh4ppi3r/Recon/$1/shuffledns.txt
cat /home/andr0idh4ppi3r/Recon/$1/*.txt > /home/andr0idh4ppi3r/Recon/$1/all.txt
shuffledns -list /home/andr0idh4ppi3r/Recon/$1/all.txt -r resolvers.txt -o /home/andr0idh4ppi3r/Recon/$1/listed.txt
sort -u /home/andr0idh4ppi3r/Recon/$1/listed.txt -o /home/andr0idh4ppi3r/Recon/$1/$1.txt
httpx -follow-host-redirects -l /home/andr0idh4ppi3r/Recon/$1/$1.txt | tee -a /home/andr0idh4ppi3r/Recon/$1/urls.txt
sort -u /home/andr0idh4ppi3r/Recon/$1/urls.txt | tee -a /home/andr0dh4ppi3r/Recon/$1/urls.txt
nuclei -silent -l /home/andr0idh4ppi3r/Recon/$1/urls.txt -t ~/nuclei-templates/
rm -rf /home/andr0idh4ppi3r/Recon/$1/all.txt
rm -rf /home/andr0idh4ppi3r/Recon/$1/listed.txt
