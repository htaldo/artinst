#!/bin/sh

case $1 in
	"-c") 
		urxvt -e calcurse
	;;
	"-e")
		urxvt -e lf
	;;
	"-f")
		librewolf
	;;
	"-m") 
		urxvt -e cmus
	;;
	"-n") 
		urxvt -e newsboat
	;;
	"-p") 
		cd ~/.wine/drive_c/Program\ Files\ \(x86\)/ProSim\ Ternary\ Diagram
		WINEARCH=win32 WINEPREFIX=~/.wine/prosim wine Ternaire.exe
	;;
	"-s")
		dldir=~/fl/dl
		cd $dldir; surf duckduckgo.com
	;;
	"-t")
		teams --disable-seccomp-filter-sandbox
	;;
	"-v")
		urxvt -e vim
	;;
	"-w")
		urxvt -e w3m duckduckgo.com 
	;;
	"-y")
		urxvt -e ytfzf
	;;
esac
