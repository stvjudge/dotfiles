return {
    {
        "stevearc/conform.nvim",
        -- event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({ async = true })
                end,
                mode = { "n", "v" },
                desc = "Format buffer",
            },
        },
        ---@module "conform"
        ---@type conform.setupOpts
        opts = {
            default_format_opts = {
                lsp_format = "fallback",
            },
            -- Formatters by file type
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                zsh = { "shfmt" },
                json = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "yamlfmt" },
                go = { "gofmt" },
                markdown = { "prettierd", "prettier", stop_after_first = true },
            },
            -- Format on save event
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            -- Customize formatters
            formatters = {
                shftm = {
                    command = "shfmt",
                    prepend_args = { "-i", "2" },
                },
            },
            notify_on_error = true,
        },
        -- init = function()
        --     vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        -- end,
    },
}
