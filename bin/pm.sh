#!/bin/sh

select="$(echo -e '1)shutdown\n2)lock\n3)reboot\n4)flush' | dmenu)"
case $select in
	"1)shutdown")
		shutdown now
	;;
	"2)lock")
		betterlockscreen -l
	;;
	"3)reboot")
		reboot
	;;
	"4)flush")
		sync;  echo 3 > doas tee /proc/sys/vm/drop_caches
	;;
esac
