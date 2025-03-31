vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
-- Add additional capabilities from blink
local capabilities = {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
}
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Enable diagnostics for current line only
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
    },
})

vim.cmd.highlight("DiagnosticUnderlineError guisp=#ff0000 gui=undercurl")
vim.cmd.highlight("DiagnosticUnderLineWarn guisp=#ffff00 gui=undercurl")
vim.cmd.highlight("DiagnosticUnderLineHint guisp=#9fc5e8 gui=undercurl")
vim.cmd.highlight("DiagnosticUnderLineInfo guisp=#ead1dc gui=undercurl")

-- Enable LSPs
vim.lsp.enable({
    "bash_ls",
    "lua_ls",
    "gopls",
})
