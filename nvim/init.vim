call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
call plug#end()

set clipboard+=unnamedplus

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set noswapfile

set undofile
set undodir=$HOME/.local/share/nvim/undo
set undolevels=10000
set undoreload=10000

set number

set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>bn :bnext<cr>

nnoremap <leader>tc :tabnew<cr>
nnoremap <leader>tq :tabclose<cr>
nnoremap <leader>tQ :tabonly<cr>
nnoremap <leader>tn gt
