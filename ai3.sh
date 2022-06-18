#!/bin/bash

echo "STAGE 3: EXTRA"
echo 1 | doas pacman --noconfirm -S rust cargo python3 go fzf inkscape libreoffice krita blender bat 

#paru
cd ~/.local/src
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si 
doas sed -i '/\[bin\]/s/^#//' /etc/paru.conf
doas sed -i '/Sudo = doas/s/^#//' /etc/paru.conf

paru simple-mtpfs 
paru lf 
paru pfetch
paru librewolf-bin 
paru betterlockscreen 
paru yt-dlp 
paru ytfzf 
paru urxvt-resize-font-git 
paru thokr-git 
paru sc-im
