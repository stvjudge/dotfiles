vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.autocmds")
require("config.options")
--
require("config.lazy")

vim.cmd("colorscheme gruvbox-material")
