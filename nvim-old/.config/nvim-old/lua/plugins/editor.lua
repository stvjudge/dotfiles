return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            winopts = {
                border = "single", -- :h nvim_open_win()
                backdrop = 100,
                preview = {
                    layout = "vertical",
                    border = "single", -- :h nvim_open_win()
                },
            },
            keymap = {
                builtin = {
                    ["<C-d>"] = "preview-page-down",
                    ["<C-u>"] = "preview-page-up",
                },
            },
        },
        keys = {
            { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
            { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find open buffers" },
            { "<leader>fg", "<cmd>FzfLua grep_visual<cr>", desc = "Live grep" },
            { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor" },
            { "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", desc = "Grep WORD under cursor" },
            { "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "Change colorscheme" },
            { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Find help" },
        },
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "norg" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ---@module "render-markdown"
        -- opts = {},
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
}
