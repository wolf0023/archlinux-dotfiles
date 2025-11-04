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
inoremap <silent> ｊｊ <ESC>
" ESCを二回押したとき検索時のハイライトを消去 
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
" crtl+sで保存
nnoremap <C-s> :w<CR>
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


" vim-plug
"------------------------------
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

  Plug 'github/copilot.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 

  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

  Plug 'preservim/vim-indent-guides'

  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  
call plug#end()


" plug系の設定
"------------------------------
" Github copilot tabキーのマッピングを無効にする
let g:copilot_no_tab_map = v:true

" vim-airlineのテーマを設定
let g:airline_theme = 'wombat'
" vim-airlineのpowerline fontsを有効にする
let g:airline_powerline_fonts = 1
" vim-airlineのタブラインのテーマを設定
let g:airline#extensions#tabline#enabled = 1
" vim-airlineのタブラインのフォーマット設定
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" indent guidesをデフォルトで有効にする
let g:indent_guides_enable_on_vim_startup = 1
" indent guidesのスタートレベルを2にする
let g:indent_guides_start_level = 2
" indent guidesのガイドサイズを1にする
let g:indent_guides_guide_size = 1

" NERDTreeをファイルを指定したときのみ自動で起動し、カーソルは元のウィンドウに戻す
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" NERDTreeのみ残っていた場合はVimを閉じる
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif


" plug系のkey bindings
"------------------------------
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" coc.nvim
" Tabキーで補完候補を選択
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
" Shift+Tabで補完候補を戻す
inoremap <silent><expr> <S-TAB>
    \ coc#pum#visible() ? coc#pum#prev(1) :
    \ "\<C-h>"
" Enterキーで選択した候補を確定
inoremap <silent><expr> <CR>
    \ coc#pum#visible() ? coc#pum#confirm() :
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" コードジャンプ
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)
" ドキュメントの表示 
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocAction('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
