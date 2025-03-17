---@module "lazy"
---@type LazySpec
return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
        -- transparent_bg = true,
        options = {
            show_source = true,
            mutliple_diag_under_cursor = true,
            multilines = true,
            show_all_diags_on_cursorline = true,
        }
    }
}
