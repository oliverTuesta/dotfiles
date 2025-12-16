return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "clangd",
      },
    },
  },
}
