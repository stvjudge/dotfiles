-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.ignorecase = true

opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.laststatus = 3

opt.mouse = "a"

-- scrolling related
opt.number = true
opt.relativenumber = false
opt.scrolloff = 8
opt.linebreak = true

opt.shiftround = true
opt.shiftwidth = 4
opt.smartindent = true

opt.termguicolors = true
