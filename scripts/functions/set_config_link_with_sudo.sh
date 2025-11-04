# シンボリックリンクを作成する
# $1: ソースファイル
# $2: リンク先ディレクトリ
# $3: バックアップディレクトリ
function setConfigLinkWithSudo {
    local source_path="$1"
    local target_dir="$2"
    local backup_dir="$3"

    local target_path
    target_path="$target_dir/$(basename "$source_path")"

    # ソースファイルの存在チェック
    checkFileExists "$source_path" || {
        log "Source file does not exist: $source_path" "error" "  --> "
        return 1
    }

    # 既存のファイルやディレクトリをバックアップ
    if [ -e "$target_path" ]; then
        log "Backing up existing file or directory: $target_path" "info" "  --> "

        local filename
        local target_name
        target_name="$(basename "$target_path")"
        filename="${target_name}_$(date +%Y%m%d_%H%M%S).tar.gz"

        sudo tar czf "$filename" -C "$target_dir" "$target_name" || {
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

    sudo ln -sf --target-directory="$target_dir" "$source_path" || {
        log "Failed to create symbolic link from $source_path to $target_path" "error" "  --> "
        return 1
    }
}
