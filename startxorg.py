import os
import sys
import time

DESKTOP_ENVIRONMENTS  = {   # The Desktop Env Name and the command(s) to start it with.
    "xmonad":[ "xmonad"],
    "xfce4": ["startxfce4"],
    "gnome": ["export GDK_BACKEND=x11\n", "exec gnome-session"],
    "kde": ["export DESKTOP_SESSION=plasma\n","exec startplasma-x11"],
}

username = "sachin"

def removeLastLine(filename):
    file = open(filename)
    lines = file.readlines()
    del lines[-1]

    new_file = open(f"/home/{username}/.xinitrc", "w+")
    for line in lines:
        new_file.write(line)
    
    new_file.close()


if len(sys.argv) > 1:
    if DESKTOP_ENVIRONMENTS.__contains__(sys.argv[1]):
        removeLastLine(f'/home/{username}/.xinitrc')
        
        _file = open(f'/home/{username}/.xinitrc', "a")
        _file.writelines(DESKTOP_ENVIRONMENTS.__getitem__(sys.argv[1]))
        _file.close()
        print("Accessing Data...")
        time.sleep(0.45)
        print("Python Script Completed Successfully")
        time.sleep(0.55)
        os.system("startx")
    



        
