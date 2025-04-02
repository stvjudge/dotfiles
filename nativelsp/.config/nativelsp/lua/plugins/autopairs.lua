return {
    "windwp/nvim-autopairs",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        check_ts = true, -- use treesitter to check for a pair.
        ts_config = {
            lua = { "string" }, -- it will not add pair on that treesitter node
        },
    },
}
