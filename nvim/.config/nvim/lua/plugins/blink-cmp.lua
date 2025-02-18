return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },

  {
    "saghen/blink.cmp",
    version = "*",

    event = { "InsertEnter" },

    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "moyiz/blink-emoji.nvim",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev", "markdown" },
      providers = {
        markdown = {
          name = "RMD",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },

        lsp = {
          name = "[LSP]",
          module = "blink.cmp.sources.lsp",
          enabled = true,
        },

        snippets = {
          name = "[Snippets]",
          module = "blink.cmp.sources.snippets",
          min_keyword_length = 2,
          score_offset = 3,
        },

        path = {
          name = "[Path]",
          module = "blink.cmp.sources.path",
          min_keyword_length = 2,
          score_offset = 0,

          opts = {
            show_hidden_files_by_default = false,
            get_cwd = vim.uv.cwd,
          },
        },

        lazydev = {
          name = "[Lazy]",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },

    opts = {

      keymap = { preset = "enter" },

      cmdline = { enabled = false },

      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      snippets = { preset = "luasnip" },

      completion = {
        ghost_text = { enabled = true },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
