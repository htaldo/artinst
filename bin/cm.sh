#!/bin/sh

case "$1" in
	"-p")
		cmus-remote -u
	;;
	"-j")
		cmus-remote -v -5%
	;;
	"-k")
		cmus-remote -v +5%
	;;
	"-l")
		cmus-remote -n
	;;
	"-h")
		cmus-remote -r
	;;
esac
