
#!/bin/bash


if [ ! -d "$1" ]; then
        mkdir -p /home/andr0idh4ppi3r/Recon/$1
        touch /home/andr0idh4ppi3r/Recon/$1/shuffledns.txt
        touch /home/andr0idh4ppi3r/Recon/$1/$1.txt
fi

subfinder -d $1 -o /home/andr0idh4ppi3r/Recon/$1/subfinder.txt
assetfinder -subs-only $1 | tee /home/andr0idh4ppi3r/Recon/$1/asset.com
amass enum -passive -norecursive -noalts -d $1 -o /home/andr0idh4ppi3r/Recon/$1/amass.txt
shuffledns -d $1 -w /usr/share/seclists/Discovery/DNS/deepmagic.com-prefixes-top500.txt -r resolvers.txt -o /home/andr0idh4ppi3r/Recon/$1/shuffledns.txt
cat /home/andr0idh4ppi3r/Recon/$1/*.txt > /home/andr0idh4ppi3r/Recon/$1/all.txt
shuffledns -list /home/andr0idh4ppi3r/Recon/$1/all.txt -r resolvers.txt -o /home/andr0idh4ppi3r/Recon/$1/$1.txt
cat /home/andr0idh4ppi3r/Recon/$1/$1.txt | httpx -o /home/andr0idh4ppi3r/Recon/$1/$1httpx.txt
cat /home/andr0idh4ppi3r/Recon/$1/$1httpx.txt | nuclei -t ~/nuclei-templates/
rm -fr /home/andr0idh4ppi3r/Recon/$1/$1.txt
