#
# ~/.bashrc
#

export VISUAL=vim
export EDITOR="$VISUAL"

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

source ~/vulkan/setup-env.sh

export PATH=/usr/local/cuda-10.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH

export PATH=/usr/local/mpi/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/mpi/lib:$LD_LIBRARY_PATH

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi 

#PS1='[\u@\h \W]\$ '
PS1='🚀@\W\$ '
#PS1='🚀 @\W\[(sgr0)\]$ '

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,build*}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-O": vim $(fzf);'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
