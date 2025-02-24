return {
    {
        "saghen/blink.compat",
        version = "*",
        lazy = true,
        opts = {},
    },

    {
        "saghen/blink.cmp",
        version = "*",
        event = { "InsertEnter" },

        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
            "moyiz/blink-emoji.nvim",
        },
        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            sources = {
                default = { "lazydev", "lsp", "buffer", "path", "snippets" },
                providers = {
                    -- markdown = {
                    --     name = "RMD",
                    --     module = "render-markdown.integ.blink",
                    --     fallbacks = { "lsp" },
                    -- },

                    buffer = {
                        min_keyword_length = 5,
                        max_items = 5,
                    },

                    lsp = {
                        name = "LSP",
                        min_keyword_length = 2,
                        module = "blink.cmp.sources.lsp",
                    },

                    snippets = {
                        name = "Snippets",
                        module = "blink.cmp.sources.snippets",
                        min_keyword_length = 2,
                        score_offset = 2,
                    },

                    path = {
                        name = "Path",
                        module = "blink.cmp.sources.path",
                        min_keyword_length = 0,
                        score_offset = -1,

                        opts = {
                            show_hidden_files_by_default = false,
                            get_cwd = vim.uv.cwd,
                        },
                    },

                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 99,
                    },
                },
            },

            keymap = { preset = "enter" },

            cmdline = { enabled = false },

            appearance = {
                highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            snippets = { preset = "luasnip" },

            completion = {
                ghost_text = { enabled = false },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                menu = {
                    auto_show = true,
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind", gap = 1 },
                        },
                        treesitter = { "lsp" },
                    },
                },

                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    treesitter_highlighting = true,
                },
            },
        },
        opts_extend = { "sources.default" },
    },
}
