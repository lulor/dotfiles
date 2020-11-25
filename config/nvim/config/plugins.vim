" ==== Fzf ====
set rtp+=/usr/local/opt/fzf
nnoremap <silent> - :Files<CR>
nnoremap <silent> _ :Files ~<CR>
nnoremap <silent> ò :Buffers<CR>
nnoremap <silent> <Space> :Commands<CR>

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

" ==== Signify ====
set updatetime=1000


" ==== Nvim-lsp ====

lua << EOF
    -- Diagnostic
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            update_in_insert = false,
        }
    )

    -- Language Servers
    local lspconfig = require'lspconfig'
    lspconfig.ccls.setup {
        on_attach=require'completion'.on_attach;
        root_dir = lspconfig.util.root_pattern(".ccls", "compile_commands.json", "compile_flags.txt", ".git");
        init_options = {
            cache = {
                directory = ""
            };
        };
    }
EOF

" Keybindings
nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi         <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gW         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd         <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gD         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> 1gD        <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr         <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>o  <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f  <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>d  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <leader>n  <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>p  <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>a  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>s  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>ci <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> <leader>co <cmd>lua vim.lsp.buf.outgoing_calls()<CR>
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Highlight & Signs
sign define LspDiagnosticsSignError text=✘
sign define LspDiagnosticsSignWarning text=▲
sign define LspDiagnosticsSignInformation text=✸
sign define LspDiagnosticsSignHint text=➤
hi! link LspDiagnosticsSignError SrceryRed
hi! link LspDiagnosticsSignWarning SrceryBrightOrange
hi! link LspDiagnosticsSignInformation SrceryYellow
hi! link LspDiagnosticsSignHint SrceryBlue


" ==== Completion-nvim ====

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
imap <silent> <c-Space> <Plug>(completion_trigger)
