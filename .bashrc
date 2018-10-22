#
# ~/.bashrc
#

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
#PS1="@\W\[$(tput sgr0)\]$"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
