local map = vim.keymap.set

map("n", "<leader>vw", require("visual-whitespace").toggle, { desc = "Toggle visual whitespace" })
