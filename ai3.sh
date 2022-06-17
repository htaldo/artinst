#!/bin/bash

echo "STAGE 3: EXTRA"
doas pacman --noconfirm -S rust cargo python3 go fzf inkscape libreoffice krita blender bat pfetch
echo 1 | paru simple-mtpfs 
echo 1 | paru lf 
echo 1 | paru librewolf-bin 
echo 1 | paru betterlockscreen 
echo 1 | paru yt-dlp 
echo 1 | paru ytfzf 
echo 1 | paru urxvt-resize-font-git 
echo 1 | paru thokr-git 
echo 1 | paru sc-im
