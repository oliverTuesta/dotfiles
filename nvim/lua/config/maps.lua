local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- Ex mode
vim.keymap.set("n", "<leader>iv", vim.cmd.Ex)

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
