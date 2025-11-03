# シンボリックリンクを作成する
# $1: ソースパス
# $2: リンク先パス
# $3: バックアップディレクトリ
function setConfigLinkWithSudo {
    local source_path="$1"
    local target_path="$2"
    local backup_dir="$3"

    # ソースファイルの存在チェック
    checkFileExists "$source_path" || {
        log "Source file does not exist: $source_path" "error" "  --> "
        return 1
    }

    # 既存のファイルやディレクトリをバックアップ
    if [ -e "$target_path" ]; then
        local filename
        filename="${target_path##*/}-$(date +%Y%m%d%H%M%S).tar.gz"

        sudo tar czf "$filename" "$target_path" || {
            log "Failed to backup existing file or directory: $target_path" "error" "  --> "
            return 1
        }
        sudo mv "$filename" "$backup_dir/" || {
            log "Failed to move backup to backup directory: $backup_dir" "error" "  --> "
            return 1
        }
        sudo rm -rf "$target_path" || {
            log "Failed to remove existing file or directory after backup: $target_path" "error" "  --> "
            return 1
        }
    fi

    sudo ln -sf "$source_path" "$target_path" || {
        log "Failed to create symbolic link from $source_path to $target_path" "error" "  --> "
        return 1
    }
}
