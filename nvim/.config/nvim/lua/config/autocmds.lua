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
-- vim.api.nvim_create_autocmd("TermOpen", {
--     pattern = "*",
--     command = "startinsert | set winfixheight",
-- })

-- Folding
vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function()
        if require("nvim-treesitter.parsers").has_parser() then
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim-treesitter#foldexpr()"
        else
            vim.opt.foldmethod = "syntax"
        end
    end,
})
