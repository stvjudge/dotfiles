return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile", "InsertLeave" },
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
                go = { "gofumpt" },
                yaml = { "prettier" },
                yml = { "prettier" },
                json = { "prettier" },
            },
            -- Format on save event
            -- format_on_save = {
            --     timeout_ms = 500,
            --     lsp_fallback = true,
            -- },
            format_on_save = function(bufnr)
                local disable_filetypes = { dockerfile = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            -- Customize formatters
            formatters = {
                shftm = {
                    command = "shfmt",
                    prepend_args = { "-i", "2" },
                },
            },
            notify_on_error = true,
        },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}
