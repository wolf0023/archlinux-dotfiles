###
# シンボリックリンクの作成
# 既存の設定ファイルがある場合はバックアップを作成
# また、コンピュータの種類（ノートPC/デスクトップ）に応じて適切な設定を選択
log "Creating symbolic links for configuration files..." "info" ":: "

# 必要なディレクトリの作成
# ただし、ディレクトリのシンボリックリンクの場合は事前に作成する必要はない
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/hypr"
mkdir -p "$HOME/.config/fish"

sudo mkdir -p /etc/fonts || {
    log "Failed to create directory: /etc/fonts" "error" "==> "
    return 1
}

# Hyprland config
log "Linking Hyprland configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/hypr" "$HOME/.config" "$backup_dir" || return 1

# Neovim config
log "Linking Neovim configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/nvim" "$HOME/.config" "$backup_dir" || return 1

# Fish config
log "Linking Fish configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/fish/config.fish" "$HOME/.config/fish" "$backup_dir" || return 1

# Rofi config
log "Linking Rofi configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/rofi" "$HOME/.config" "$backup_dir" || return 1

# Dunst config
log "Linking Dunst configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/dunst" "$HOME/.config" "$backup_dir" || return 1

# Waybar config
log "Linking Waybar configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/waybar" "$HOME/.config" "$backup_dir" || return 1

# Foot config
log "Linking Foot configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/foot" "$HOME/.config" "$backup_dir" || return 1

# Fontconfig(root権限必須)
log "Linking Fontconfig configuration files..." "info" ":: "
log "Authentication required to link Fontconfig files." "info" "  -> "
setConfigLinkWithSudo "$working_dir/configs/fontconfig/local.conf" "/etc/fonts" "$backup_dir" || return 1


