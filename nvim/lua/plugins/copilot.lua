return {
  "github/copilot.vim",
  cond = not vim.g.vscode,
  config = function()
    vim.g.copilot_enabled = false
  end,
}
