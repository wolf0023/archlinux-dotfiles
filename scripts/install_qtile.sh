###
# qtileのインストール
log "Installing qtile using uvtool..." "info" ":: "

# current directoryをhomeに変更
# 現ディレクトリパスを保存
current_dir=$(pwd)
cd "$HOME" || {
    log "Could not change directory to home: $HOME" "error" "==> "
}

# uvプロジェクトの初期化
uv init -p pypy3 uv-qtile || {
    log "Failed to initialize uvtool for qtile." "error" "==> "
}

# venv環境を構築し、アクティベート
cd uv-qtile || {
    log "Could not change directory to uv-qtile: $HOME/uv-qtile" "error" "==> "
}
uv sync || {
    log "Failed to sync uvtool packages for qtile." "error" "==> "
}
source .venv/bin/activate || {
    log "Failed to activate uvtool virtual environment for qtile." "error" "==> "
}

# uvtoolを使ってqtileをインストール
uv add qtile[widgets] || {
    log "Failed to install qtile using uvtool." "error" "==> "
}

# 元のディレクトリに戻る
cd "$current_dir" || {
    log "Could not change directory to the original directory: $current_dir" "error" "==> "
}
