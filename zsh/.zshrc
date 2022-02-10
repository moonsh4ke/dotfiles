# Path variable
#export PATH=$HOME/bin:/usr/local/bin:$PATH 
#

[ -f $HOME/.profile ] && source $HOME/.profile
[ -f $HOME/.aliases.sh ] && source $HOME/.aliases.sh

if [ -d $HOME/.zsh ]
then
    source $HOME/.zsh/prompt.zsh
fi

DISABLE_AUTO_UPDATE="true"

# Use vim style line editing in zsh
bindkey -v

# Search backward, like bash
bindkey '^R' history-incremental-search-backward

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

# Case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt MENU_COMPLETE
