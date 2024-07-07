# Automation-Nuclei 🤖

## Disclaimer!!!!

 Firstly , we must change the system's directory. You can do that by:

    nano vps.sh

 To check your System's username , Use command:
    
    whoami

 Now, Replace all the places of username from "andr0idh4ppi3r" to your system "username"


### Prerequisites
     Golang, Findomain, Subfinder, AssetFinder, Amass, Shufffledns, Puredns, knockpy, httpx, Nuclei 

### Installation & Usage

### For vps.sh
```
git clone https://github.com/CharanRayudu/Automation-Nuclei.git

cd Automation-Nuclei

chmod +x vps.sh

./vps.sh <example.com>
```
### For vps2.sh
```
chmod +x vps2.sh

./vps2.sh <example.com>
```

### For vps3.sh

This script automates subdomain enumeration and vulnerability scanning for a given domain. It performs the following steps:

1. Creates necessary directories and files for storing results.
2. Runs multiple tools (findomain, subfinder, assetfinder, knockpy, puredns) to gather subdomains.
3. Checks for live subdomains using httpx and scans for vulnerabilities using nuclei.
4. Consolidates and stores the results in specified files, cleaning up temporary files afterward.

## Usage

```bash
./vps3.sh <example.com>
```

### KeyUp:

    vps.sh: Basic script for domain scanning.
    vps2.sh: Incorporates multiple subdomain enumeration tools and resolves them through shuffleDNS.
    vps3.sh: Utilizes the latest tools with continuous updates, replacing Amass with knockpy, replacing shuffleDNS with pureDNS for enhanced functionality.
