return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "folke/lazydev.nvim", opts = {}, ft = "lua" },
        { "williamboman/mason.nvim", opts = {} },
        { "williamboman/mason-lspconfig.nvim" },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "folke/neoconf.nvim",
        "saghen/blink.cmp",
        "b0o/schemastore.nvim",
    },

    config = function()
        local schemastore = require("schemastore")
        -- Load neoconf
        require("neoconf").setup()

        -- Some Mason options
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                check_outdated_packages_on_open = true,
                border = "rounded",
                width = 0.9,
                height = 0.9,
            },
        })

        -- Define LSP servers
        local lsp_servers = {
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
            dockerls = {},
            -- DOCKER COMPOSE
            docker_compose_language_service = {},
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
            -- GO
            gopls = {
                settings = {
                    gofumpt = true,
                    codelenses = {
                        gc_details = false,
                        generate = true,
                        regenerate_cgo = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_dependency = true,
                        vendor = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                    analyses = {
                        fieldalignment = true,
                        nilness = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    usePlaceholders = true,
                    completeUnimported = true,
                    staticcheck = true,
                    directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                    semanticTokens = true,
                },
                -- HELM
                helm_ls = {
                    settings = {
                        ["helm-ls"] = {
                            yamlls = {
                                path = "yaml-language-server",
                            },
                        },
                    },
                },
                -- JINJA
                jinja_ls = {},
            },
        }

        local tools = {
            prettier = {},
            -- trivy = {},
            shfmt = {},
            stylua = {},
            hadolint = {},
            gofumpt = {},
            snyk = {},
            djlint = {},
        }

        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(lsp_servers),
            automatic_installation = true,
        })

        require("mason-tool-installer").setup({
            ensure_installed = vim.tbl_keys(tools),
        })

        for server, config in pairs(lsp_servers) do
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
    end,
}
