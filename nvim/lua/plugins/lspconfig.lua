return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    -- Load lspconfig to register default server configs
    require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Lua (with custom settings)
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

    vim.lsp.enable(servers)
  end,
}
