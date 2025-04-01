-- vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
--     pattern = "*",
--     callback = function ()
--         vim.cmd([[Trouble diagnostics toggle focus=false pinned=true win.relative=win win.position=right filter.buf=0]])
--     end
-- })

-- Fix not detecting docker compose files correctly
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
    desc = "Fix the issue where the LSP does not start with docker-compose.",
    callback = function()
        vim.opt.filetype = "yaml.docker-compose"
    end,
})
