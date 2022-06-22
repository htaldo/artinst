#!/bin/sh

query="$(echo -e '\c' | dmenu -p "find dirs:")"

if [ -n "$query" ]; then
	fdirs="fl pic vid .local"

	select="$(find $fdirs -type d -print | fzf -f "$query" | dmenu -l 10)"

	#break multiline input (for multi-select)
	AUXIFS=$IFS
	IFS=$'\n'
	select=($select)
	IFS=$AUXIFS

	#open directory
	for (( i=0; i<${#select[@]}; i++ )); do urxvt -e lf "${select[$i]}"; done
fi
