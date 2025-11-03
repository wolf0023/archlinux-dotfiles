# multilibを有効化
log "Enabling multilib repository in pacman.conf..." "info" ":: "
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    sudo echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null ||{
        log "Failed to enable multilib repository in /etc/pacman.conf" "error" "==> "
        return 1
    }
else
    log "Multilib repository is already enabled." "warning" "==> "
fi

###
# パッケージのインストール
log "Installing packages from pkglist.txt..." "info" ":: "
checkFileExists "$working_dir/pkglist.txt"

# ファイルのリダイレクトはユーザ権限で行う
cat "$working_dir/pkglist.txt" | sudo pacman -Syu --needed - || {
    log "Failed to install packages from pkglist.txt." "error" "==> "
    return 1
}
