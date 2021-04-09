# Automation-Nuclei

## Disclaimer!!!!

 Firstly , we must change the system's directory. You can do that by:

    nano vps.sh

 To check your System's username , Use command:
    
    whoami

 Now, Replace all the places of username from "andr0idh4ppi3r" to your system "username"


### Prerequisites
     Golang, Subfinder, AssetFinder, Amass, Shufffledns, httpx, Nuclei 

### Installation & Usage

### For vps.sh
```
>>git clone https://github.com/CharanRayudu/Automation-Nuclei.git

>>cd Automation-Nuclei

>>chmod +x vps.sh

>>./vps.sh <example.com>
```
### For vps2.sh
```
>>chmod +x vps2.sh

>>./vps2.sh <example.com>
```
### KeyUp:
    What actually differs between vps.sh and vps2.sh is, we will be considering multiple subdomain enumeration tools in vps2.sh and we resolve it through shuffleDNS, which will be more Accurate than vps.sh .
