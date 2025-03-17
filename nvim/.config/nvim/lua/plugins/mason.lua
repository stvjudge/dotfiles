return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                check_outdated_packages_on_open = true,
                border = "rounded",
            },
        })

        mason_lspconfig.setup({
            -- ensure_installed = {
            --     "bashls",
            --     "docker_composer_language_service",
            --     "dockerls",
            --     "jsonls",
            --     "taplo",
            --     "lua_ls",
            --     "vimls",
            --     "yamlls",
            --     "marksman",
            -- },
            -- automatic_installation = false,
            run_on_start = true,
            integration = {
                ["mason-lspconfig"] = true,
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "black",
                "markdownlint",
                "shfmt",
                "stylua",
                "codespell",
                "yamllint",
                "prettier",
                "jsonlint",
                "eslint_d",
                "trivy",
            },
            automatic_installation = true,
        })
    end,
}
