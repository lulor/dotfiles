set nocompatible
syntax on
set number
set relativenumber
set ruler
set autoindent
filetype plugin indent on
set hlsearch
set hidden
set mouse+=a

colorscheme desert
set background=dark

" --- Tabs/Spaces ---
set expandtab   
set shiftwidth=4
set softtabstop=4
" set tabstop=8

" --- Folding ---
set foldmethod=syntax
set foldlevel=99

" --- Key bindings ---
let mapleader=","
nnoremap <silent> <leader>l :set relativenumber!<CR>
nnoremap <C-J> 15j
nnoremap <C-K> 15k
nnoremap <leader><leader> <C-^>

" --- Statusline ---
set laststatus=2
set statusline=\ %F
set statusline+=\ %r%m
set statusline+=%=
set statusline+=%y
set statusline+=%8p%%
set statusline+=%8l,%c\ 

" --- Italic for Terminal.app ---
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
