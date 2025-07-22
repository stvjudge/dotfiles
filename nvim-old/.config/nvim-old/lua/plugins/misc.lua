return {
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disable_mouse = false,
            disabled_keys = {
                ["<Up>"] = {},
                ["<Down>"] = {},
                ["<Left>"] = {},
                ["<Right>"] = {},
            },
            restriction_mode = "hint",
        },
    },
    {
        "brenoprata10/nvim-highlight-colors",
        opts = {},
    },
    {
        "towolf/vim-helm",
    },
}
