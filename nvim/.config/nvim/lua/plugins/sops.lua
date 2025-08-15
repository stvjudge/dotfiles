return {
    {
        "lucidph3nx/nvim-sops",
        event = { "BufEnter" },
        opts = {
            enabled = true,
            debug = false,
            binPath = "sops",
            defaults = {
                awsProfile = "phoenix-dev",
            },
        },
    },
}
