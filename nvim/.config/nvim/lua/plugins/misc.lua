return {
    {
        "neo451/feed.nvim",
        cmd = "Feed",
        opts = {
            feeds = {
                "https://archlinux.org/feeds/news/",
                {
                    "https://archlinux.org/feeds/news/",
                    name = "Arch Linux News",
                    tags = {},
                },
            },
        },
    },
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disable_mouse = false,
            restriction_mode = "hint",
        },
    },
}
