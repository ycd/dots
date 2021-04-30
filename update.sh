#!/bin/sh

cp ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml
cp ~/.vimrc vim/.vimrc
cp ~/.zshrc .zshrc


mv Brewfile .old_brewfile

if brew bundle dump; then
	rm -rf .old_brewfile
else
	mv .old_brewfile Brewfile
	echo "Failed to update Brewfile"
fi

