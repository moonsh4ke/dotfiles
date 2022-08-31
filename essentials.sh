#!/bin/sh

[ ! $(command -v stow) ] && echo "Install or verify stow installation and try again..." && exit
essentials='bash shared_by_shells tmux'

for stow_dir in $essentials; do
    for dotfile in $(find ./$stow_dir -type f -name "*" -not -path "./.git/*" | sed -E "s/\.\/[^\/]+\//\$HOME\//" | grep "HOME"); do
	mkdir -p $HOME/.before_stow/$stow_dir
        eval dotfile=$dotfile
	[ -f $dotfile ] && mv -v $dotfile $HOME/.before_stow/$stow_dir
    done
    stow -v --target=$HOME $stow_dir
done

echo "Essential dotfiles have been installed, and previous dotfiles are now in ~/.before_stow"
