local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and uses telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        -- normal mode mappings
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

-- Grep files
vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
-- Grep Buffers
vim.keymap.set('n', '\\\\',
  function()
    builtin.buffers()
  end)
-- Grep Help documentation
vim.keymap.set('n', ';h',
  function()
    builtin.help_tags()
  end)
-- Live Grep
vim.keymap.set('n', ';r',
  function()
    builtin.live_grep()
  end)
-- List results of pickers used
vim.keymap.set('n', ';;',
  function()
    builtin.resume()
  end)
-- Lists diagnostics for all opened buffers
vim.keymap.set('n', ';e',
  function()
    builtin.diagnostics()
  end)

vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

-- Avoid fold levels to affect Telescope
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  command = "setlocal nofoldenable",
})
