return {
    {
        enabled = false,
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup({
                -- transparent_bg = true,
                preset = "modern",
                options = {
                    show_source = true,
                    use_icons_from_diagnostic = true,
                    multilines = {
                        enabled = true,
                        always_show = false,
                    },
                    multiple_diag_under_cursor = true,
                    show_all_diags_on_cursorline = true,
                },
        })
        vim.diagnostic.config({ virtual_text = false })
        end
    },
}
