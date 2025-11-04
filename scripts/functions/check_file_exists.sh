# ファイルもしくはディレクトリが存在するかチェック
# $1: ファイル
# 0: 存在する, 1: 存在しない
function checkFileExists {
    local file="$1"

    if [ ! -e "$file" ]; then
        return 1
    fi

    return 0
}
