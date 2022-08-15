# Raspberry-PI-Minecraft-1.19.2-PaperMC-Server
A automatic installer for PaperMC that includes one click install and run using Minecraft 1.19.2 and Java 17.

- <b>Only works with a 32bit OS!</b>

# Installing
- Download `Install.sh` from the repository
- Put the script in a folder that the server will be in. 
```
$ mkdir Minecraft
$ cd Minecraft
```
- Open the folder in Terminal and run the following commands:
```
$ chmod +x Install.sh
$ sh Install.sh
```
- After the install is finisted, open eula.txt `$ nano eula.txt` and set eula to `true` and save then exit it `Ctrl O, Ctrl X` 
- Run the script again in Terminal using `$ sh Install.sh`.

# Running the server
- Open the server's folder in Terminal and run `$ sh Install.sh`. Don't worry, it won't install anything again. 

# Changing the ram size
- Edit `Install.sh` in the server folder and change `Ram='2G'` to how much ram you can surpply Java with. e.g. `Ram='2300MB'`.
- Save the file and run it again in Terminal. `$ sh Install.sh`
