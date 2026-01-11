###
# フォントのインストール
log "Installing fonts..." "info" ":: "

# フォントディレクトリの作成
# 現ディレクトリパスを保存
current_dir=$(pwd)

mkdir -p "$HOME/.local/share/fonts"
cd "$HOME/.local/share/fonts" || { 
    log "Could not change directory to font directory: $HOME/.local/share/fonts" "error" "  --> "
    return 1
}

# Moralerspace font
installFont "https://github.com/yuru7/moralerspace/releases/download/v2.0.0/Moralerspace_v2.0.0.zip" || {
    log "Failed to install Moralerspace font." "error" "  --> "
}

# フォントキャッシュの更新
fc-cache -fv

# 元のディレクトリに戻る
cd "$current_dir" || {
    log "Could not change directory to the original directory: $current_dir" "error" "  --> "
    return 1
}
