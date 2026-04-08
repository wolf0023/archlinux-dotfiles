local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader キーをスペースに設定
vim.g.mapleader = ' '

-- 基本操作
map('i', 'jj', '<ESC>', opts)
map('n', '<ESC><ESC>', ':nohlsearch<CR>', opts)

-- 画面移動（中央寄せ）
map('n', 'j', 'gjzz', opts)
map('n', 'k', 'gkzz', opts)

-- ターミナルモード
map('t', '<ESC>', '<C-\\><C-n>', opts)
map('t', '<C-[>', '<C-\\><C-n>', opts)

-- ウィンドウ分割
map('n', '<leader>s', '<C-w>s', opts)
map('n', '<leader>v', '<C-w>v', opts)

-- ウィンドウ移動
map('n', '<leader>q', '<C-w>q', opts)
map('n', '<leader>w', '<C-w>w', opts)
map('n', '<leader>W', '<C-w>W', opts)
map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>j', '<C-w>j', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>l', '<C-w>l', opts)

-- ウィンドウサイズ変更 
map('n', '<leader><Left>', '8<C-w><', opts)
map('n', '<leader><Right>', '8<C-w>>', opts)
map('n', '<leader><Up>', '4<C-w>+', opts)
map('n', '<leader><Down>', '4<C-w>-', opts)

-- lsp操作
map('n', '<leader>gD', vim.lsp.buf.declaration, opts)
map('n', '<leader>gd', vim.lsp.buf.definition, opts)
map('n', '<leader>K', vim.lsp.buf.hover, opts)
map('n', '<leader>gi', vim.lsp.buf.implementation, opts)
map('n', '<leader>gK', vim.lsp.buf.signature_help, opts)
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', '<leader>gr', vim.lsp.buf.references, opts)
