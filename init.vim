" Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'

call plug#end()


colorscheme gruvbox
syntax enable
syntax on

set number
set lazyredraw
set nocompatible 
set ttyfast
set ruler
set tabstop=4
set encoding=utf-8
set clipboard=unnamedplus
set mouse=a
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set laststatus=2
set t_Co=256
set background=dark
set updatetime=300
set cmdheight=2

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
map ; :Files<CR>
nmap " :NERDTreeToggle<CR>

" Coc commands
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
autocmd FileType go autocmd BufWritePre <buffer> execute "normal! mz:mkview\<esc>:%!~/.config/nvim/gofmt-safe\<esc>:loadview\<esc>`z"

autocmd FileType sql nmap fmt :CocCommand sql.Format<cr>

if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" set rtp+=/usr/local/opt/fzf
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc


