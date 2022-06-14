#!/bin/sh

options="0_reset\n1_ss\n2_sr\n3_ff/fd\n4_dl\n5_lx"
select="$(echo -e $options | dmenu -p "change working dir for:")"

[ -z "$select" ] && exit

if [ "$select" = "0_reset" ]; then
	sed -i "s/ssdir=.*/ssdir=~\/pic\/ss/" ~/.local/bin/ss.sh
	sed -i "s/srdir=.*/srdir=~\/vid/" ~/.local/bin/sr.sh
	sed -i "s/dldir=.*/dldir=~\/fl\/dl/" ~/.local/bin/super.sh
	sed -i "s/ltdir=.*/ltdir=~/" ~/.local/bin/lt.sh
	sed -i 's/fdirs=.*/fdirs="fl pic"/' ~/.local/bin/ff.sh
	sed -i 's/fdirs=.*/fdirs="fl pic vid"/' ~/.local/bin/fd.sh
else
	cd
	query="$(echo -e "\c" | dmenu -p "find dir:")"

	#type - at the beginning to search a specific directory
	if [ -n "$(echo $query | grep ^-)" ]; then
		newdir="$(echo $query | cut -c2-)"
	else 
		raw="$(find fl pic vid -type d -print | grep "$query" | dmenu -l 10)"
		newdir="$(echo $raw | sed 's/\//\\\//g')" 
	fi
	case $select in
		"1_ss")
			sed -i "s/ssdir=.*/ssdir=$newdir/" ~/.local/bin/ss.sh
		;;
		"2_sr")
			sed -i "s/srdir=.*/srdir=$newdir/" ~/.local/bin/sr.sh
		;;
		"3_ff/fd")
			sed -i "s/fdirs=.*/fdirs=$newdir/" ~/.local/bin/ff.sh
			sed -i "s/fdirs=.*/fdirs=$newdir/" ~/.local/bin/fd.sh
		;;
		"4_dl")
			sed -i "s/dldir=.*/dldir=$newdir/" ~/.local/bin/super.sh
			sed -i "s/dldir=.*/dldir=$newdir/" ~/.local/bin/pb.sh
		;;
		"5_lx")
			sed -i "s/ltdir=.*/ltdir=$newdir/" ~/.local/bin/lt.sh
		;;
	esac
fi
