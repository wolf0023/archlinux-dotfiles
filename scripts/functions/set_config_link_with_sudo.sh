# シンボリックリンクをsudo権限で作成する
# $1: ソースファイル
# $2: リンク先ファイル
# $3: バックアップディレクトリ
function setConfigLinkWithSudo {
    local source_file="$1"
    local target_file="$2"
    local backup_dir="$3"

    # ソースファイルの存在チェック
    checkFileExists "$source_file" || {
        log "Source file does not exist: $source_file" "error" "  --> "
        return 1
    }

    # 既存のファイルやディレクトリをバックアップ
    if [ -e "$target_file" ] || [ -d "$backup_dir" ]; then
        sudo mv "$target_file" "${backup_dir}${target_file}"
    fi

    sudo ln -sf --backup=existing "$source_file" "$target_file" || {
        log "Failed to create symbolic link from $source_file to $target_file with sudo" "error" "  --> "
        return 1
    }
}
