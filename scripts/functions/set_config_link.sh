# シンボリックリンクを作成する
# $1: ソースファイル
# $2: リンク先ファイル
# $3: バックアップディレクトリ
function setConfigLink {
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
        local target_name
        local target_dir
        target_name="${target_path##*/}"
        target_dir="${target_path%/*}"
        filename="${target_name}_$(date +%Y%m%d_%H%M%S).tar.gz"

        tar czf "$filename" -C "$target_dir" "$target_name" || {
            log "Failed to backup existing file or directory: $target_path" "error" "  --> "
            return 1
        }
        mv "$filename" "$backup_dir/" || {
            log "Failed to move backup to backup directory: $backup_dir" "error" "  --> "
            return 1
        }
        rm -rf "$target_path" || {
            log "Failed to remove existing file or directory after backup: $target_path" "error" "  --> "
            return 1
        }
    fi

    ln -sf "$source_path" "$target_path" || {
        log "Failed to create symbolic link from $source_path to $target_path" "error" "  --> "
        return 1
    }
}
