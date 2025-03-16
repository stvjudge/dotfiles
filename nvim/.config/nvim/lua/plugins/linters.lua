local vim = vim
---@module "lazy"
---@type LazySpec
return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },

    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            json = { "jsonlint" },
            go = { "codespell", "golangcilint" },
            lua = { "selene" }, -- Install selene with system pkg manager instead of Mason
            python = { "ruff" },
            sh = { "bash", "shellcheck" },
            yaml = { "yamllint" },
            dockerfile = { "trivy" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
