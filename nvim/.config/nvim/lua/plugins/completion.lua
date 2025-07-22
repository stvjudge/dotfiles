return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets",
        { "xzbdmw/colorful-menu.nvim", opts = {} },
        { "saghen/blink.compat", optional = true, opts = {} },
        "fang2hou/blink-copilot",
    },
    version = "1.*",
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
                auto_show_delay_ms = 200,
                treesitter_highlighting = true,
            },
            menu = {
                auto_show = false,
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "kind_icon", gap = 1 },
                        { "label", gap = 1 },
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
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
                lazydev = {
                    name = "[LazyDev]",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                lsp = {
                    name = "[LSP]",
                    module = "blink.cmp.sources.lsp",
                    opts = {},
                },
                path = {
                    name = "[Path]",
                    module = "blink.cmp.sources.path",
                    score_offset = -1,
                    opts = {
                        show_hidden_files_by_default = true,
                        get_cwd = function(_)
                            return vim.fn.getcwd()
                        end,
                    },
                },
                snippets = {
                    name = "[Snippets]",
                    module = "blink.cmp.sources.snippets",
                    score_offset = 2,
                },
                buffer = {
                    name = "[Buffer]",
                    min_keyword_length = 3,
                    max_items = 5,
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
    opts_extend = {
        "sources.default",
        "sources.compat",
    },
}
