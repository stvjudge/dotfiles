return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "b0o/schemastore.nvim",
    },

    -- LSP servers
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        format = {
                            enabled = false,
                            defaultConfig = {
                                indent_style = "space",
                            },
                        },
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim", "Snacks" },
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                    },
                },
            },
        },
    },

    config = function(_, opts)
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        -- Show dignostics icons instead of letters
        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
        vim.fn.sign_define(
            "LightBulbSign",
            { text = "󰛩", texthl = "LspDiagnosticsDefaultInformation", numhl = "LspDiagnosticsDefaultInformation" }
        )

        -- Diagnostic config
        vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
        })
    end,
}
