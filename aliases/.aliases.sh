# quick access to cfg files
alias acfg='nvim ~/dotfiles/terminal/.alacritty.yml'
alias vcfg='nvim ~/.config/nvim/init.vim'
alias zcfg='nvim ~/.zshrc'
alias tcfg='nvim ~/.tmux.conf'
# refresh config
alias rf='source ~/.zshrc'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# package manager aliases
alias apti='sudo apt install'
alias aptr='sudo apt remove'
alias snapi='sudo snap install'
alias snapr='sudo snap remove'

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

# chmod
alias chmx='chmod +x'

# file modifiers
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

alias mkd='mkdir -pv'
alias open='xdg-open'

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

# python
alias python='python3'

# vim
alias v='nvim'

# fzf
alias ve='vim -o `fzf`'

#
# Misc
#

# Get External IP / Internet Speed
alias myip="dig +short myip.opendns.com @resolver1.opendns.com" # or /ip for plain-text ip
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

alias q='exit'
