local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)


require("lazy").setup({
	spec = {
		-- { "LazyVim/LazyVim" },
		{ import = "ib.plugins" },
	},
	defaults = {
		lazy = false,
		verison = nil,
	},
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
	checker = { enabled = true, notfiy = true },
	performance = {
		cache = {
			enabled = true,
		}
	}
})
