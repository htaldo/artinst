#!/bin/sh

#pm - powermenu
select="$(echo -e '1)shutdown\n2)lock\n3)reboot\n4)flush\n9)suspend' | dmenu)"
case $select in
	"1)shutdown")
		doas /sbin/poweroff
	;;
	"2)lock")
		betterlockscreen -l blur
	;;
	"3)reboot")
		doas /sbin/reboot
	;;
	"4)flush")
		sync;  echo 3 > doas tee /proc/sys/vm/drop_caches
	;;
	"9)suspend")
		echo deep | doas /usr/bin/tee /sys/power/mem_sleep
		echo mem | doas /usr/bin/tee /sys/power/state
	;;
esac
