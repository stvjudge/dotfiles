return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {

      bigfile = { enabled = true },

      dashboard = {
        -- example = "default",
      },

      explorer = {
        enabled = true,
      },

      indent = {
        priority = 1,
        enabled = true,
        chunk = { enabled = true },
        animate = { enabled = false },
      },

      notifier = {
        enabled = true,
        timeout = 5000,
        style = "fancy",
      },

      notify = { enabled = true },

      picker = {
        source = {
          explorer = {},
        },

        debug = { scores = true },

        layout = {
          preset = "default",
          cycle = false,
        },

        layouts = {
          default = {
            layout = {
              backdrop = false,
            },
          },
        },

        matcher = {
          frecency = true,
        },
      },

      scope = {},

      toggle = { enabled = true },

      words = { enabled = true },
    },

    keys = {
      {
        "gd",
        function() Snacks.picker.lsp_definitions() end,
        desc = "Goto Definition",
      },
      {
        "te",
        function() Snacks.picker.explorer() end,
        desc = "Toggle snacks explorer",
      },
    },
  },
}
