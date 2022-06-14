#!/bin/sh

#get raw filename from primary selection
raw="$(xclip -o )"
#format the filename properly
#(if $raw is left as it is, ~ won't expand to /home/user)
if [ -n "$(echo $raw | grep '~')" ]; then
	file="$(echo ~ $raw | sed 's/ ~//g')"
else file=$raw
fi

#read filetype
ext=$(echo $file | sed 's/.*\.//')

#~/fl/sc/notif.sh compiling $ext file...

#change to home
cd ~

#autocompile with entr
case $ext in
	"tex") echo $file | entr pdflatex $file;;
	"c") echo $file | entr gcc -g -Wall -lm $file;;
	"go") echo $file | entr go build $file;;
esac

#TODO	mandar notificación de si se pudo compilar o no
#	terminar la instancia actual cuando se cierre el editor
#	cambiar a directorio del archivo en vez de home
