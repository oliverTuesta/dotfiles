local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local mocha = require("catppuccin.palettes").get_palette "mocha"

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get {
    styles = { "italic", "bold" },
    custom = {
      all = {
        fill = { bg = "#000000" },
      },
      mocha = {
        background = { fg = mocha.text },
      },
      latte = {
        background = { fg = "#000000" },
      },
    },
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
