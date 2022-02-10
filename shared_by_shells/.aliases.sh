
# Quick access
alias e='$EDITOR'

# Configuration files quick edit
alias nvcfg='$EDITOR $HOME/.config/nvim/init.vim'
alias aliases='$EDITOR $HOME/.aliases.sh'
alias tcfg='$EDITOR $HOME/.tmux.conf'
alias zcfg='$EDITOR $HOME/.zshrc'
# alias acfg='nvim ~/dotfiles/terminal/.alacritty.yml'
# alias ccfg='nvim ~/.config/compton.conf'
# alias i3cfg='nvim ~/.config/i3/config'
# alias mcfg='nvim ~/.config/neomutt/neomuttrc'
# alias pcfg="nvim ~/.config/polybar/config"


# Refresh config
# alias rf='source ~/.zshrc'
# alias td='nvim ~/Documents/notes/todo.txt'
# alias shistory='nvim ~/.shistory.sh' 

# MEGA aliases
if [ -d $HOME/MEGA ]
then
    alias td='$EDITOR $HOME/MEGA/Notes/todo.txt'
fi

# Enable aliases to be sudo’ed
alias sudo='sudo '

# cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}


# ls aliases
# alias ll='ls -lahp'
# alias la='ls -Ap'
# alias l='ls -p'


# Exa
#alias l="exa --icons --group-directories-first"
#alias la="exa --icons --group-directories-first -a"
#alias ll="exa --icons --group-directories-first -lhg"


# chmod
# alias chmx='chmod +x'

# File management, modifiers, etc.
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

#alias mkd='mkdir -pv'
#alias o='xdg-open'
#alias open='xdg-open'

#alias df='df -h'
#alias du='du -h'
#alias dul='du -sh $(ls -p) | sort -hr'
#alias dula='du -sh $(ls -Ap) | sort -hr'

# Processes
# alias ka='killall'

# Git
#alias g="git"
#alias ga='git add'
#alias gs='git status'
#alias gu='git pull'
#alias gg='git graph'
## unalias gd
alias gd='git diff'
alias gD='git ls-files'
#alias cdgr='cd "$(git root)"'

# Jupyter
# alias jc="jupyter console"
# alias jco="jupyter nbconvert"
alias jn="jupyter notebook"
alias jn-b="jupyter notebook --no-browser"

# fzf
# alias nve='nvim -o `fzf`'
# alias fzf.='find | fzf' # Search for hidden files

# tmuxinator
#alias mux='tmuxinator'

# Get External IP / Internet Speed
alias myip="dig +short myip.opendns.com @resolver1.opendns.com" # or /ip for plain-text ip
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Weather
alias weather="curl wttr.in"

# Use btop as t if installed
if [ -x /bin/btop ];
then
    alias t="btop"
else
    alias t="htop"
fi
