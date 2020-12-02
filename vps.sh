  
#!/bin/bash


if [ ! -d "$1" ]; then
        mkdir -p /home/andr0idh4ppi3r/Recon/$1
fi

amass enum -passive -norecursive -noalts -d $1 -o /home/andr0idh4ppi3r/Recon/$1/$1.txt
cat /home/andr0idh4ppi3r/Recon/$1/$1.txt | httpx -o /home/andr0idh4ppi3r/Recon/$1/$1httpx.txt
cat /home/andr0idh4ppi3r/Recon/$1/$1httpx.txt | nuclei -t ~/nuclei-templates/ 
rm -fr /home/andr0idh4ppi3r/Recon/$1/$1.txt
