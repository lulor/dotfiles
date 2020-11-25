" ==== KEYBINDINGS ====

let mapleader=","

nnoremap <silent> <leader>l :set relativenumber!<CR>

" Improve navigation
noremap <C-J> 15j
noremap <C-K> 15k

noremap <silent> <leader><leader> <C-^>

" Exit search highlight in normal mode
nnoremap <silent> <Esc> :ccl \| lcl \| noh<CR><Esc>

" Indent guides (if using tabs)
nnoremap <silent> <leader>i :set list!<CR>

" Split
nnoremap <silent> <leader>v :vsplit<CR>

" Change directory to current file and PWD
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Map [ and ] directly
nmap è [
nmap + ]
omap è [
omap + ]
xmap è [
xmap + ]
