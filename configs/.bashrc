#
# ~/.bashrc
#

export VISUAL=nvim
export EDITOR="$VISUAL"
export GOPATH=/home/aldo/pro/go
export GOROOT=/usr/lib/go
export PATH=$GOPATH/bin:$GOROOT/bin:/home/aldo/.cargo/bin:/home/aldo/.local/bin:/home/aldo/.local/bin/statusbar:~/.local/bin/seldom:$PATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias bls="betterlockscreen"
alias lw="librewolf"
#alias d="nohup doas dmesg -T --follow < /dev/null > dmesgout 2>&1 &"
alias d="(nohup doas dmesg -T --follow < /dev/null) > dmesgout 2>&1 &"
alias s="startx |& tee .logstartx"
#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
clear
