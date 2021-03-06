#°/bin/sh

options="1_ipn\n2_note"
select="$(echo -e $options | dmenu -p "create latex:")"
[ -z "$select" ] && exit
name="$(echo -e '\c' | dmenu -p "file name:")"
[ -z "$name" ] && exit

ltdir=fl/ipn/6/bsf/3

case $select in
	"1_ipn")
		#exit if ltdir is home (because of possible conflic with ~/pic)
		[ "$ltdir" == ~ ] && exit
		mkdir ~/$ltdir/pic
		cp ~/.local/bin/res/lt/0q.png ~/$ltdir/pic/0q.png
		cp ~/.local/bin/res/lt/ipn.tex ~/$ltdir/$name.tex
	;;	
	"2_note")
		cp ~/.local/bin/res/lt/note.tex ~/$ltdir/$name.tex
	;;
esac

urxvt -e vim ~/$ltdir/$name.tex
