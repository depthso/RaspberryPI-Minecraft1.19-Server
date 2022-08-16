# Minecraft 1.19.2 Minecraft Server for Raspberry Pi
An automatic installer for PaperMC and Java 17 for hosting your own Minecraft server running 1.19.2 with opition support for downloading performance incressing plugins  

![PaperMC](https://user-images.githubusercontent.com/86912923/184614427-7947327b-f847-4876-94fd-ec9e38c22351.png)

- <b>Only works with a 32bit OS!</b>
- <b>It's recomended to use a Raspberry pi 4 since chunk generating will be very slow!</b>
- <b>It is also highly recommended to overclock the pi to 2GHz and overvolt to 6!</b>

  <ol>
    <li><a href="#installing">Installing</a></li>
    <li><a href="#running-the-server">Running</a></li>
    <li><a href="#changing-the-ram-size">Changing the ram usage amount</a></li>
  </ol>

# Installing
- Create a folder for the server.
```
$ mkdir Minecraft
$ cd Minecraft
```
- Download `Install.sh` from the repository or using:
`wget https://raw.githubusercontent.com/depthso/RaspberryPIMinecraft1.19.2-Server/main/Install.sh `
- Build and run it
```
$ chmod +x Install.sh
$ sh Install.sh
```
- The install will promt you asking if you want to install plugins that are made to increase performance.
- After the install is finisted, open eula.txt or using `$ nano eula.txt` and set eula to `true` and save then exit it `Ctrl O, Ctrl X` 
- Run the script again in Terminal using `$ sh Install.sh`. <b>(The script has an install check)</b>

# Running the server
- Open the server's folder in Terminal and run `$ sh Install.sh`. Don't worry, it won't install anything again. 

# Changing the ram size
- Edit `Install.sh` using `nano Install.sh` in the server folder and change `Ram='2G'` to how much ram you can surpply Java with. e.g. `Ram='2300MB'`.
- Save the file and exit.
