local api = vim.api

-- Automatically open diagnostic buffer if there are any items in it
-- api.nvim_create_autocmd({ "DiagnosticChanged" }, {
--     pattern = "*",
--     callback = function()
--         vim.cmd([[Trouble diagnostics toggle focus=false filter.buf=0]])
--     end,

-- Fix not detecting docker compose files correctly
api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
    desc = "Fix the issue where the LSP does not start with docker-compose.",
    callback = function()
        vim.opt.filetype = "yaml.docker-compose"
    end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "Highlight on yank",
})

-- Disable new line comment
api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
    desc = "Disable new line comment",
})

-- Close certain windows with q
api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "man",
        "qf",
        "query",
        "scratch",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
    desc = "Close certain windows with q",
})

vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuOpen",
    callback = function()
        vim.b.copilot_suggestion_hidden = true
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuClose",
    callback = function()
        vim.b.copilot_suggestion_hidden = false
    end,
})
