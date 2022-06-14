#!/bin/bash

echo "STAGE 2: POST-INSTALL"
#mv ~/artinst/fonts/* /usr/share/fonts
doas pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xhost
doas pacman -S rust cargo python3 go fzf file acpi patch xdg-utils pulse-audio alsa-utils alsa-utils-doc alsa-lib alsaconf alsa-ucm-conf pamixer xclip maim zathura mpv zathura-djvu zathura-pdf-mupdf newsboat calcurse pfetch neofetch bat tmux cmus picom rxvt-unicode inkscape libreoffice krita blender
doas pacman -S gcc g++ libx11-dev libxft-dev libxinerama-dev ncurses dbus-x11 adwaita-gtk3-theme adwaita-icon-theme ttf-dejavu gtk3 setxkbmap video-intel-x68 light udisks2 dbus feh

#scripts
cp -r ~/artinst/bin ~/.local/bin

mkdir ~/.local/src
cd ~/.local/src
#install dwm
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
tar -xzvf dwm-6.2.tar.gz
cd dwm-6.2
cp ~/artinst/configs/dwm-6.2/config.h ~/.local/src/dwm-6.2/config.h
wget https://dwm.suckless.org/patches/statuscmd/dwm-statuscmd-20210405-67d76bd.diff
patch < dwm-statuscmd-20210405-67d76bd.diff
doas make clean install
cd ..
rm dwm-6.2.tar.gz
git clone https://github.com/LukeSmithxyz/dwmblocks.git
cd dwmblocks
doas make clean install
#dwmblocks scripts
cd ~/.local/bin
git clone https://github.com/LukeSmithxyz/voidrice.git
cp -r voidrice/.local/bin/statusbar statusbar
rm -rf voidrice

#install dmenu
wget https://dl.suckless.org/tools/dmenu-5.0.tar.gz
tar -xzvf dmenu-5.0.tar.gz
cd dmenu-5.0
cp ~/artinst/configs/menu-5.0/config.h ~/.local/src/menu-5.0/config.h
doas make clean install
cd ..
rm dmenu-5.0.tar.gz

#configs
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

#paru
cd ~/.local/src
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si 
sed -i '[bin]/s/^#//' /etc/paru.conf
sed -i 'Sudo=doas/s/^#//' /etc/paru.conf