if !exists('g:vscode')
    source $HOME/.config/nvim/general.vim
    source $HOME/.config/nvim/keybindings.vim
    source $HOME/.config/nvim/plugged.vim
    source $HOME/.config/nvim/plugins.vim
else
    noremap <C-J> 15j
    noremap <C-K> 15k
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
endif
