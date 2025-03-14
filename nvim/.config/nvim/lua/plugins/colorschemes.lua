local g = vim.g
return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        lazy = false,

        config = function()
            g.gruvbox_matrial_enable_italic = true
            g.gruvbox_material_foreground = "mix"
            g.gruvbox_material_background = "hard"
            g.gruvbox_material_performance = true
            g.gruvbox_material_ui_contrast = "high"
            g.gruvbox_material_transparent_background = 1
            vim.cmd.colorscheme("gruvbox-material")
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
        priority = 1000,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
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
