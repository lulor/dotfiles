" ==== Fzf ====
set rtp+=/usr/local/opt/fzf
nnoremap <silent> - :Files<CR>
nnoremap <silent> _ :Files ~<CR>
nnoremap <silent> + :Buffers<CR>
nnoremap <silent> <space> :Commands<CR>

" ==== Lightline ====
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'srcery',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\ },
			\ }

" ==== Srcery ====
let g:srcery_italic = 1
colorscheme srcery
