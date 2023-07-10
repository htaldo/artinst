#!/bin/bash

echo "STAGE 3: EXTRA"
#This can't be run as superuser - because makepkg
echo 1 | doas pacman --noconfirm -S rust cargo go
cargo install fcp
echo 1 | doas pacman --noconfirm -S fzf lf firefox
echo 1 | doas pacman --noconfirm -S neovim pamixer python3 pavucontrol

#paru
cd ~/.local/src
git clone https://aur.archlinux.org/paru.git
cd paru
#this lets paru build without using sudo
doas sed -i '/PACMAN_AUTH/{
	s/^#//
	s/()/(doas)/
}' /etc/makepkg.conf | grep AUTH
makepkg -si 
doas sed -i '/\[bin\]/s/^#//' /etc/paru.conf
doas sed -i '/Sudo = doas/s/^#//' /etc/paru.conf

#paru nvim-packer-git
#paru librewolf-bin 
paru urxvt-resize-font-git
paru simple-mtpfs 
paru betterlockscreen 
paru pfetch
paru yt-dlp 
paru ytfzf  
paru thokr-git 
paru sc-im

curl -sS https://starship.rs/install.sh | doas sh

echo 1 | doas pacman --noconfirm -S inkscape libreoffice
