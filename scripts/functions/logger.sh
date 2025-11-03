# ログを表示する関数
# $1: メッセージ内容
# $2 : メッセージタイプ (info, notice, warning, error)
# $3 : prefix (オプション)
function log {
    local message="$1"
    local message_type="${2:-info}"
    local prefix="${3:-}"

    local color_reset="\e[0m"
    local color_info="\e[36m"    # Cyan
    local color_warning="\e[33m" # Yellow
    local color_error="\e[31m"   # Red

    case "$message_type" in
        "info")
            echo -e "${prefix}${message}"
            ;;
        "notice")
            echo -e "${prefix}${color_info}NOTICE: ${color_reset}${message}"
            ;;
        "warning")
            echo -e "${prefix}${color_warning}WARNING: ${color_reset}${message}"
            ;;
        "error")
            echo -e "${prefix}${color_error}ERROR: ${color_reset}${message}"
            ;;
        *)
            echo -e "${prefix}${message}"
            ;;
    esac
}

