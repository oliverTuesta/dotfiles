vim.opt.termguicolors = true

vim.g.catppuccin_flavour = "frappe"  -- or "latte", "frappe", "macchiato", "mocha"
vim.cmd.colorscheme("catppuccin")

local function set_catppuccin(flavour)
  vim.g.catppuccin_flavour = flavour
  vim.cmd.colorscheme("catppuccin")
end

vim.api.nvim_create_user_command("CatLatte", function()
  set_catppuccin("latte")
end, {})

vim.api.nvim_create_user_command("CatFrappe", function()
  set_catppuccin("frappe")
end, {})

vim.api.nvim_create_user_command("CatMacchiato", function()
  set_catppuccin("macchiato")
end, {})

vim.api.nvim_create_user_command("CatMocha", function()
  set_catppuccin("mocha")
end, {})

