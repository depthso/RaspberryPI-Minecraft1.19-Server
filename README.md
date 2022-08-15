# Minecraft 1.19.2 Minecraft Server for Raspberry Pi
An automatic installer for PaperMC and Java 17 for hosting your own Minecraft server running 1.19.2

![PaperMC](https://user-images.githubusercontent.com/86912923/184614427-7947327b-f847-4876-94fd-ec9e38c22351.png)

- <b>Only works with a 32bit OS!</b>
- <b>It's recomended to use a Raspberry pi 4 since chunk generating will be very slow!</b>
- <b>It is also highly recommended to overclock the pi to 2GHz and overvolt to 6!</b>

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
