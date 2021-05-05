# Nexusfont-config-generator

Script to automatically generate the library.xml file for configuring Nexusfont to take into account folders, subfolders and fonts from a single location. No need to update its configuration from the software to take into account new font folders.

![Image](https://github.com/Gyrfalc0n/Nexusfont-config-generator/blob/main/images/imgingest-8613251024470439574.png?raw=true)

## Use

This script is used to automatically generate the `library.xml` file which is the configuration file for font collections and font sets. It uses a defined directory as a base (root folder), and every folder in this same directory will be included in Nexusfont as a font collection. Within a font group created in this way, all subfolders and fonts will be grouped together.

It is possible to activate the recursion of the script so that each subfolder of the specified root folder will be added as a font collection containing the fonts present in that same subfolder.

The script will also add a font group containing everything from the root folder. (*All Font*)

## Why ?

I created this script in order to avoid having to configure the font groups directly from Nexusfont, but automatically.

I use it in a professional context, where all fonts are located in a folder accessible through the network, from which all computers with Nexusfont installed will come and get the fonts. With this script, I can automatically generate the configuration file, and deploy it on the machines via a GPO for example.

Users never have to modify the Nexusfont configuration, and it is updated each time the script is restarted to take into account the new folders added in the root folder.

## How to use and config ?

1. __Install__ [Nexusfont](https://www.xiles.app/) (works with portable version too)
2. __Enable__ Include subfolder

![subfolders](https://github.com/Gyrfalc0n/Nexusfont-config-generator/blob/main/images/subfolders.png)

3. __Download__ [config-generator.bat](https://github.com/Gyrfalc0n/Nexusfont-config-generator/blob/main/config-generator.bat) and [nexusfont-generator.py](https://github.com/Gyrfalc0n/Nexusfont-config-generator/blob/main/nexusfont-generator.py)
4. __Configure path__
In the file *config-generator.bat* set `output_path` to the destination path for the `library.xml` file
```batch
set output_path =your_path
```
Set your python path (path to the `python.exe` file) : replace *path_to_python_exe*
```batch
Rem "Your python3 path" "python generator file"
"path_to_python_exe" "nexusfont-generator.py"
```
5. __Comment or uncomment__ the *xcopy* line following your installation of Nexusfont (portable or not)
```batch
Rem IF BASIC NEXUSFONT INSTALL
Rem xcopy /s /y library.xml C:\Users\%USERNAME%\AppData\Roaming\nexusfont\
Rem IF PORTABLE NEXUSFONT INSTALL
xcopy /s /y library.xml path_to_nexusfont\userdata
```
If portable installation selected, set the `path_to_nexusfont` to the portable installation folder (replace with your path)
6. __Place__ *nexusfont-generator.py* into the specified output_path folder so that the script can execute it
7. __Configure font root folder__
In the file *nexusfont-generator.py* set `rootdir` to the font root folder (the folder containing all your subfolders and fonts)
```py
# rootdir is your font directory, the folder where you have all your subfolders with fonts. Dont forget to escape \ with \\
rootdir = "your root dir"
```
8. __Comment or uncomment__ `generator(it)` *line 8* if you want (or not) to include subfolders from your root folder to create Nexusfont group for each one
9. __It's done !__ You now just have to execute the `.bat` script file which will create the xml file according to your root folder and copy it to the configuration folder of Nexusfont.

Fell free to report any issue : https://github.com/Gyrfalc0n/Nexusfont-config-generator/issues
