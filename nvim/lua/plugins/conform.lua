return {
  "stevearc/conform.nvim",
  cond = not vim.g.vscode,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      go = { "gofmt", "goimports" },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      python = { "black" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      lua = { "stylua" },
      sql = { "sql_formatter" },
    },
    format_on_save = function(bufnr)
      return { timeout_ms = 500, lsp_fallback = true }
    end,
  },
}
