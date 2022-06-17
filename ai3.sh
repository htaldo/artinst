#!/bin/bash

echo "STAGE 3: EXTRA"
echo 1 | doas pacman --noconfirm -S rust cargo python3 go fzf inkscape libreoffice krita blender bat 

#paru
cd ~/.local/src
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si 
sed -i '[bin]/s/^#//' /etc/paru.conf
sed -i 'Sudo=doas/s/^#//' /etc/paru.conf

echo 1 | paru simple-mtpfs 
echo 1 | paru lf 
echo 1 | paru pfetch
echo 1 | paru librewolf-bin 
echo 1 | paru betterlockscreen 
echo 1 | paru yt-dlp 
echo 1 | paru ytfzf 
echo 1 | paru urxvt-resize-font-git 
echo 1 | paru thokr-git 
echo 1 | paru sc-im
