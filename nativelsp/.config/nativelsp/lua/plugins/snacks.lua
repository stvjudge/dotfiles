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
        git = { enabled = true },
        gitbrowse = { enabled = true },
        indent = { enabled = true, only_current = true, animate = { enabled = false } },
        notifier = { enabled = true },
        scratch = { enabled = true },
        statuscolumn = { enabled = true },
    },
}
