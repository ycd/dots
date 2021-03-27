#!/usr/bin/sh



# vim-rooter
git clone https://github.com/airblade/vim-rooter.git ~/.vim/pack/plugins/start/vim-rooter

# fzf-vim 
git clone https://github.com/junegunn/fzf.vim ~/.vim/pack/plugins/start/fzf.vim

# nerd-tree
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree

# vim-polyglot 
git clone --depth 1 https://github.com/sheerun/vim-polyglot ~/.vim/pack/plugins/start/vim-polyglot

# lightline 
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

# rust vim
git clone https://github.com/rust-lang/rust.vim ~/.vim/pack/plugins/start/rust.vim

# Setup coc
mkdir -p ~/.vim/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv ~/.vim/pack/coc/start

# :CocInstall coc-go
# :CocInstall coc-pyright
# :CocInstall coc-rust-analyzer

cp gofmt-safe ~/.vim/gofmt-safe

