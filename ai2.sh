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
doas chmod +x *.sh

mkdir ~/.local/src
cd ~/.local/src
#install dwm
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
tar -xzvf dwm-6.2.tar.gz
cd dwm-6.2
wget https://dwm.suckless.org/patches/statuscmd/dwm-statuscmd-20210405-67d76bd.diff
patch < dwm-statuscmd-20210405-67d76bd.diff
rm dwm-statuscmd-20210405-67d76bd.diff
cp ~/artinst/configs/dwm-6.2/dwm.c ~/.local/src/dwm-6.2/dwm.c
cp ~/artinst/configs/dwm-6.2/config.h ~/.local/src/dwm-6.2/config.h
doas make clean install
cd ..
rm dwm-6.2.tar.gz
git clone https://github.com/LukeSmithxyz/dwmblocks.git
cd dwmblocks
wget https://dwm.suckless.org/patches/statuscmd/dwmblocks-statuscmd-20210402-96cbb45.diff
patch < dwmblocks-statuscmd-20210402-96cbb45.diff
rm dwmblocks-statuscmd-20210402-96cbb45.diff
cp ~/artinst/configs/dwmblocks/dwmblocks.c ~/.local/src/dwmblocks/dwmblocks.c
doas make clean install
#dwmblocks scripts
cd ~/.local/bin
git clone https://github.com/LukeSmithxyz/voidrice.git
cp -r voidrice/.local/bin/statusbar statusbar
cd statusbar
#TODO:verificar si el siguiente chmod no afecta a directorios
chmod +x *; cd
rm -rf ~./local/bin/voidrice

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
mkdir ~/.config ~/.newsboat ~/.config/gtk-3.0 ~/.config/zathura ~/.config/mupen64plus ~/.config/lf ~/.config/cmus
cp ~/artinst/configs/.bashrc ~/.bashrc
cp ~/artinst/configs/.bash_profile ~/.bash_profile
cp ~/artinst/configs/.xinitrc ~/.xinitrc
cp ~/artinst/configs/.Xresources ~/.Xresources
cp ~/artinst/configs/.vimrc ~/.vimrc
cp ~/artinst/configs/mimeapps.list ~/.config/mimeapps.list
cp ~/artinst/configs/picom.conf ~/.config/picom.conf
cp ~/artinst/configs/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp ~/artinst/configs/zathura/zathurarc ~/.config/zathura/zathurarc
cp ~/artinst/configs/mupen64plus/mupen64plus.cfg ~/.config/mupen64plus/mupen64plus.cfg
cp ~/artinst/configs/lf/lfrc ~/.config/lf/lfrc
cp ~/artinst/configs/.newsboat/config ~/.newsboat/config
cp ~/artinst/configs/cmus/kr.theme ~/.config/cmus/kr.theme

doas reboot
