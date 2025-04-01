return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        { "xzbdmw/colorful-menu.nvim", opts = {} },
    },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {

        keymap = { preset = "enter" },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            ghost_text = {
                enabled = true,
                show_with_menu = false,
            },
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
            documentation = {
                auto_show = true,
            },
            menu = {
                auto_show = false,
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "kind_icon", gap = 1 },
                        { "label", gap = 1 },
                        -- { "source_name" },
                    },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            providers = {
                snippets = {
                    -- name = "[Snippets]",
                    -- module = "blink.cmp.sources.snippets",
                    score_offset = 2,
                },
            },
        },
        fuzzy = {
            sorts = { "exact", "score", "sort_text", "kind", "label" },
        },
        cmdline = {
            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
                menu = {
                    auto_show = false,
                },
            },
            keymap = { preset = "enter" },
        },
    },
    opts_extend = { "sources.default" },
}
