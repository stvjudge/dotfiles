return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/lazydev.nvim",                 opts = {}, ft = "lua" },
        { "williamboman/mason.nvim",            opts = {} },
        { "williamboman/mason-lspconfig.nvim" },
        "folke/neoconf.nvim",
        "saghen/blink.cmp",
        "b0o/schemastore.nvim",
    },

    config = function()

        local schemastore = require("schemastore")
        -- Load neoconf
        require("neoconf").setup()

        -- Define LSP servers
        local servers = {
                -- LUA
            lua_ls = {
                settings = {
                    Lua = {
                        format = {
                            enabled = true,
                            defaultConfig = {
                                indent_style = "space",
                            },
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
            -- BASH
            bashls = {
                settings = {
                    bashIde = {
                        -- Disable shellcheck in bashls. Conflicts with linter settings.
                        shellcheckPath = "",
                    },
                },
            },
            -- DOCKER
            dockerls = {
                settings = {},
            },
            -- DOCKER COMPOSE
            docker_compose_language_service = {
                settings = {},
            },
            -- JSON
            jsonls = {
                settings = {
                    json = {
                        schemas = schemastore.json.schemas(),
                        validate = { enable = true },
                    },
                },
            },
            -- YAML
            yamlls = {
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = "",
                        },
                        schemas = schemastore.yaml.schemas(),
                        validate = true,
                        completion = true,
                        hover = true,
                    },
                },
            },
        }

        require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })

        for server, config in pairs(servers) do
            config.capabilities = require("blink.cmp").get_lsp_capabilities()
            require("lspconfig")[server].setup(config)
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
            virtual_text = false,
            severity_sort = true,
        })
    end
}
