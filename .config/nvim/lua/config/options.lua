-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

opt.ignorecase = true

opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.laststatus = 3

-- enable mouse
opt.mouse = "a"

opt.number = true
opt.relativenumber = false
opt.scrolloff = 8
opt.linebreak = true

-- indent settings
opt.shiftround = true
opt.shiftwidth = 2
opt.smartindent = true

opt.termguicolors = true

-- gruvbox theme related settings
g.gruvbox_material_foreground = "mix"
g.gruvbox_material_background = "medium"
g.gruvbox_material_better_performance = 1

-- edge theme related settings
g.edge_style = "default"
g.edge_dim_foreground = 0

-- sonokai them related settings
g.sonokai_style = "andromeda"
g.sonokai_better_performance = 1
