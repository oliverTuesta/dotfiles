return {
  'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    -- Keymaps (from official docs, adapted to Lazy)
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
    vim.keymap.set("n", "<leader>fw", builtin.live_grep,  { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Telescope help tags" })
  end,
}

