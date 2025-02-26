---@module "lazy"
---@type LazySpec
return {
    "rachartier/tiny-inline-diagnostic.nvim",
    -- event = "LspAttach",
    event = {
        "BufReadPost",
        "BufNewFile",
    },

    priority = 1000, -- Plugin needs to be loaded first

    opts = {
        vim.diagnostic.config({ virtual_text = false }),
        preset = "classic",
        signs = {
            diag = "●",
            arrow = "  ",
            left = "",
            right = "",
        },
        options = {
            show_source = true,
            multiple_diag_under_cursoer = true,
            multilines = true,
            show_all_diags_on_cursorline = true,
        },
    },
}
