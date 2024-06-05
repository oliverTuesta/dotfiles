local status, icons = pcall(require, "nvim-web-devicons")
if (not status) then return end

icons.setup {
  -- Override default icons with personal ones
  override = {
  },

  -- Globall enable default icons (default to false)
  default = true
}
