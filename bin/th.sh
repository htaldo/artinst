#!/bin/sh

homdir='/home/aldo'

#change .Xresources
sed -i -f $homdir/fl/sc/res/th/$1/xres $homdir/.Xresources
#change dwm
sed -i -f $homdir/fl/sc/res/th/$1/dwm $homdir/src/dwm-6.2/config.h
cd $homdir/src/dwm-6.2; make clean install
#change dmenu
sed -i -f $homdir/fl/sc/res/th/$1/dmenu $homdir/src/dmenu-5.0/config.h
cd $homdir/src/dmenu-5.0; make clean install
#change .vimrc
sed -i -f $homdir/fl/sc/res/th/$1/vimrc $homdir/.vimrc
#change zathurarc
sed -i -f $homdir/fl/sc/res/th/$1/zathura $homdir/.config/zathura/zathurarc
#change wallpaper
sed -i -f $homdir/fl/sc/res/th/$1/xinitrc $homdir/.xinitrc
