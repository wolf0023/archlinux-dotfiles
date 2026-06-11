local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader キーをスペースに設定
vim.g.mapleader = ' '

-- 基本操作
map('i', 'jj', '<ESC>', opts)
map('n', '<ESC><ESC>', ':nohlsearch<CR>', opts)
map('n', '<C-[><C-[>', ':nohlsearch<CR>', opts)

-- 画面移動（中央寄せ）
map('n', 'j', 'gjzz', opts)
map('n', 'k', 'gkzz', opts)

-- ターミナルモード
map('t', '<ESC>', '<C-\\><C-n>', opts)

-- lsp操作
map('n', '<leader>gD', vim.lsp.buf.declaration, opts)
map('n', '<leader>gd', vim.lsp.buf.definition, opts)
map('n', '<leader>K', vim.lsp.buf.hover, opts)
map('n', '<leader>gi', vim.lsp.buf.implementation, opts)
map('n', '<leader>gK', vim.lsp.buf.signature_help, opts)
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', '<leader>gr', vim.lsp.buf.references, opts)
