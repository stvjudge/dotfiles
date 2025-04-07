return {
    -- Visualise whitespaces when text is selected
    {
        "mcauley-penney/visual-whitespace.nvim",
        config = true,
        -- keys = { 'v', 'V', '<C-v>' }, -- optionally, lazy load on visual mode keys
    },
    -- Helm helper for vim
    {
        "towolf/vim-helm",
        lazy = true,
        opts = {},
    },
    -- Hide any sensitive data in files specified in the patterns
    {
        "laytan/cloak.nvim",
        name = "Cloak",
        opts = {
            patterns = {
                {
                    file_pattern = {
                        ".env*",
                        "credentials",
                    },
                    cloak_pattern = { "=.+", ":.+" },
                },
            },
        },
    },
}
