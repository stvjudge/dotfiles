return {
    "laytan/cloak.nvim",
    name = "Cloak",
    opts = {
        patterns = {
            {
                file_pattern = {
                    ".env*",
                    "credentials",
                },
                cloak_pattern = { "=.+", ":.+" },
            },
        },
    },
}
