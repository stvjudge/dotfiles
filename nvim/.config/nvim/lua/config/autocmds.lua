-- Reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.env.MYVIMRC,
  command = "silent source %",
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})

-- Start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert | set winfixheight",
})
