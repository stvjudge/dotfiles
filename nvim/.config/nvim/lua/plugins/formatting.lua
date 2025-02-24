return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
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

        opts = {
            default_format_opts = {
                lsp_format = "fallback",
            },

            notify_on_error = true,

            -- Formatters by file type
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt" },
                json = { "prettier" },
                yaml = { "yamlfmt" },
                go = { "gofmt" },
                markdown = { "prettier" },
            },

            -- Format on save event
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },

            -- Customize formatters
            formatters = {
                shftm = {
                    command = "shftm",
                    prepend_args = { "-i", "2" },
                },
            },
        },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}
