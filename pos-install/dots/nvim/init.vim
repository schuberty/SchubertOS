" Plugins usados no NeoVim
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'

Plug 'valloric/youcompleteme'

call plug#end()

" Tema gruvbox
colorscheme gruvbox

" Sets que removem o --INSERT
set noshowmode
set noshowcmd
set shortmess+=F

" Identação
set expandtab
set shiftwidth=2
set softtabstop=2

" Configurações padrões
set hidden
set number
set relativenumber
set inccommand=split

" Usar mouse na tela
set mouse=a
" Macros 
let mapleader="\<space>"
nnoremap <leader>; :Files<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :q!<CR>

