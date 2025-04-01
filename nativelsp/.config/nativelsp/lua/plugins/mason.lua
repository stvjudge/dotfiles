return {
    "williamboman/mason.nvim", -- lsp server installer
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                check_outdated_packages_on_open = true,
                -- border = "rounded",
                width = 0.9,
                height = 0.9,
            },
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "dockerls",
                "docker_compose_language_service",
                "helm_ls",
                "bashls",
                "gopls",
                "golangci_lint_ls",
                "jsonls",
                "yamlls",
            },
            automatic_installation = true,
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                "shfmt",
                "shellcheck",
                "stylua",
                "hadolint",
                "gofumpt",
                "yamllint",
                "jsonlint",
                "prettier",
            },
        })
    end,
}
