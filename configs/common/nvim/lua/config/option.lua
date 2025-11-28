-- vim設定
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

-- エンコーディングの設定
opt.encoding = "utf-8" -- vim内部のエンコーディング
opt.fileencoding = "utf-8" -- ファイルのエンコーディング

-- 表示関連
opt.number = true -- 行番号を表示
opt.relativenumber = true -- 相対行番号で表示
opt.signcolumn = "yes" -- 行番号の隣にシグナル列を表示
opt.wrap = true -- 行を折り返す
opt.cursorline = true -- カーソル行を強調表示
-- opt.cursorcolumn = true -- カーソル列を強調表示
opt.ruler = true -- ステータスラインにカーソル位置を表示
opt.laststatus = 3 -- ステータスラインを常に表示
opt.showcmd = true -- コマンドラインを表示
opt.title = true -- タイトルバーにファイル名を表示
opt.list = true -- 空白文字を表示

-- 検索関連
opt.incsearch = true -- 検索時に大文字小文字を区別しない
opt.hlsearch = true -- 検索結果をハイライト
opt.smartcase = true -- 検索時に大文字小文字を区別しない
opt.wrapscan = true -- 検索時にファイルの先頭と末尾を循環

-- 編集関連
opt.autoindent = true -- 自動インデント
opt.smartindent = true -- スマートインデント
opt.breakindent = true -- 折り返し時にインデントを維持
opt.tabstop = 4 -- タブの幅を4スペースに設定
opt.shiftwidth = 4 -- インデントの幅を4スペースに設定
opt.expandtab = true -- タブをスペースに変換
opt.backspace = { "indent", "eol", "start" } -- バックスペースの挙動を設定
opt.virtualedit = "onemore" -- カーソルが行末を超えて移動できるようにする

-- ファイル関連
opt.backup = false -- バックアップファイルを作成しない
opt.writebackup = false -- 書き込み時にバックアップファイルを作成しない
opt.swapfile = false -- スワップファイルを作成しない
opt.undofile = false -- アンドゥファイルを作成しない
opt.autoread = true -- ファイルが外部で変更された場合、自動的に再読み込み
opt.confirm = true -- ファイルの変更を確認する

-- その他の設定
opt.showmatch = true -- マッチする括弧を強調表示
opt.wildmenu = true -- ワイルドカードメニューを有効にする
opt.wildmode = "longest:full,full" -- ワイルドカード補完の動作を設定
opt.clipboard = "unnamedplus" -- システムクリップボードを使用
opt.belloff = "all" -- すべてのベルを無効にする
cmd[[set updatetime=300]] -- スワップファイルが更新されるまでの時間(ms)

-- テーマの設定
opt.background = "dark" -- ダークテーマを使用
opt.termguicolors = true -- 24ビットカラーを有効にする
cmd[[colorscheme catppuccin]] -- テーマの設定

