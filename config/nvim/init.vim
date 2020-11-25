if !exists('g:vscode')
    runtime! config/general.vim
    runtime! config/keybindings.vim
    runtime! config/plugged.vim
    runtime! config/plugins.vim
else
    noremap <C-J> 15j
    noremap <C-K> 15k
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
endif
