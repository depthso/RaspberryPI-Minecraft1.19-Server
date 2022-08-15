RED='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'


## Server Config

Ram='2G'  # 2048MB // The amount of ram the server will be using.

##

# Server ip will look something like this: 192.168.1.60 NOT 192.168.1.0/24
#										   ------------     --------------


if [ -f "paper-1.19.2-125.jar" ]; then
	printf "${NC}+ Server is using ${Ram} of ram.\n\n${Green}---- SERVER IP ----\n"
	ip route
	printf "---- ---- ---- ---- ${NC}\nStarting Server"
	./jdk-17.0.1+12/bin/java "-Xms${Ram}" "-Xmx${Ram}" -jar paper-1.19.2-125.jar --nogui
else
	printf "${Green}+ Starting Install.${NC}\n"
	sudo apt-get update -y
	sudo apt-get install screen -y
	printf "${Green}+ Downloading Papermc 1.19.2...${NC}\n"
	sudo wget -P . https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/125/downloads/paper-1.19.2-125.jar
	printf "${Green}+ Downloading Java 17 32bit...${NC}\n"
	sudo wget -P . https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	printf "${Green}Unzipping Java 17...${NC}\n"
	tar xzfv OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	sudo rm OpenJDK17U-jdk_arm_linux_hotspot_17.0.1_12.tar.gz
	printf "${Green}Starting PaperMC...${NC}\n"
	./jdk-17.0.1+12/bin/java -Xms1G -Xmx1G -jar paper-1.19.2-125.jar --nogui
	printf "\n\n${Red}- Please agree to the eula (In eula.txt) and run this script again to run the server.${NC}\n"
fi
