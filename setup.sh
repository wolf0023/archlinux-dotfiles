#!/bin/bash
set -uo pipefail

###
# 変数定義
working_dir="$(pwd)"
backup_dir="$HOME/.archlinux-dotfiles-backup"

# 作業ディレクトリが正しいか確認
# パスに"archlinux-dotfiles"が含まれていることを確認
if [[ "$working_dir" != *"archlinux-dotfiles" ]]; then
    echo "Working directory $working_dir does not seem to be the archlinux-dotfiles repository. Please run this script from the cloned repository." >&2
    exit 1
fi

# バックアップディレクトリの作成
if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir" || {
        echo "Failed to create backup directory: $backup_dir" >&2
        exit 1
    }
fi

###
# 関数定義
# ログ関数
source "$working_dir/scripts/functions/logger.sh" || {
    echo "Failed to source logger.sh" >&2
    exit 1
}
# シンボリックリンク作成関数
source "$working_dir/scripts/functions/set_config_link.sh" || {
    echo "Failed to source set_config_link.sh" >&2
    exit 1
}
# sudo権限付きシンボリックリンク作成関数
source "$working_dir/scripts/functions/set_config_link_with_sudo.sh" || {
    echo "Failed to source set_config_link_with_sudo.sh" >&2
    exit 1
}
# コンピュータタイプ判定関数
source "$working_dir/scripts/functions/check_computer_type.sh" || {
    echo "Failed to source check_computer_type.sh" >&2
    exit 1
}
# ファイル存在チェック関数
source "$working_dir/scripts/functions/check_file_exists.sh" || {
    echo "Failed to source check_file_exists.sh" >&2
    exit 1
}
# フォントのインストール関数
source "$working_dir/scripts/functions/install_font.sh" || {
    echo "Failed to source install_fonts.sh" >&2
    exit 1
}

log "Starting setup..." "info" ":: "

###
# シンボリックリンクの作成スクリプトを実行
source "$working_dir/scripts/create_symbolic_links.sh" || {
    log "Failed to create symbolic links for configuration files." "error" "==> "
    exit 1
}

###
# localeの設定
log "Configuring locale settings..." "info" ":: "
sudo echo "LANG=C.UTF-8" | sudo tee /etc/locale.conf > /dev/null || {
    log "Failed to set LANG in /etc/locale.conf" "error" "==> "
    exit 1
}

###
# パッケージのインストールスクリプトを実行
source "$working_dir/scripts/install_packages.sh" || {
    log "Failed to install packages." "error" "==> "
    exit 1
}

###
# デフォルトシェルをfishに設定
log "Setting default shell to fish..." "info" ":: "
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish || {
        log "Failed to change default shell to fish." "error" "==> "
        exit 1
    }
fi

###
# qtileのインストール
source "$working_dir/scripts/install_qtile.sh" || {
    log "Failed to install qtile using uvtool." "error" "==> "
    exit 1
}

###
# フォントのインストール
source "$working_dir/scripts/install_fonts.sh" || {
    log "Failed to install fonts." "error" "==> "
    exit 1
}

###
# systemdサービスの有効化
# PipeWire PulseAudioの有効化
systemctl --user enable --now pipewire-pulse.service || {
    log "Failed to enable pipewire-pulse.service" "error" "==> "
}

log "Setup completed successfully!" "notice"
log "You may need to install some packages or perform additional configuration manually." "notice"
log "Please restart your system to apply all changes." "notice"
