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
lspconfig.pyls.setup {
    on_attach=require'completion'.on_attach;
}
