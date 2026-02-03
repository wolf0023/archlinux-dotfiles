###
# シンボリックリンクの作成
# 既存の設定ファイルがある場合はバックアップを作成
# また、コンピュータの種類（ノートPC/デスクトップ）に応じて適切な設定を選択
log "Creating symbolic links for configuration files..." "info" ":: "

# 必要なディレクトリの作成
# ただし、ディレクトリのシンボリックリンクの場合は事前に作成する必要はない
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/qtile"
mkdir -p "$HOME/.config/fish"

sudo mkdir -p /etc/fonts || {
    log "Failed to create directory: /etc/fonts" "error" "==> "
    return 1
}

# X11 configs
log "Linking X11 configuration files..." "info" ":: "
if [ "$(checkComputerType)" == "laptop" ]; then
    # laptop
    setConfigLink "$working_dir/configs/laptop/x11/.xinitrc" "$HOME" "$backup_dir" || return 1
    setConfigLink "$working_dir/configs/laptop/x11/.Xresources" "$HOME" "$backup_dir" || return 1
else
    # desktop
    setConfigLink "$working_dir/configs/desktop/x11/.xinitrc" "$HOME" "$backup_dir" || return 1
    setConfigLink "$working_dir/configs/desktop/x11/.Xresources" "$HOME" "$backup_dir" || return 1
fi

# qtile configs
log "Linking qtile configuration files..." "info" ":: "

setConfigLink "$working_dir/configs/common/qtile/config.py" "$HOME/.config/qtile" "$backup_dir" || return 1
setConfigLink "$working_dir/configs/common/qtile/palette.py" "$HOME/.config/qtile" "$backup_dir" || return 1
setConfigLink "$working_dir/configs/common/qtile/widgets" "$HOME/.config/qtile" "$backup_dir" || return 1
setConfigLink "$working_dir/configs/common/qtile/wallpaper.jpg" "$HOME/.config/qtile" "$backup_dir" || return 1
setConfigLink "$working_dir/configs/common/qtile/external_display.py" "$HOME/.config/qtile" "$backup_dir" || return 1
setConfigLink "$working_dir/configs/common/qtile/keybindings.py" "$HOME/.config/qtile" "$backup_dir" || return 1

if [ "$(checkComputerType)" == "laptop" ]; then
    # laptop
    log "Laptop detected. Linking the configuration files for laptop..." "info" "  -> "
    setConfigLink "$working_dir/configs/laptop/qtile/screens.py" "$HOME/.config/qtile" "$backup_dir" || return 1
    setConfigLink "$working_dir/configs/laptop/qtile/autostart.py" "$HOME/.config/qtile" "$backup_dir" || return 1
    setConfigLink "$working_dir/configs/laptop/qtile/additional_keybindings.py" "$HOME/.config/qtile" "$backup_dir" || return 1
else
    # desktop
    log "Desktop detected. Linking the configuration files for desktop..." "info" "  -> "
    setConfigLink "$working_dir/configs/desktop/qtile/screens.py" "$HOME/.config/qtile" "$backup_dir" || return 1
    setConfigLink "$working_dir/configs/desktop/qtile/autostart.py" "$HOME/.config/qtile" "$backup_dir" || return 1
    setConfigLink "$working_dir/configs/desktop/qtile/additional_keybindings.py" "$HOME/.config/qtile" "$backup_dir" || return 1
fi

# Neovim config
log "Linking Neovim configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/common/nvim" "$HOME/.config" "$backup_dir" || return 1

# Fish config
log "Linking Fish configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/common/fish/config.fish" "$HOME/.config/fish" "$backup_dir" || return 1

# Rofi config
log "Linking Rofi configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/common/rofi" "$HOME/.config" "$backup_dir" || return 1

# Dunst config
log "Linking Dunst configuration files..." "info" ":: "
setConfigLink "$working_dir/configs/common/dunst/dunstrc" "$HOME/.config/dunst" "$backup_dir" || return 1

# Fontconfig(root権限必須)
log "Linking Fontconfig configuration files..." "info" ":: "
log "Authentication required to link Fontconfig files." "info" "  -> "
setConfigLinkWithSudo "$working_dir/configs/common/fontconfig/local.conf" "/etc/fonts" "$backup_dir" || return 1


