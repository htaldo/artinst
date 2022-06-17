#
# ~/.bashrc
#

export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=/home/aldo/.cargo/bin:/home/aldo/.local/bin:$PATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
