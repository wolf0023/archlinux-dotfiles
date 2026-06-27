###
# シンボリックリンクの作成
# 既存の設定ファイルがある場合はバックアップを作成
log "Creating symbolic links for configuration files..." "info" ":: "

log "Linking all configuration files..." "info" ":: "
error_message=$(setConfigLinks "$working_dir/configs" "$backup_dir" 2>&1)
case $? in
    0) return 0;;
    1)
        log "There are not enough arguments." "error" "==> "
        return 1
        ;;
    2)
        log "The backup directory does not exist." "error" "==> "
        return 1
        ;;
    10)
        log "Failed to remove existing symbolic link: $error_message" "error" "==> "
        return 1
        ;;
    11)
        log "Failed to backup existing directory: $error_message" "error" "==> "
        return 1
        ;;
    20)
        log "Failed to create directory: $error_message" "error" "==> "
        return 1
        ;;
    21)
        log "Failed to create symbolic link: $error_message" "error" "==> "
        return 1
        ;;
    *)
        log "An unexepected promlem has occurred!" "error" "==> "
        return 1
        ;;
esac
