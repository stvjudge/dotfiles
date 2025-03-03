local g = vim.g

return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        lazy = false,

        config = function()
            g.gruvbox_matrial_enable_italic = true
            g.gruvbox_material_background = "medium"
            g.gruvbox_material_performance = true
            g.gruvbox_material_transparent_background = 1
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
