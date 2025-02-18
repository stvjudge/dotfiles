local opt = vim.opt
local g = vim.g

-- Global editor settings --
g.have_nerd_font = true

opt.backup = false

opt.ignorecase = true

opt.clipboard = "unnamedplus"
-- Enable WslClipboard provider for clipboard
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
      ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
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

opt.shiftround = true
opt.shiftwidth = 2
opt.smartindent = true

opt.termguicolors = true

opt.listchars = { tab = "-> ", space = "·" }
opt.list = true

g.deprecation_warnings = true

g.gruvbox_material_enable_italic = true
g.gruvbox_material_better_performance = 1
g.gruvbox_material_background = "hard"
g.gruvbox_material_foreground = "material"
g.gruvbox_material_ui_contrast = "high"
g.gruvbox_contrast_dark = "hard"
