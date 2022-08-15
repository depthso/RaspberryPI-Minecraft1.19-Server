#!/bin/bash

#--- Server Config ---

Ram='2G'  # 2048MB // The amount of ram the server will be using.
FileName='paper-1.19.2-125.jar' # Change this if you have renamed the server jar file.

# Server ip will look something like this: 192.168.1.60 NOT 192.168.1.0/24
#										   ------------     --------------

#--- --- --- ---

RED='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'

function error {
  echo -e "\e[91m$1\e[39m"
  exit 1
}

if [ -f "${FileName}" ]; then
	printf "${NC}+ Server is using ${Ram} of ram.\n\n${Green}---- SERVER IP ----\n"
	ip route
	printf "---- ---- ---- ---- ${NC}\nStarting Server"
	./jdk-17.0.1+12/bin/java "-Xms${Ram}" "-Xmx${Ram}" -jar "${FileName}" --nogui
else
	printf "${Green}+ Starting Install.${NC}\n"
	echo -ne '                          [0%]\r'
	printf "${Green}+ Running sudo apt update...${NC}\n" 
	sudo apt update || error "The command 'sudo apt update' failed. Check your apt package-management system."
	echo -ne '>>>                       [20%]\r'
	sudo apt-get install screen -y
	echo -ne '>>>>>>>                   [40%]\r'
	printf "${Green}+ Downloading Papermc 1.19.2...${NC}\n"
	wget -P . https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/125/downloads/paper-1.19.2-125.jar || error "Could not ownload PaperMC. Check your internet."
	echo -ne '>>>>>>>>>>>>>>            [60%]\r'
	printf "${Green}+ Downloading Java 17 32bit...${NC}\n"
	wget -P . https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	echo -ne '>>>>>>>>>>>>>>>>>>>>>>>   [80%]\r'
	printf "${Green}Unzipping Java 17...${NC}\n"
	tar xzfv OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
	sudo rm OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	printf "${Green}Starting PaperMC...${NC}\n"
	./jdk-17.0.1+12/bin/java -Xms1G -Xmx1G -jar paper-1.19.2-125.jar --nogui
	echo -ne '\n'
	error "- Please agree to the eula (In eula.txt) and run this script again to run the server."
fi
