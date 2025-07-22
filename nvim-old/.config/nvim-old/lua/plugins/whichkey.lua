---@module "lazy"
---@type LazySpec
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = "echasnovski/mini.icons",

    opts = {
        delay = 500,
        preset = "helix",
        sort = { "alphanum" },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
        {
            "<c-w><space>",
            function()
                require("which-key").show({ keys = "<c-w>", loop = true })
            end,
            desc = "Window Hydra Mode (which-key)",
        },
        "<leader>",
    },
}
