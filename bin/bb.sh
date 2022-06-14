query="$(echo -e '\c' | dmenu -p "open bookmarks:")"

if [ -n "$query" ]; then
	select="$(fzf -f "$query" < ~/.local/bin/res/bb.txt | dmenu -l 10)" && librewolf "$(echo "$select" | sed 's/^.* //')"
fi
