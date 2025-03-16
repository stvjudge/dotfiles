local opt = vim.opt
local o = vim.o
local g = vim.g

-- Global editor settings --

g.mapleader = " "
g.maplocalleader = " "

g.have_nerd_font = true

opt.backup = false

opt.ignorecase = true

opt.clipboard = "unnamedplus"
-- Enable WslClipboard provider for clipboard
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "/mnt/c/Windows/System32/clip.exe",
            ["*"] = "/mnt/c/Windows/System32/clip.exe",
        },
        paste = {
            ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.laststatus = 3

opt.mouse = "a"

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.linebreak = true

opt.smartindent = true

-- Fold settings
o.foldenable = false
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldmethod = "expr"

-- Wildmenu
o.wildmenu = true
o.wildmode = "longest:full,full"
o.wildoptions = "pum"

-- Use spaces for tabs and whatnot
o.tabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.expandtab = true

opt.termguicolors = true

opt.listchars = { tab = "-> ", space = "·" }
opt.list = true

g.deprecation_warnings = true

o.background = "dark"
