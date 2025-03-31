return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".stylua.toml", "stylua.toml", ".luarc.json", "selene.toml" },
    settings = {
        Lua = {
            format = {
                enabled = true,
                defaultConfig = {
                    indent_style = "space",
                },
            },
            diagnostics = {
                globals = { "vim", "Snacks" },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
}
