local function map(mode, l, r, opts)
    opts = opts or {}
    vim.keymap.set(mode, l, r, opts)
end

-- stylua: ignore start
map("n", "<leader>vw", require("visual-whitespace").toggle, { desc = "Toggle visual whitespace" })

-- diagnostic
map("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next Diagnostic" })
map("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev Diagnostic" })
map("n", "<leader>dt", function() vim.diagnostic.open_float() end, { desc = "Toggle current diagnostic" })
map("n", "<leader>qo", function() vim.diagnostic.setqflist() end, { desc = "Open quickfix" })

-- buffers
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all but the current buffer" })
-- stylua: ignore end
