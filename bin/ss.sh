#!/bin/sh

ssdir=fl/ipn/6/bsf/3/pic

case $1 in
	"-s") 
		maim -u -s | xclip -selection clipboard -t image/png 
	;;
	"-x")
		maim -u | xclip -selection clipboard -t image/png
	;;
	"-a")
		name=$(echo -e "\c" | dmenu -p "save as")
		if [ -d $name ]
		then
			maim -u -s $ssdir/$(date +%s).png
		else
			maim -u -s $ssdir/$name.png
		fi 
	;;	
	"-z")
		maim -u $ssdir/$(date +%s).png 
	;;
esac
