" ==== KEYBINDINGS ====

let mapleader=","

nnoremap <silent> <leader>l :set relativenumber!<CR>

" Improve navigation
noremap <C-J> 15j
noremap <C-K> 15k

noremap <silent> <leader><leader> <C-^>

" Exit search highlight in normal mode
nnoremap <esc> :noh<CR><esc>

" Indent guides (if using tabs)
nnoremap <silent> <leader>i :set list!<CR>

" Split
nnoremap <silent> <leader>v :vsplit<CR>

" Change directory to current file and PWD
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
