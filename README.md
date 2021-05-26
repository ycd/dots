# dots 


--- 


Personal dotfiles for MacOS, vim, alacritty, etc.



# Setup


```
# Install dependencies
brew bundle

# Bootstrap new setup
make bootstrap

# setup vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins 
:PlugInstall 

```
