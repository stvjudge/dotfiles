return {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            highlight_group = "Comment",
            cloak_telescope = true,
            patterns = {
                {
                    file_pattern = {
                        ".env",
                        "credentials",
                    },
                    cloak_pattern = "=.+",
                },
            },
        })
    end,
}
