" ==== KEYBINDINGS ====

let mapleader=","

" Relative line numbers
nnoremap <silent> <leader>l :set relativenumber!<CR>

" Faster navigation
noremap <C-J> 15j
noremap <C-K> 15k

" Copy to clipboard
vnoremap <leader>y "*y
nnoremap <leader>Y "*yg_
nnoremap <leader>y "*y
nnoremap <leader>yy "*yy

" Paste from clipboard
nnoremap <leader>p "*p
nnoremap <leader>P "*P
vnoremap <leader>p "*p
vnoremap <leader>P "*P

" Exit search highlight in normal mode
nnoremap <silent> <Esc> :ccl \| lcl \| noh<CR><Esc>

" Change directory to current file and PWD
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Switch between two most recent files
noremap <silent> <leader><leader> <C-^>

" Vertical split
nnoremap <silent> <leader>v :vsplit<CR>

" Indent guides (if using tabs)
nnoremap <silent> <leader>i :set list!<CR>
