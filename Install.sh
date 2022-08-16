#!/bin/bash

#--- Server Config ---

Ram='2G'  # 2048MB // The amount of ram the server will be using.

# Server ip will look something like this: 192.168.1.60 NOT 192.168.1.0/24
#                                          ------------     --------------

#--- --- --- ---

RED='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'

if [ -f "papermc.jar" ]; then # Check if papermc is installed
        toilet -f mono9 -F border --gay Minecraft
	printf "${NC}+ Server is using ${Ram} of ram.\n\n${Green}---- SERVER IP ----\n"
	ip route
	printf "\n"
	printf "+ Starting Server${NC}"
	./jdk-17.0.1+12/bin/java "-Xms${Ram}" "-Xmx${Ram}" -Dfml.queryResult=confirm -XX:+UseG1GC -jar "papermc.jar" --nogui 
else
	printf "${Green}+ Starting Install...${NC}\n"
	echo '                          [0%]\r'
	printf "${Green}+ Running sudo apt update...${NC}\n" 
	sudo apt update || error "The command 'sudo apt update' failed. Check your apt package-management system."
	printf "${Green}+ Installing toilet...${NC}\n" 
        sudo apt install toilet -y
	echo '>>>                       [20%]\r'
	sudo apt-get install screen -y
	echo '>>>>>>>                   [40%]\r'
	printf "${Green}+ Downloading Papermc 1.19.2...${NC}\n"
	wget -P . -O papermc.jar https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/130/downloads/paper-1.19.2-130.jar || printf "Could not download PaperMC. Check your internet."
	echo '>>>>>>>>>>>>>>            [60%]\r'
	printf "${Green}+ Downloading Java 17 32bit...${NC}\n"
	wget -P . https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	echo '>>>>>>>>>>>>>>>>>>>>>>>   [80%]\r'
	printf "${Green}Unzipping Java 17...${NC}\n"
	tar xzfv OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	echo '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
	sudo rm OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	printf "${Green}Starting PaperMC...\n\n-------------------\n"
	echo -n '-- Do you want to install recommended plugins to increase performance? (y/n):'
	read doinstall
	printf "${NC}"
	if [ $doinstall = 'y' ]
	then
		mkdir plugins
		printf "${Green}+ Starting Install of plugins...${NC}\n"
		sudo wget -P ./plugins "https://ci.codemc.io/job/Nathat23/job/StackMob-5/lastSuccessfulBuild/artifact/target/StackMob-5.8.3.jar"
		sudo wget -P ./plugins "https://ci.lucko.me/job/spark/332/artifact/spark-bukkit/build/libs/spark-1.9.33-bukkit.jar"
		sudo wget -P ./plugins "https://mediafiles.forgecdn.net/files/2734/790/SAML+1.3.5.jar" # These plugins are from curseforge.com
		sudo wget -P ./plugins "https://mediafiles.forgecdn.net/files/3198/633/Clearlag.jar"
		sudo wget -P ./plugins "https://mediafiles.forgecdn.net/files/2744/510/LaggRemover-2.0.6.jar"
		printf "${Green}+ Installed plugins${NC}\n"
	fi
	./jdk-17.0.1+12/bin/java -Xms1G -Xmx1G -jar "papermc.jar" --nogui
	printf "\n\n\n\n\n\n\n\n"
	toilet -f future -F border --gay Install compleat!
	printf "\n\n- Please agree to the eula (In eula.txt) and run this script again to start the server!\n"
fi
