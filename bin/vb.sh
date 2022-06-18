#!/bin/sh

case "$1" in
	"-j")
		pamixer -i 2
	;;
	"-k")
		pamixer -d 2
	;;
	"-l")
		light -A 1
	;;
	"-h")
		light -U 1
	;;
esac
