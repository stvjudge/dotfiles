local opt = vim.opt
local o = vim.o
local g = vim.g

-- Global editor settings --

g.mapleader = " "
g.maplocalleader = " "
g.deprecation_warnings = true
g.have_nerd_font = true

opt.completeopt = "menuone,noselect,popup,fuzzy"
opt.backup = false
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
            ["+"] = '/mnt/c/Windows/system32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = '/mnt/c/Windows/system32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

opt.ignorecase = true

opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.laststatus = 3

opt.mouse = "a"

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.linebreak = true
opt.signcolumn = "yes"
opt.smartindent = true
opt.wrap = true

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

opt.list = true
opt.termguicolors = true
-- opt.listchars = { tab = "-> ", space = "·" }
-- opt.listchars:append('space:⋅')
-- opt.listchars:append('trail:⋅')
-- opt.fillchars = {
-- 	fold = ' ', -- or "⸱"
-- 	foldopen = '',
-- 	foldclose = '',
-- 	foldsep = ' ',
-- 	diff = '╱',
-- 	eob = ' ',
--
-- 	vert = ' ',
-- }

o.background = "dark"
