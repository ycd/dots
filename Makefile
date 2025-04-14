update:
	./update.sh

bootstrap:
	# Create folders
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/nvim/lua
	mkdir -p ~/.config/nvim/colors
	# Copy files
	cp .gitconfig ~/.gitconfig 
	cp .tmux.conf ~/.tmux.conf 
	cp .zsh_aliases.zsh ~/.zsh_aliases.zsh
	cp .skhdrc ~/.skhdrc 
	cp .yabairc ~/.yabairc
	cp .zsh_functions.zsh ~/.zsh_functions.zsh 
	cp .zshrc ~/.zshrc 
	cp alacritty.toml ~/.config/alacritty/alacritty.toml
	cp init.vim ~/.config/nvim/init.vim 
	cp init.lua ~/.config/nvim/lua/init.lua
	cp -R .zsh_plugins ~/.zsh_plugins
	# Install Brewfile dependencies
	brew bundle install --file=Brewfile
	

