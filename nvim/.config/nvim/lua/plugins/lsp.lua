---@module "lazy"
---@type LazySpec
return {
    {
        "folke/neoconf.nvim",
        cmd = "NeoConf",
        opts = {},
    },

    -- Nvim LSP config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
            "saghen/blink.cmp",
        },
        ft = {
            "dockerfile",
            "json",
            "lua",
            "markdown",
            "python",
            "go",
            "sh",
            "toml",
            "yaml",
        },

        config = function()
            ---@diagnostic disable-next-line: unused-local
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local schemastore = require("schemastore")

            mason_lspconfig.setup({
                ensure_installed = {},
                automatic_installation = false,
            })

            -- Define LSP capabilities
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Diagnostic
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- Setup LSP servers
            mason_lspconfig.setup_handlers({
                function(server)
                    lspconfig[server].setup({
                        on_attach = function()
                            -- Additional on_attach logic
                        end,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = {
                                        vim.env.VIMRUNTIME,
                                    },
                                },
                            },
                        },
                    })
                end,
                -- JSON lang server
                ["jsonls"] = function()
                    lspconfig.jsonls.setup({
                        capabilities = capabilities,
                        settings = {
                            json = {
                                schemas = schemastore.json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    })
                end,
                -- YAML lang server
                ["yamlls"] = function()
                    lspconfig.yamlls.setup({
                        capabilities = capabilities,
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
                    })
                end,
            })

            require("lspconfig.ui.windows").default_options.border = "single"
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "single",
            })
            vim.diagnostic.config({
                float = { border = "single" },
            })
        end,
        -- stylua: ignore start
        keys = {
            { "<leader>li", ":LspInfo<CR>",                                  desc = "LSP information" },
            { "<leader>lr", ":lua vim.lsp.buf.rename()<CR>",                 desc = "LSP symbol rename" },
            { "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>",         desc = "LSP signature help" },
            { "<leader>lk", ":lua vim.lsp.buf.signature_help()<CR>",         desc = "LSP signature help" },
            { "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>", desc = "LSP format" },
            { "<leader>ld", ":lua vim.diagnostic.open_float()<CR>",          desc = "Open diagnostics" },
            { "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>",          desc = "Quickfix diagnostics" },
            { "<leader>la", ":FzfLua lsp_code_actions<CR>",                  desc = "LSP code actions" },
            { "K",          ":lua vim.lsp.buf.hover()<CR>",                  desc = "LSP Hover" },
            { "gD",         ":lua vim.lsp.buf.declaration()<CR>",            desc = "LSP goto declaration" },
            { "gd",         ":FzfLua lsp_definitions<cr>",                   desc = "LSP goto definition" },
            { "gr",         ":FzfLua lsp_references<cr>",                    desc = "LSP goto references" },
            { "gi",         ":FzfLua lsp_implementations<cr>",               desc = "LSP goto implementations" },
            { "go",         ":FzfLua lsp_document_symbols<CR>",              desc = "LSP find document symbols" },
            { "gO",         ":FzfLua lsp_workspace_symbols<CR>",             desc = "LSP find workspace symbols" },
            { "g[",         ":lua vim.diagnostic.goto_prev()<CR>",           desc = "goto prev diagnostic" },
            { "g]",         ":lua vim.diagnostic.goto_next()<CR>",           desc = "goto next diagnostic" },
        },
        -- stylua: ignore end
    },
}
