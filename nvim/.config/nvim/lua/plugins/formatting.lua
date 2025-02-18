return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },

    keys = {
      {
        "<leader>fo",
        function() require("conform").format({ async = true, lasp_fallback = true }) end,
        mode = "",
        desc = "Format buffer",
      },
    },

    opts = {
      notify_on_error = false,
      -- Formatters by file type
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        json = { "prettier" },
        yaml = { "prettier" },
        go = { "gofmt" },
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
    init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
  },
}
