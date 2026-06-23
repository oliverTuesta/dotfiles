local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- ============================================================
-- UNIVERSAL MAPPINGS (work in both Neovim and VSCode Neovim)
-- ============================================================

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement numbers
keymap.set('n', '+', '<C-a>')
keymap.set('n', '_', '<C-x>')

-- Insert new line without leaving normal mode
keymap.set('n', 'o', 'm`o<Esc>``')
keymap.set('n', 'O', 'm`O<Esc>``')

-- Reset search highlight
keymap.set('n', '<Space>h', ':noh<Return>', { silent = true })

-- Window navigation (C-w motions work in VSCode Neovim too)
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')

-- ============================================================
-- VSCODE-SPECIFIC MAPPINGS
-- ============================================================

if vim.g.vscode then
  local vscode = require('vscode')

  -- File explorer (replaces :Ex)
  keymap.set('n', '<leader>t', function()
    vscode.call('workbench.view.explorer')
  end, { silent = true })

  -- Tabs
  keymap.set('n', 'te', function()
    vscode.call('workbench.action.files.newUntitledFile')
  end, { silent = true })
  keymap.set('n', 'tl', function()
    vscode.call('workbench.action.nextEditor')
  end, { silent = true })
  keymap.set('n', 'th', function()
    vscode.call('workbench.action.previousEditor')
  end, { silent = true })

  -- Splits
  keymap.set('n', 'ss', function()
    vscode.call('workbench.action.splitEditorDown')
  end, { silent = true })
  keymap.set('n', 'sv', function()
    vscode.call('workbench.action.splitEditor')
  end, { silent = true })

  -- LSP
  keymap.set('n', 'gd', function()
    vscode.call('editor.action.revealDefinition')
  end, { silent = true })
  keymap.set('n', 'gr', function()
    vscode.call('editor.action.goToReferences')
  end, { silent = true })
  keymap.set('n', 'K', function()
    vscode.call('editor.action.showHover')
  end, { silent = true })
  keymap.set('n', '<leader>rn', function()
    vscode.call('editor.action.rename')
  end, { silent = true })
  keymap.set('n', '<leader>ca', function()
    vscode.call('editor.action.quickFix')
  end, { silent = true })
  keymap.set('n', '[d', function()
    vscode.call('editor.action.marker.prevInFiles')
  end, { silent = true })
  keymap.set('n', ']d', function()
    vscode.call('editor.action.marker.nextInFiles')
  end, { silent = true })
  keymap.set('n', '<leader>e', function()
    vscode.call('editor.action.showHover')
  end, { silent = true })
  keymap.set('n', '<leader>f', function()
    vscode.call('editor.action.formatDocument')
  end, { silent = true })

  -- Markdown preview (VSCode extension: "Markdown Preview Enhanced" or built-in)
  keymap.set('n', '<C-p>', function()
    vscode.call('markdown.showPreviewToSide')
  end, { silent = true })

  -- ============================================================
  -- NATIVE NEOVIM-SPECIFIC MAPPINGS
  -- ============================================================
else
  -- File explorer
  keymap.set('n', '<leader>t', vim.cmd.Ex, { silent = true })

  -- Tabs
  keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
  keymap.set('n', 'tl', ':tabnext<Return>', { silent = true })
  keymap.set('n', 'th', ':tabprevious<Return>', { silent = true })

  -- Splits
  keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
  keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

  -- Markdown preview
  keymap.set('n', '<C-p>', ':MarkdownPreviewToggle<Return>', { silent = true })

  -- LSP (set on LspAttach so opts.buffer is available)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
      local opts = { buffer = ev.buf, silent = true }

      keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

      keymap.set('n', '<leader>e', function()
        vim.diagnostic.open_float(nil, { focus = false })
      end, opts)

      keymap.set('n', '<leader>f', function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, opts)
    end,
  })
end
