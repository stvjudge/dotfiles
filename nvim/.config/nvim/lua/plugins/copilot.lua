return {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = { enabled = true },
            panel = { enabled = false },
        })
    end,
}
