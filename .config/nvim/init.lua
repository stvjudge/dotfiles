-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "$HOME/.config/nvim/snippets-lib" } })
