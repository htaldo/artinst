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

paru nvim
paru nvim-packer-git
paru lf 
paru librewolf-bin 
paru urxvt-resize-font-git
paru simple-mtpfs 
paru betterlockscreen 
paru pfetch
paru yt-dlp 
paru ytfzf  
paru thokr-git 
paru sc-im

curl -sS https://starship.rs/install.sh | doas sh
