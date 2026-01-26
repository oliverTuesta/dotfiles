local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- Ex mode
vim.keymap.set("n", "<leader>t", vim.cmd.Ex)

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement numbers
keymap.set('n', '+', '<C-a>')
keymap.set('n', '_', '<C-x>')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'tl', ':tabnext<Return>', { silent = true })
keymap.set('n', 'th', ':tabprevious<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Inert new line without leaving normal mode
vim.keymap.set('n', 'o', 'm`o<Esc>``')
vim.keymap.set('n', 'O', 'm`O<Esc>``')

-- Reset search
vim.keymap.set('n', '<Space>h', ':noh<Return>')

-- Markdown preview
vim.keymap.set('n', '<C-p>', ':MarkdownPreviewToggle<Return>')

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    vim.keymap.set("n", "<leader>e", function()
      vim.diagnostic.open_float(nil, { focus = false })
    end, opts)

    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

