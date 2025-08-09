local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 基本操作
map('i', 'jj', '<ESC>', opts)
map('i', 'ｊｊ', '<ESC>', opts)
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

-- ウィンドウ操作
map('n', '<space>s', '<C-w>s', opts)
map('n', '<space>v', '<C-w>v', opts)
map('n', '<space>q', '<C-w>q', opts)
map('n', '<space>w', '<C-w>w', opts)
map('n', '<space>W', '<C-w>W', opts)
map('n', '<space>h', '<C-w>h', opts)
map('n', '<space>j', '<C-w>j', opts)
map('n', '<space>k', '<C-w>k', opts)
map('n', '<space>l', '<C-w>l', opts)

-- バッファ操作
map('n', '<space>n', ':bnext<CR>', opts)
map('n', '<space>p', ':bprevious<CR>', opts)
