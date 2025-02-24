---@module "lazy"
---@type LazySpec
return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },

  {
    "folke/neoconf.nvim",
    cmd = "NeoConf",
    opts = {},
  },

  -- Nvim LSP config
  {
    "neovim/nvim-lspconfig",

    event = "VimEnter",

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "ibhagwan/fzf-lua",
      "b0o/schemastore.nvim",
      "saghen/blink.cmp",
      {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
        otps = {},
      },
    },
    config = function()
      ---@diagnostic disable-next-line: unused-local
      local function on_attach(client, bufnr) end

      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              formatting = false,
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
              },
            },
          })
        end,
        ["jsonls"] = function()
          lspconfig.jsonls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
              },
            },
            setup = {
              commands = {
                Format = {
                  function() vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 }) end,
                },
              },
            },
          })
        end,
      })

      require("lspconfig.ui.windows").default_options.border = "single"
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })
      vim.diagnostic.config({
        float = { border = "single" },
      })
    end,
    keys = {
      { "<leader>li", ":LspInfo<CR>", desc = "LSP information" },
      { "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", desc = "LSP symbol rename" },
      { "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", desc = "LSP signature help" },
      { "<leader>lk", ":lua vim.lsp.buf.signature_help()<CR>", desc = "LSP signature help" },
      { "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>", desc = "LSP format" },
      { "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostics" },
      { "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", desc = "Quickfix diagnostics" },
      { "<leader>la", ":FzfLua lsp_code_actions<CR>", desc = "LSP code actions" },
      { "K", ":lua vim.lsp.buf.hover()<CR>", desc = "LSP Hover" },
      { "gD", ":lua vim.lsp.buf.declaration()<CR>", desc = "LSP goto declaration" },
      { "gd", ":FzfLua lsp_definitions<cr>", desc = "LSP goto definition" },
      { "gr", ":FzfLua lsp_references<cr>", desc = "LSP goto references" },
      { "gi", ":FzfLua lsp_implementations<cr>", desc = "LSP goto implementations" },
      { "go", ":FzfLua lsp_document_symbols<CR>", desc = "LSP find document symbols" },
      { "gO", ":FzfLua lsp_workspace_symbols<CR>", desc = "LSP find workspace symbols" },
      { "g[", ":lua vim.diagnostic.goto_prev()<CR>", desc = "goto prev diagnostic" },
      { "g]", ":lua vim.diagnostic.goto_next()<CR>", desc = "goto next diagnostic" },
    },
  },
}
