# terminal use and navigation
alias l='ls'
alias ll='ls -alh'
alias e='exit'
alias cl='printf "\033c"'
alias ba='vim ~/.bash_aliases'
alias p='cd ~/Documents/Progression'
alias v='cd ~/Documents/learningVulkan'
alias sc='cd ~/Documents/School'
alias ecs='cd ~/Documents/ecs/'
alias d='du -ahd1 | sort -h'

# git
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gck='git checkout'
alias gnb='git checkout -b'
alias gp='git pull'
alias gph='git push'
alias gphi='git push --set-upstream origin'
alias gb='git branch'
alias gs='git status'
alias gck='git checkout'
alias gr='git reset'
alias grh='git reset --hard'
alias gm='git merge'

# ssh
alias sa='ssh tyler147@apollo.cselabs.umn.edu'

# Development
alias m='make -j'
alias mr='make run'
alias mc='make clean'
alias mvc='make veryclean'
alias rd='cd ~/Downloads/renderdoc_1.2/bin && ./qrenderdoc'
alias python=python3
alias pip=pip3

export PYTHONPATH=$PYTHONPATH:/usr/local/cuda-10.0
