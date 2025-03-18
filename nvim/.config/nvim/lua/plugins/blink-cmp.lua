return {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets", -- snippets for many languages
        "xzbdmw/colorful-menu.nvim", -- adds highlights to the auto-complete options
        "L3MON4D3/LuaSnip",
        { "saghen/blink.compat", version = "*", lazy = true },
    },
    config = function()
        require("colorful-menu").setup({})
        require("blink.cmp").setup({

            signature = { enabled = true },
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    buffer = {
                        max_items = 5,
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                    lsp = {
                        name = "LSP",
                        module = "blink.cmp.sources.lsp",
                        opts = {},
                    },
                    snippets = {
                        name = "Snippets",
                        module = "blink.cmp.sources.snippets",
                        score_offset = 2,
                    },
                    path = {
                        name = "Path",
                        module = "blink.cmp.sources.path",
                        score_offset = -1,
                        opts = {
                            show_hidden_files_by_default = true,
                            get_cwd = vim.uv.cwd,
                        },
                    },
                },
            },
            completion = {
                ghost_text = { enabled = true },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                documentation = {
                    auto_show = true,
                },
                trigger = {
                    show_in_snippet = false,
                },
                menu = {
                    auto_show = function(ctx)
                        return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
                    end,
                    draw = {
                        treesitter = { "lsp" },
                        columns = {
                            { "kind_icon", gap = 1 },
                            { "label", gap = 3 },
                            { "item_idx", gap = 1 },
                            { "source_name" },
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
                            item_idx = {
                                text = function(ctx)
                                    return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
                                end,
                                highlight = "BlinkCmpItemIdx",
                            },
                            source_name = {
                                text = function(ctx)
                                    return "[" .. ctx.source_name .. "]"
                                end,
                            },
                            kind_icon = {
                                text = function(ctx)
                                    -- default kind icon
                                    local icon = ctx.kind_icon
                                    -- if LSP source, check for color derived from documentation
                                    if ctx.item.source_name == "LSP" then
                                        local color_item = require("nvim-highlight-colors").format(
                                            ctx.item.documentation,
                                            { kind = ctx.kind }
                                        )
                                        if color_item and color_item.abbr then
                                            icon = color_item.abbr
                                        end
                                    end
                                    return icon .. ctx.icon_gap
                                end,
                                highlight = function(ctx)
                                    -- default highlight group
                                    local highlight = "BlinkCmpKind" .. ctx.kind
                                    -- if LSP source, check for color derived from documentation
                                    if ctx.item.source_name == "LSP" then
                                        local color_item = require("nvim-highlight-colors").format(
                                            ctx.item.documentation,
                                            { kind = ctx.kind }
                                        )
                                        if color_item and color_item.abbr_hl_group then
                                            highlight = color_item.abbr_hl_group
                                        end
                                    end
                                    return highlight
                                end,
                            },
                        },
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
                        auto_show = true,
                    },
                },
                keymap = { -- https://github.com/neovim/neovim/issues/21585
                    ["<C-space>"] = { "show" },
                    ["<CR>"] = { "accept", "fallback" },
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    ["<Esc>"] = {
                        "cancel",
                        function()
                            if vim.fn.getcmdtype() ~= "" then
                                vim.api.nvim_feedkeys(
                                    vim.api.nvim_replace_termcodes("<C-c>", true, true, true),
                                    "n",
                                    true
                                )
                                return
                            end
                        end,
                    },
                },
            },

            keymap = { preset = "enter" },

            snippets = { preset = "luasnip" },

            appearance = {
                highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
                kind_icons = {
                    Text = "",
                    Method = "󰊕",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "󱕴",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                    Boolean = " ",
                    Array = " ",
                },
            },
        })
    end,
}
