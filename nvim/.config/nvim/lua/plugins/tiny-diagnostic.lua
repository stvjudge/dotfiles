---@module "lazy"
---@type LazySpec
return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- Plugin needs to be loaded first
    opts = {
        vim.diagnostic.config({ virtual_text = false }),
        preset = "classic",
        options = {
            show_source = true,
        },
    },
}
