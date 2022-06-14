#!/bin/sh

query="$(echo -e '\c' | dmenu -p "quickref")"
arr=($query)

if [ -n "$query" ]; then
	#en este caso, si solo se desea buscar en un directorio, es mejor hacer cd
	#que usar find y luego pasarlo a fzf
	cd ~/fl/lib
	dir="$(fzf -f "${arr[0]}" | head -1)"
	zathura "$dir" -P "${arr[1]}"
fi
