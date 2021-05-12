#!/bin/sh

cp ~/.config/alacritty/alacritty.yml alacritty.yml
cp ~/.config/nvim/init.vim init.vim
cp ~/.zshrc .zshrc
cp ~/.zsh_functions.zsh .zsh_functions.zsh
cp ~/.zsh_aliases.zsh .zsh_aliases.zsh
cp -R ~/.zsh_plugins .zsh_plugins
cp ~/.gitconfig .gitconfig 


mv Brewfile .old_brewfile
if brew bundle dump; then
	rm -rf .old_brewfile
else
	mv .old_brewfile Brewfile
	echo "Failed to update Brewfile"
fi

