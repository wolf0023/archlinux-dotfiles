###
# フォントのインストール
log "Installing fonts..." "info" ":: "

# フォントディレクトリの作成
# 現ディレクトリパスを保存
current_dir=$(pwd)

mkdir -p "$HOME/.local/share/fonts"
cd "$HOME/.local/share/fonts" || { 
    log "Could not change directory to font directory: $HOME/.local/share/fonts" "error" "==> "
}

# Moralerspace font
installFont "https://github.com/yuru7/moralerspace/releases/download/v2.0.0/Moralerspace_v2.0.0.zip" || {
    log "Failed to install Moralerspace font." "error" "  --> "
}
# Noto Sans CJK KR and SC fonts
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/08_NotoSerifCJKkr.zip" || {
    log "Failed to install CJK KR font." "error" "  --> "
}
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/09_NotoSerifCJKsc.zip" || {
    log "Failed to install CJK SC font." "error" "  --> "
}

# フォントキャッシュの更新
fc-cache -fv

# 元のディレクトリに戻る
cd "$current_dir" || {
    log "Could not change directory to the original directory: $current_dir" "error" "==> "
}
