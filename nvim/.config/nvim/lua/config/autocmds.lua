local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "highlight on yank",
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
    desc = "Disable New Line Comment",
})

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--     pattern = "deployment.yaml",
--     callback = function()
--         vim.opt_local.filetype = "helm"
--     end,
-- })
