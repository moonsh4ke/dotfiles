if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -d "$HOME/.config/nvim/plugged/fzf/bin" ] && PATH="$HOME/.config/nvim/plugged/fzf/bin:$PATH"

# If nvim is installed and version is greater than v0.7 then use nvim as editor
# otherwhise use vim
if test -x /bin/nvim && \
    printf "%s\n%s\n" "0.7" "$(nvim -v | head -n 1 | sed "s/[A-Za-z ]//g")" | \
    sort --check=quiet --version-sort;
then
    export EDITOR=nvim
    export VISUAL=nvim
elif [ -x /bin/vim ]
then
    export EDITOR=vim
fi

[ -f "$HOME/.fzf/fzf_defaults.sh" ] && source "$HOME/.fzf/fzf_defaults.sh"

GPG_TTY=`tty`
export GPG_TTY
