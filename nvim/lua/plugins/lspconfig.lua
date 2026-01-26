return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    -- Capabilities (optional but still valid)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    local servers = {
      "lua_ls",
      "gopls",
      "ts_ls",
      "html",
      "cssls",
      "jsonls",
      "yamlls",
      "clangd",
      "tailwindcss",
    }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
    end
  end,
}

