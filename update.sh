#!/bin/sh

cp ~/.config/alacritty/alacritty.toml alacritty.toml
cp ~/.config/nvim/init.vim init.vim
cp ~/.config/nvim/lua/init.lua init.lua
cp ~/.tmux.conf .tmux.conf
cp ~/.zshrc .zshrc
cp ~/.zsh_functions.zsh .zsh_functions.zsh
cp ~/.zsh_aliases.zsh .zsh_aliases.zsh
cp -R ~/.zsh_plugins .zsh_plugins
rm -rf .zsh_plugins/.zsh_plugins
cp ~/.gitconfig .gitconfig 
cp ~/.yabairc .yabairc 
cp ~/.skhdrc .skhdrc

mv Brewfile .old_brewfile
if brew bundle dump; then
	rm -rf .old_brewfile
else
	mv .old_brewfile Brewfile
	echo "Failed to update Brewfile"
fi
