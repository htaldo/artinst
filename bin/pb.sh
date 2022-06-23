#!/bin/sh

dldir=fl/dl

IFS=" "
if [ "$1" = "-p" ]; then
    string="$(xclip -o)"
else
    if [ "$1" = "-c" ]; then
        string="$(xclip -selection c -o)"
    fi
fi

arr=($string)

#check if string is a url (or mail address)
if [ -n "$(echo "$string" | grep "^.*@*.*\.[A-Za-z]\+.*")" ]; then
    #check if url is youtube
    if [ -n "$(echo "$string" | grep youtube)" ]; then
        menu="1) download audio\n2) download video\n3) mpv\n4) bookmark"
            select="$(printf "$menu" | dmenu -p "youtube URL:")"
            case $select in
                "1) download audio")
                    #~/fl/sc/notif.sh youtube-dl: downloading audio
                    yt-dlp -x --audio-format mp3 "$string"
                    #~/fl/sc/notif.sh youtube-dl: downloaded audio
                ;;
                "2) download video")
                    #~/fl/sc/notif.sh youtube-dl: downloading video
                    yt-dlp "$string"
                    #~/fl/sc/notif.sh youtube-dl: downloaded video
                ;;
                "3) mpv")
                    #~/fl/sc/notif.sh pb: starting mpv
                    mpv "$string"
                ;;
		"4) bookmark")
                    name="$(echo -e "\c" | dmenu -p "save as:")"
                    echo "$name" >> ~/.local/bin/res/bm.txt
                    echo "$string" >> ~/.local/bin/res/bm.txt
                ;;
            esac
    else
            menu="1) bookmark\n2) goto"
            select="$(printf "$menu" | dmenu -p "URL:")"
            case $select in
                "1) bookmark")
                    name="$(echo -e "\c" | dmenu -p "save as:")"
                    echo "$name" >> ~/.local/bin/res/bm.txt
                    echo "$string" >> ~/.local/bin/res/bm.txt
                ;;
                "2) goto")
                    cd $dldir
                    librewolf "$string"
                ;;
            esac

    fi
else
            menu="1) quickref\n2) browse\n"
            select="$(printf "$menu" | dmenu -p "plumb to:")"
            case $select in
                "1) quickref")
                    cd ~/fl/lib
                    dir="$(fzf -f "${arr[0]}" | head -1)"
                    zathura "$dir" -P "${arr[1]}"
                ;;
                "2) browse")
#                   librewolf "https://duckduckgo.com/?q=$string"
                    cd $dldir
                    librewolf "https://jisho.org/search/$string"
                ;;
            esac
fi
