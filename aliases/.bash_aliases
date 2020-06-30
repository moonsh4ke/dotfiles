#!/usr/bin/env bash

# apt aliases
alias apti='sudo apt install'
alias aptr='sudo apt remove'

# cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
#alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# file modifiers
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i -v'
mkd='mkdir -pv'

# processes
alias ka='killall'

## Git
alias g="git"
alias ga='git add'
alias gs='git status'
alias gu='git pull'
alias gg='git graph'
# unalias gd
alias gd='git diff'
alias gD='git ls-files'
  # Note that gs is also ghostscript
alias ghostscript="/usr/local/bin/gs"

## Jupyter
alias jc="jupyter console"
alias jco="jupyter nbconvert"
alias jn="jupyter notebook"
alias jn-b="jupyter notebook --no-browser"

