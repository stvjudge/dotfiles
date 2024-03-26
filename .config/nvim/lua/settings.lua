local opt = vim.opt
local g = vim.g

-- set leader to space
g.mapleader = " "
g.maplocalleader = " "

-- scrolling
opt.number = true
opt.relativenumber = false
opt.linebreak = true

opt.mouse = "a"

opt.showmode = false

opt.clipboard = "unnamedplus"

opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.expandtab = true
-- o.tabstop = 4
-- o.shiftwidth = 4
-- o.smartindent = true

opt.listchars = {
    space = "·",
    eol = "↵",
}
opt.list = true

-- Sonokai settings
--g.sonokai_style = 'andromeda'
g.sonokai_better_performance = 1
--g.sonokai_disable_italic_comment = true

-- Catpuccin settings
g.catppuccin_no_bold = true
