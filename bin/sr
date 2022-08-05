#!/bin/sh

#sr - screen record
procs="$(pgrep sr)"
if [ "$(echo "$procs" | wc -l)" -gt 1 ]; then
	#~/fl/sc/notif.sh sr: stopping recording...
	othproc="$(echo "$procs" | grep -v $$)"
	pkill -15 -P $othproc
else	
	srdir=~/vid
	cd $srdir
	name="$(~/fl/sc/sd)"
	#(~/fl/sc/sb.sh "$(echo o rec)")&
	ffmpeg -f x11grab -framerate 25 -s 1366x768 -i :0.0 -f pulse -ac 2 -i 0 "$name.mkv" 
fi
