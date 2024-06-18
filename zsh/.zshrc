# Path variable
#export PATH=$HOME/bin:/usr/local/bin:$PATH 
#

[ -f $HOME/.profile ] && source $HOME/.profile
[ -f $HOME/.aliases.sh ] && source $HOME/.aliases.sh

if [ -d $HOME/.zsh ]
then
    source $HOME/.zsh/prompt.zsh
    source $HOME/.zsh/fzf-marks.plugin.zsh
fi

DISABLE_AUTO_UPDATE="true"

# Use vim style line editing in zsh
# bindkey -v

# Fix delay entering vi normal mode
export KEYTIMEOUT=1

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

# Fzf auto-completion
# [[ $- == *i* ]] && source "$HOME/.fzf/completion.zsh" 2> /dev/null

# https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"

# Slows down startup fix in: https://github.com/nvm-sh/nvm/issues/539#issuecomment-245791291
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# colored man pages using less
if [ $(command -v less) ]
then
    export MANPAGER="less -R --use-color -Dd+r -Du+b"
    export MANROFFOPT="-P -c"
fi
