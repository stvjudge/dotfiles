-- vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
--     pattern = "*",
--     callback = function ()
--         vim.cmd([[Trouble diagnostics toggle focus=false pinned=true win.relative=win win.position=right filter.buf=0]])
--     end
-- })
