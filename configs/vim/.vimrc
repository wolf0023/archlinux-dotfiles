" エンコーディングの設定
"------------------------------
" vim内部のエンコーディングをutf-8に設定
set encoding=utf-8
" ファイルのエンコーディングをutf-8に設定
set fileencoding=utf-8


" 表示関連
"------------------------------
" シンタックスハイライトを有効にする
syntax on
" vimの左側に行番号を表示する
set number
" signcolumnを常に表示する
set signcolumn=yes
" カーソルがある行を強調表示する
set cursorline
" カーソルの縦方向に強調表示をする
set cursorcolumn
" 現在のカーソル位置を表示する
set ruler
" ステータスラインを常に表示する
set laststatus=2
" 入力中のコマンドの文字をステータスラインに表示する
set showcmd
" ターミナルのタイトルをセットする
set title 
" スペース入力を可視化する
set list
set listchars=trail:␣
" 全角文字用
set ambiwidth=double
" テーマの設定
colorscheme habamax
" 256色を有効にする
set t_Co=256
" 背景を透明にする
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE


" 検索関連
"------------------------------
" 文字の検索中に候補を表示する
set incsearch
" 検索でヒットした文字を強調する
set hlsearch
" 小文字のみ大文字小文字を区別しない
set smartcase
" 検索時に候補の最後に行くとまた最初に戻るようにする
set wrapscan


" 編集関連
"------------------------------
" ひとつ前の行のインデントに合わせてインデントを入れる
set autoindent
" autoindentと同じ
set smartindent
" 折り返した行の先頭位置を揃える
set breakindent
" TAB幅をスペース4つ分にする
set tabstop=4
" 行頭でのTAB幅をスペース4つ分にする
set shiftwidth=4
" TAB文字を半角スペースにする
set expandtab
" backspaceを有効にする
set backspace=indent,eol,start
" カーソルを行末の最後の文字の1文字先まで移動できるようにする
set virtualedit=onemore
" ファイル上書き保存前にバックアップを作ることを無効にする
set nowritebackup
" 保存時にバックアップを作ることを無効にする
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" 終了時に保存するかどうか確認する
set confirm
" 自動でコメントアウトされるのを無効にする
autocmd BufEnter * setlocal formatoptions-=cro


" その他の設定
"------------------------------
" 対応する括弧を表示
set showmatch
" コマンド入力中にTABを押すことで候補を表示する
set wildmenu
set wildmode=longest,full
" OSとクリップボードを共有する
set clipboard^=unnamedplus
" ビープ音を消す
set belloff=all


" キー設定
"------------------------------
" 'jj'でESCにキーマッピング
inoremap <silent> jj <ESC>
" ESCを二回押したとき検索時のハイライトを消去 
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
" 折り返し時に表示上行単位での移動をできるようにし、移動したときにカーソルを画面の中央に持ってくる
nnoremap j gjzz
nnoremap k gkzz
" 移動したときにカーソルを画面の中央に持ってくる
nnoremap H Hzz
nnoremap L Lzz
nnoremap dd ddzz
" ターミナルモード時ESCでNormalモードに移行
tnoremap <ESC> <C-\><C-n>
" バッファの移動
nnoremap <silent> <space>n :bnext<CR>
nnoremap <silent> <space>p :bprevious<CR>


" ---- ウィンドウ操作
" ウィンドウ分割
nnoremap <silent> <space>s <C-w>s
nnoremap <silent> <space>v <C-w>v
" ウィンドウを閉じる
nnoremap <silent> <space>q <C-w>q
" ウィンドウの移動
nnoremap <silent> <space>w <C-w>w
nnoremap <silent> <space>W <C-w>W
nnoremap <silent> <space>h <C-w>h
nnoremap <silent> <space>j <C-w>j
nnoremap <silent> <space>k <C-w>k
nnoremap <silent> <space>l <C-w>l

