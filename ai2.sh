#!/bin/bash

echo "STAGE 2: POST-INSTALL"
#mv ~/artinst/fonts/* /usr/share/fonts
doas sv up dhcpcd
doas sv up iwd

#network=$1
#iwctl station wlan0 scan
#iwctl station wlan0 connect "$network"

doas pacman --noconfirm -Rsn sudo
#graphics (for virtualbox)
#doas pacman --noconfirm -S xf86-video-fbdev
#graphics (for intel)
doas pacman --noconfirm -S xf86-video-intel mesa lib32-mesa vulkan-intel

doas pacman --noconfirm -S xorg xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xhost file acpi patch xdg-utils 
doas pacman --noconfirm -S pulseaudio pulseaudio-alsa alsa-utils alsa-lib pamixer 
doas pacman --noconfirm -S xclip maim zathura mpv zathura-djvu zathura-pdf-mupdf newsboat calcurse neofetch tmux cmus picom rxvt-unicode
doas pacman --noconfirm -S gcc libx11 libxinerama libxft ncurses dbus adwaita-icon-theme ttf-dejavu gtk3 light udisks2 dbus feh

#scripts
mkdir ~/.local
cp -r ~/artinst/bin ~/.local/bin
cd ~/.local/bin
doas chmod -R +x *.sh

mkdir ~/.local/src
cd ~/.local/src
#install dwm
wget https://dl.suckless.org/dwm/dwm-6.4.tar.gz
tar xzvf dwm-6.2.tar.gz
cd dwm-6.4
cp ~/artinst/configs/dwm-6.4/config.h ~/.local/src/dwm-6.4/config.h
doas make clean install
cd ..
rm dwm-6.4.tar.gz
git clone https://github.com/torrinfail/dwmblocks
cd dwmblocks
make
cp ~/artinst/configs/dwmblocks/blocks.h ~/.local/src/dwmblocks/blocks.h
doas make clean install
#dwmblocks scripts
cd ~/.local/bin/statusbar
#TODO:verificar si el siguiente chmod no afecta a directorios
#chmod +x *; cd

#install dmenu
cd ~/.local/src
wget https://dl.suckless.org/tools/dmenu-5.0.tar.gz
tar -xzvf dmenu-5.0.tar.gz
cd dmenu-5.0
cp ~/artinst/configs/dmenu-5.0/config.h ~/.local/src/dmenu-5.0/config.h
doas make clean install
cd ..
rm dmenu-5.0.tar.gz

#configs
mkdir ~/.config ~/.newsboat
cp ~/artinst/configs/.bashrc ~/.bashrc
cp ~/artinst/configs/.bash_profile ~/.bash_profile
cp ~/artinst/configs/.xinitrc ~/.xinitrc
cp ~/artinst/configs/.Xresources ~/.Xresources
cp ~/artinst/configs/.vimrc ~/.vimrc
cp -r ~/artinst/configs/.config ~/.config

doas reboot
