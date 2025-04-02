---@module "lazy"
---@type LazySpec
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        dim = { enabled = true },
        git = { enabled = true },
        gitbrowse = { enabled = true },
        indent = { enabled = true, only_current = true, animate = { enabled = false } },
        input = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true, timeout = 2000 },
        picker = { layout = "ivy" },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scratch = { enabled = true },
        statuscolumn = { enabled = true },
        toggle = { enabled = true },
        words = { enabled = true },
        zen = { enabled = true },
    },
}
