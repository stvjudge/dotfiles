---@module "lazy"
---@type LazySpec
return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    -- enabled = false,
    vim.diagnostic.config({ virtual_text = false }),

    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "classic",

            transparent_bg = true,
            hi = {
                mixing_color = "None",
            },

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
        })
    end,
    }
