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

# リストからパッケージをインストールするときは、何も変更がない場合に1を返すため
# インストール結果が1より大きい場合にエラーとする
cat "$working_dir/pkglist.txt" | sudo pacman -Syu --needed -
status=$? # インストールの終了ステータスを取得
if [ $status -gt 1 ]; then
    log "Failed to install packages from pkglist.txt." "error" "==> " return 1
    return 1
fi
