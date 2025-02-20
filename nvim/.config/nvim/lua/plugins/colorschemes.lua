local g = vim.g

return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rjshkhr/shadow.nvim",
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    lazy = false,

    config = function()
      g.sonokai_enable_italic = "1"
      g.sonokai_style = "andromeda"
    end,
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = false,

    config = function()
      g.gruvbox_matrial_enable_italic = true
      g.gruvbox_material_background = "hard"
      g.gruvbox_material_performance = true
    end,
  },
}
