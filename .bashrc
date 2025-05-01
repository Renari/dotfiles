#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.config/godotenv/env" # Added by GodotEnv

[ -s "/home/arimil/.jabba/jabba.sh" ] && source "/home/arimil/.jabba/jabba.sh"
