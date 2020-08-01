# quick access
alias aliases='nvim ~/.aliases.sh'
alias acfg='nvim ~/dotfiles/terminal/.alacritty.yml'
alias nvcfg='nvim ~/.config/nvim/init.vim'
alias zcfg='nvim ~/.zshrc'
alias tcfg='nvim ~/.tmux.conf'
alias nv='nvim'
alias e='nvim'
# refresh config
alias rf='source ~/.zshrc'
alias td='nvim ~/Documents/notes/todo.txt'
alias shistory='nvim ~/.shistory.sh' 
# local folders
alias horario='xdg-open ~/Pictures/HorarioPulentoso.jpg'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# package manager aliases
alias apti='sudo apt install'
alias aptr='sudo apt remove'
alias apts='sudo apt search'
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
# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# ls aliases
# alias ll='ls -lahp'
# alias la='ls -Ap'
# alias l='ls -p'

# Exa
alias l="exa --icons --group-directories-first"
alias la="exa --icons --group-directories-first -a"
alias ll="exa --icons --group-directories-first -lhg"

# chmod
alias chmx='chmod +x'

# file management, modifiers, etc.
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

alias mkd='mkdir -pv'
alias o='xdg-open'
alias open='xdg-open'

alias df='df -h'
alias du='du -h'
alias dul='du -sh $(ls -p) | sort -hr'
alias dula='du -sh $(ls -Ap) | sort -hr'

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
alias cdgr='cd "$(git root)"'

## Jupyter
# alias jc="jupyter console"
# alias jco="jupyter nbconvert"
alias jn="jupyter notebook"
alias jn-b="jupyter notebook --no-browser"

# python
alias python='python3'

# fzf
alias nve='nvim -o `fzf`'

# tmuxinator
alias mux='tmuxinator'

#
# Misc
#

# Get External IP / Internet Speed
alias myip="dig +short myip.opendns.com @resolver1.opendns.com" # or /ip for plain-text ip
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

alias q='exit'

