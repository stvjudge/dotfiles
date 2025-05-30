-- Add Mason to PATH
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

-- Add icons to severity levels
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        },
    },
})

-- Change underline to undercurl
vim.cmd.highlight("DiagnosticUnderlineError guisp=#ff0000 gui=undercurl")
vim.cmd.highlight("DiagnosticUnderLineWarn guisp=#ffff00 gui=undercurl")
vim.cmd.highlight("DiagnosticUnderLineHint guisp=#9fc5e8 gui=undercurl")
vim.cmd.highlight("DiagnosticUnderLineInfo guisp=#ead1dc gui=undercurl")

-- Enable LSPs
vim.lsp.enable({
    "bash_ls",
    "lua_ls",
    "gop_ls",
    "helm_ls",
    "docker_ls",
    "docker_compose_ls",
    "yaml_ls",
    "json_ls",
    "powershell_ls",
})
