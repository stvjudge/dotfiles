local g = vim.g
return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({})
            vim.cmd.colorscheme("github_dark_default")
        end,
    },
    -- {
    --     "Skardyy/makurai-nvim",
    --     config = function()
    --         vim.cmd.colorscheme("makurai")
    --     end,
    -- },
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        lazy = false,

        config = function()
            g.gruvbox_matrial_enable_italic = true
            g.gruvbox_material_background = "hard"
            g.gruvbox_material_performance = true
            -- g.gruvbox_material_transparent_background = 1
            -- vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        "RRethy/base16-nvim",
        lazy = false,
        -- opts = {},
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            contrast = "hard",
            transparent_mode = true,
        },
    },
}
