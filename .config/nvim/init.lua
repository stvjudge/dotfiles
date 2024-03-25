vim.g.projects_dir = vim.env.XDG_DATA_HOME .. "/Projects"
vim.g.personal_dir = vim.env.XDG_DATA_HOME .. "/Personal"
vim.g.note_dir = vim.env.XDG_DATA_HOME .. "/Notes"

-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Enable core configurations, order matters!
require("settings")

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    checker = { enabled = true, notify = true },
    change_detection = { notify = false },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "gzip",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
            },
        },
    },
})
