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
    {
        "tris203/precognition.nvim",
        enabled = false,
        event = "VeryLazy",
        opts = {
            -- startVisible = true,
            -- showBlankVirtLine = true,
            -- highlightColor = { link = "Comment" },
            -- hints = {
            --      Caret = { text = "^", prio = 2 },
            --      Dollar = { text = "$", prio = 1 },
            --      MatchingPair = { text = "%", prio = 5 },
            --      Zero = { text = "0", prio = 1 },
            --      w = { text = "w", prio = 10 },
            --      b = { text = "b", prio = 9 },
            --      e = { text = "e", prio = 8 },
            --      W = { text = "W", prio = 7 },
            --      B = { text = "B", prio = 6 },
            --      E = { text = "E", prio = 5 },
            -- },
            -- gutterHints = {
            --     G = { text = "G", prio = 10 },
            --     gg = { text = "gg", prio = 9 },
            --     PrevParagraph = { text = "{", prio = 8 },
            --     NextParagraph = { text = "}", prio = 8 },
            -- },
            -- disabled_fts = {
            --     "startify",
            -- },
        },
    },
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
}
