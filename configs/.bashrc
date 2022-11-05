#
# ~/.bashrc
#

export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=/home/aldo/.cargo/bin:/home/aldo/.local/bin:/home/aldo/.local/bin/statusbar:~/.local/bin/seldom:$PATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias bls="betterlockscreen"
alias s="startx |& tee .logstartx"
#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
