return {
    "folke/trouble.nvim",
    opts = {
        mode = "document_diagnostics",
        auto_close = true,
        focus = true,
        preview = {
            type = "float",
            relative = "editor",
            border = "none",
            title = "Preview",
            title_pos = "center",
            position = { 0.7, 1 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
        },
    },

    cmd = "Trouble",
    keys = {
        { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
        {
            "<leader>co",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP References / Definitions /... (Trouble)",
        },
        { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
}
