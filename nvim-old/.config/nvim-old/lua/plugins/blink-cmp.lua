return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets", -- snippets for many languages
        "xzbdmw/colorful-menu.nvim", -- adds highlights to the auto-complete options
        "L3MON4D3/LuaSnip",
        { "saghen/blink.compat", version = "*", lazy = true },
        "onsails/lspkind.nvim",
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
                            get_cwd = function(_)
                                return vim.fn.getcwd()
                            end,
                        },
                    },
                },
            },
            completion = {
                ghost_text = { enabled = false },
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
                                    local lspkind = require("lspkind")
                                    local icon = ctx.kind_icon
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            icon = dev_icon
                                        end
                                    else
                                        icon = require("lspkind").symbolic(ctx.kind, {
                                            mode = "symbol",
                                        })
                                    end

                                    return icon .. ctx.icon_gap
                                end,

                                -- Optionally, use the highlight groups from nvim-web-devicons
                                -- You can also add the same function for `kind.highlight` if you want to
                                -- keep the highlight groups in sync with the icons.
                                highlight = function(ctx)
                                    local hl = ctx.kind_hl
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            hl = dev_hl
                                        end
                                    end
                                    return hl
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
