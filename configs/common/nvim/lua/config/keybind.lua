local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 基本操作
map('i', 'jj', '<ESC>', opts)
map('n', '<ESC><ESC>', ':nohlsearch<CR>', opts)
map('n', '<C-s>', ':w<CR>', opts)

-- 画面移動（中央寄せ）
map('n', 'j', 'gjzz', opts)
map('n', 'k', 'gkzz', opts)
map('n', 'H', 'Hzz', opts)
map('n', 'L', 'Lzz', opts)
map('n', 'dd', 'ddzz', opts)

-- ターミナルモード
map('t', '<ESC>', '<C-\\><C-n>', opts)
map('t', '<C-[>', '<C-\\><C-n>', opts)

-- ウィンドウ分割
map('n', '<space>s', '<C-w>s', opts)
map('n', '<space>v', '<C-w>v', opts)

-- ウィンドウ移動
map('n', '<space>q', '<C-w>q', opts)
map('n', '<space>w', '<C-w>w', opts)
map('n', '<space>W', '<C-w>W', opts)
map('n', '<space>h', '<C-w>h', opts)
map('n', '<space>j', '<C-w>j', opts)
map('n', '<space>k', '<C-w>k', opts)
map('n', '<space>l', '<C-w>l', opts)

-- ウィンドウサイズ変更 
map('n', '<space><Left>', '8<C-w><', opts)
map('n', '<space><Right>', '8<C-w>>', opts)
map('n', '<space><Up>', '4<C-w>+', opts)
map('n', '<space><Down>', '4<C-w>-', opts)

-- バッファ操作
map('n', '<space>n', ':bnext<CR>', opts)
map('n', '<space>N', ':bprevious<CR>', opts)

-- lsp操作
map('n', 'gD', vim.lsp.buf.declaration, opts)
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map('n', 'gi', vim.lsp.buf.implementation, opts)
map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', 'gr', vim.lsp.buf.references, opts)

-- 診断メッセージの操作
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
