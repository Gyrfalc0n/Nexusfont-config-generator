import os
from os import path

def generator(rootdir):
    for it in os.scandir(rootdir):
        if it.is_dir():
            text = "<folder>" + it.path + "</folder>\n"
            #generator(it) uncomment this line to enable nexusfont group creation for any subfolder in your rootdir (reccursive)
            return text

# rootdir is your font directory, the folder where you have all your subfolders with font
rootdir = "your_root_dir"

f = open("library.xml", "w") # rewrite file
f.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
f.write("<library>\n")
f.write("<groups>\n")
f.write("<group name=\"Police Clients\" expanded=\"true\">\n")
f.write(generator(rootdir))
f.write("</group>\n")
f.write("<group name=\"Toutes les polices\" expanded=\"false\">\n")
text = "<folder>" + rootdir + "</folder>\n"
f.write(text)
f.write("</group>\n")
f.write("</groups>\n")
f.write("<sets/>\n")
f.write("</library>\n")
f.close()
