# 指定した設定ディレクトリのすべてのファイルのリンクを `$HOME/.config/` 下に作成する関数
#
# Args:
#   $1 - 設定ディレクトリがある場所 (必須)
#   $2 - バックアップ先 (必須)
#
# Returns:
#   0: 成功時
#   1: 引数の個数が違う
#   2: 引数で指定したディレクトリが存在しない
#   10: シンボリックリンクの削除に失敗11: バックアップ中に問題が発生20: ディレクトリ作成に失敗
#   21: シンボリックリンクの作成に失敗
#
# Notes:
#   * すでにリンクが貼られている場合はスキップします。
function setConfigLinks {
    # 引数のチェック
    if [ "$#" -ne 2 ]; then
        return 1
    fi

    # バックアップ先のディレクトリが存在するかのチェック
    if [ ! -d "$1" ] || [ ! -d "$2" ]; then
        return 2
    fi

    local config_dir="$1" # 引数
    local backup_dir="$2" # 引数

    # ツールのディレクトリごとバックアップを取る
    local tool_path tool_name target_dir

    for tool_path in "$config_dir/"*; do
        if [ -d "$tool_path" ]; then
            tool_name=$(basename "$tool_path")
            target_dir="$HOME/.config/$tool_name"

            # シンボリックリンクの場合は削除
            if [ -L "$target_dir" ]; then
                rm -f "$target_dir" || {
                    echo "$target_dir" >&2
                    return 10
                }
            fi

            # 指定された場所にバックアップ
            if [ -d "$target_dir" ]; then
                local filename="${tool_name}_$(date +%Y%m%d_%H%M%S).tar.gz"
                tar -czf "$backup_dir/${filename}" -C "$HOME/.config" "$tool_name" || {
                    echo "$target_dir" >&2
                    return 11
                }
            fi
        fi
    done

    # すべてのツールのリンクを生成する
    while IFS= read -r file; do
        local target="$HOME/.config/${file#$config_dir/}"

        # すでに存在している場合はスキップ
        if [ -L "$target" ] && [ "$(realpath "$target")" = "$file" ]; then
            continue
        fi

        mkdir -p "$(dirname "$target")" || {
            echo "$target" >&2
            return 20
        }
        ln -snf "$file" "$target" || {
            echo "$target" >&2
            return 21
        }
    done < <(find "$config_dir" -type f)
}
