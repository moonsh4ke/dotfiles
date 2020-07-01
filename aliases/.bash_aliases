#!/usr/bin/env bash

# Python
alias python='python3'

# Get External IP / Internet Speed
alias myip="curl https://ipinfo.io/json" # or /ip for plain-text ip
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# Quickly serve the current directory as HTTP
alias serve='ruby -run -e httpd . -p 8000' # Or python -m SimpleHTTPServer :)
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

alias lxd="ls -lhF ${colorflag}"
alias lul="echo lul"
