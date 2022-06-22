#!/bin/sh

homdir='/home/aldo'
thdir='/home/aldo/.local/bin/res/th'

#change .Xresources
sed -i -f $thdir/$1/xres $homdir/.Xresources
#change dwm
sed -i -f $thdir/$1/dwm $homdir/.local/src/dwm-6.2/config.h
cd $homdir/.local/src/dwm-6.2; make clean install
#change dmenu
sed -i -f $thdir/$1/dmenu $homdir/.local/src/dmenu-5.0/config.h
cd $homdir/.local/src/dmenu-5.0; make clean install
#change .vimrc
sed -i -f $thdir/$1/vimrc $homdir/.vimrc
#change zathurarc
sed -i -f $thdir/$1/zathura $homdir/.config/zathura/zathurarc
#change wallpaper
sed -i -f $thdir/$1/xinitrc $homdir/.xinitrc
