---@module "lazy"
---@type LazySpec
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@module 'snacks'
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        git = { enabled = true },
        gitbrowse = { enabled = true },
        dashboard = {
            -- Config moved to its own lua file
        },
        indent = { enabled = true, only_current = true },
        notifier = { enabled = true },
        rename = { enabled = true },
        words = { enabled = true },
        scroll = { enabled = true },
        input = { enabled = true },
        statuscolumn = {
            enabled = true,
            left = { "sign", "mark" },
            right = { "git" },
        },
        styles = {
            blame_line = { border = "none" },
            notification = {
                wo = { wrap = true },
                border = "none",
            },
            notification_history = { border = "none" },
            input = { relative = "cursor" },
        },
        picker = {
            sources = {
                files = {
                    hidden = true,
                },
            },
            layout = {
                preset = "ivy",
                layout = {
                    backdrop = 70,
                },
            },
            ui_select = true, -- replace `vim.ui.select` with the snacks picker
            win = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                    },
                },
            },
            icons = {
                ui = {
                    ignored = " ",
                    hidden = " ",
                    follow = "󰭔 ",
                },
                git = {
                    enabled = true, -- show git icons
                    commit = "󰜘 ", -- used by git log
                    staged = "● ", -- staged changes. always overrides the type icons
                    added = " ",
                    deleted = " ",
                    ignored = " ",
                    modified = "○ ",
                    renamed = "󰑕 ",
                    unmerged = " ",
                    untracked = " ",
                },
                kinds = {
                    Control = " ",
                    Collapsed = " ",
                    Copilot = " ",
                    Key = " ",
                    Namespace = "󰦮 ",
                    Null = " ",
                    Number = "󰎠 ",
                    Object = " ",
                    Package = " ",
                    String = " ",
                    Unknown = " ",

                    -- copy from cmp
                    Text = "",
                    Method = "󰊕",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "󱕴",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                    Boolean = " ",
                    Array = " ",
                },
            },
        },
    },

    keys = {
        -- stylua: ignore start
        { "<leader>tzm",     function() Snacks.zen() end,                         desc = "[t]oggle [z]en [m]ode" },
        { "<leader>tZ",      function() Snacks.zen.zoom() end,                    desc = "[t]oggle [Z]oom" },
        { "<leader>db",      function() Snacks.bufdelete() end,                   desc = "[d]elete [b]uffer" },
        { "<leader>rf",      function() Snacks.rename.rename_file() end,          desc = "[r]ename [f]ile" },
        { "<leader>gw",      function() Snacks.gitbrowse() end,                   desc = "Git Browse Web" },
        { "<leader>gb",      function() Snacks.git.blame_line() end,              desc = "Git Blame Line" },
        { "<leader>lgcfh",   function() Snacks.lazygit.log_file() end,            desc = "[l]azy[g]it [c]urrent [f]ile [h]istory" },
        { "<leader>lg",      function() Snacks.lazygit() end,                     desc = "[l]azy[g]it" },
        { "<leader>lgl",     function() Snacks.lazygit.log() end,                 desc = "[l]azy[g]it [l]og (cwd)" },
        { "<leader>un",      function() Snacks.notifier.hide() end,               desc = "Dismiss All Notifications" },
        { "]]",              function() Snacks.words.jump(vim.v.count1) end,      desc = "Next Reference",              mode = { "n", "t" } },
        { "[[",              function() Snacks.words.jump(-vim.v.count1) end,     desc = "Prev Reference",              mode = { "n", "t" } },
        --
        -- Snacks.picker
        --
        { "<leader>/",       function() Snacks.picker.grep() end,                 desc = "Grep" },
        { "<leader>:",       function() Snacks.picker.command_history() end,      desc = "Command History" },
        { "<leader>e",       function() Snacks.picker.explorer() end,             desc = "File explorer" },
        { "<leader>n",       function() Snacks.picker.notifications() end,        desc = "Notification History" },
        { "<leader>U",       function() Snacks.picker.undo() end,                 desc = "Undo" },
        { "<leader><space>", function() Snacks.picker.files() end,                desc = "Find Files" },
        -- Find
        { "<leader>fb",      function() Snacks.picker.buffers() end,              desc = "Buffers" },
        { "<leader>ff",      function() Snacks.picker.files() end,                desc = "Find Files" },
        { "<leader>fg",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
        { "<leader>fr",      function() Snacks.picker.recent() end,               desc = "Recent" },
        -- git
        { "<leader>gl",      function() Snacks.picker.git_log() end,              desc = "Git Log" },
        { "<leader>gs",      function() Snacks.picker.git_status() end,           desc = "Git Status" },
        -- Grep
        { "<leader>sb",      function() Snacks.picker.lines() end,                desc = "Buffer Lines" },
        { "<leader>sB",      function() Snacks.picker.grep_buffers() end,         desc = "Grep Open Buffers" },
        { "<leader>sg",      function() Snacks.picker.grep() end,                 desc = "Grep" },
        { "<leader>sw",      function() Snacks.picker.grep_word() end,            desc = "Visual selection or word",    mode = { "n", "x" } },
        -- Search
        { '<leader>s"',      function() Snacks.picker.registers() end,            desc = "Registers" },
        { "<leader>sa",      function() Snacks.picker.autocmds() end,             desc = "Autocmds" },
        { "<leader>sc",      function() Snacks.picker.command_history() end,      desc = "Command History" },
        { "<leader>sC",      function() Snacks.picker.commands() end,             desc = "Commands" },
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
        { "<leader>sh",      function() Snacks.picker.help() end,                 desc = "Help Pages" },
        { "<leader>sH",      function() Snacks.picker.highlights() end,           desc = "Highlights" },
        { "<leader>sj",      function() Snacks.picker.jumps() end,                desc = "Jumps" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
        { "<leader>sl",      function() Snacks.picker.loclist() end,              desc = "Location List" },
        { "<leader>sM",      function() Snacks.picker.man() end,                  desc = "Man Pages" },
        { "<leader>sm",      function() Snacks.picker.marks() end,                desc = "Marks" },
        { "<leader>sR",      function() Snacks.picker.resume() end,               desc = "Resume" },
        { "<leader>sq",      function() Snacks.picker.qflist() end,               desc = "Quickfix List" },
        { "<leader>uX",      function() Snacks.picker.colorschemes() end,         desc = "Colorschemes" },
        { "<leader>qp",      function() Snacks.picker.projects() end,             desc = "Projects" },
        { "<leader>fs",      function() Snacks.picker.spelling() end,             desc = "Spelling suggestions" },
        -- LSP
        { "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
        { "gr",              function() Snacks.picker.lsp_references() end,       nowait = true,                        desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },
        -- stylua: ignore end
    },

    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Create toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle
                    .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle
                    .option("background", { off = "light", on = "dark", name = "Dark Background" })
                    :map("<leader>ub")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
