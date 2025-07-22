return {
    {
        "lucidph3nx/nvim-sops",
        event = { "BufEnter" },
        opts = {
            enabled = true,
            debug = false,
            binPath = "sops",
            defaults = {
                awsProfile = "AWS_PROFILE",
            },
            keys = {
                { "<leader>cef", vim.cmd.SopsEncrypt, desc = "[e]ncrypt [f]ile" },
                { "<leader>cdf", vim.cmd.SopsDecrypt, desc = "[d]ecrypt [f]ile" },
            },
        },
    },
}
