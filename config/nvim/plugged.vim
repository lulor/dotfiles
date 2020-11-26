" ==== VIM-PLUG ====

call plug#begin('~/.local/share/nvim/plugged')
Plug 'srcery-colors/srcery-vim'
Plug 'itchyny/lightline.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
call plug#end()
