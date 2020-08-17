export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PYTHONSTARTUP=$HOME/.pythonrc

# https://medium.com/better-programming/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d#8ba3
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

#
# Plugins
#

plugins=(
    git
    fasd
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    # zsh-completions
 )
# fpath=($ZSH/custom/plugins/zsh-completions/src $fpath)
source $ZSH/oh-my-zsh.sh

# User configuration

# zsh-completion setting
# autoload -U compinit && compinit

# commmand not found (ubuntu)
#https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/command-not-found/command-not-found.plugin.zsh
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

eval "$(fasd --init auto)"

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # corresponds to 10ms

# Disable shell builtins
disable r

# --------
# Vim mode|
# ---------

# Use nvim as the editor
export EDITOR=nvim
export VISUAL=nvim

# Use vim style navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# Use vim style line editing in zsh
bindkey -v

# Remap clear-screen since ^L is taken by tmux-vim
bindkey "^O" clear-screen
bindkey "^L" end-of-line

# ctrl-z as fg (open suspended vim session)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Aliases
source ~/.aliases.sh

# Prompt

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

oldPS1="$PS1"

function zle-line-init zle-keymap-select {

    VIM_NORMAL_PROMPT="%{$fg_bold[green]%}% N% %{$reset_color%}"
    VIM_INSERT_PROMPT="%{$fg_bold[blue]%}% I% %{$reset_color%}"
    PS1="$oldPS1${${KEYMAP/vicmd/$VIM_NORMAL_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT} "
    PS2=$PS1
    RPS1=""
    RPS2=""
    zle reset-prompt
}

zle -N zle-line-init

zle -N zle-keymap-select

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
