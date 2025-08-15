return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
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
                width = 0.9,
                height = 0.9,
            },
        })
        require("mason-tool-installer").setup({
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
                "shfmt",
                "shellcheck",
                "stylua",
                "hadolint",
                "gofumpt",
                "yamllint",
                "jsonlint",
                "prettier",
                "trivy",
                -- "powershell-editor-services",
                "cmake-language-server",
                "cmakelint",
            },
            -- Enable mason-lspconfig integration so we can
            -- use lspconfig names instead of Mason names
            integrations = {
                ["mason-lspconfig"] = true,
            },
        })
    end,
}
