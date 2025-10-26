#!/bin/bash
set -uo pipefail

# 関数定義
# 与えられたURLからフォントをダウンロードしてインストールする
# $1: フォントのURL
function installFont() {
    wget "$1" || {
        echo "Failed to download font file: $1";
        return 1;
    }
    unzip "${1##*/}" || {
        echo "Failed to unzip the zip file: ${1##*/}";
        return 1;
    }
    rm "${1##*/}" || {
        echo "Failed to remove the zip file: ${1##*/}";
        return 1;
    }

    return 0;
}

# シンボリックリンク元のファイルもしくはディレクトリが存在するかチェック
# $1: ソースファイル
# 存在しない場合はエラーを表示し終了
function checkSourceExists() {
    if [ ! -e "$1" ]; then
        handleError "Source file does not exist: $1"
    fi
}

# シンボリックリンクを作成する
# $1: ソースファイル
# $2: リンク先ファイル
function setConfigLink() {
    checkSourceExists "$1"
    # もし既存の設定ファイルが存在する場合はバックアップを作成
    if [ -e "$2" ]; then
        echo "Creating backup of existing config file."
        mv "$2" "${2}-backup-$(date +%Y%m%d%H%M%S)"
    fi

    ln -sf "$1" "$2"
}

# シンボリックリンクをsudo権限で作成する
# $1: ソースファイル
# $2: リンク先ファイル
function setConfigLinkWithSudo() {
    checkSourceExists "$1"
    # もし既存の設定ファイルが存在する場合はバックアップを作成
    if [ -e "$2" ]; then
        echo "Creating backup of existing config file with sudo."
        sudo mv "$2" "${2}-backup-$(date +%Y%m%d%H%M%S)"
    fi
    sudo ln -sf "$1" "$2"
}

# エラー処理
# セットアップ中にエラーが発生した場合に呼び出される
# $1: エラーメッセージ
function handleError() {
    echo "Error occurred: $1" >&2
    echo "Aborting setup. Please run again." >&2
    exit 1
}


# メイン処理開始
echo "Starting setup..."
current_dir="$(pwd)"


# シンボリックリンクの作成
echo "Starting creation of symbolic links for configuration files..."
# 必要なディレクトリの作成
mkdir -p "$HOME/.config"
sudo mkdir -p /etc/fonts || {
    handleError "Failed to create directory: /etc/fonts"
}

# X11 configs
echo "Linking X11 configuration files..."
setConfigLink "$current_dir/x11/.xinitrc" "$HOME/.xinitrc"
setConfigLink "$current_dir/x11/.Xresources" "$HOME/.Xresources"

# qtile configs
echo "Linking qtile configuration files..."
setConfigLink "$current_dir/qtile" "$HOME/.config/qtile"

# Alacritty configs
echo "Linking Alacritty configuration files..."
setConfigLink "$current_dir/alacritty" "$HOME/.config/alacritty"

# Neovim configs
echo "Linking Neovim configuration files..."
setConfigLink "$current_dir/nvim" "$HOME/.config/nvim"

# Fontconfig(root権限必須)
echo "Linking Fontconfig configuration files..."
setConfigLinkWithSudo "$current_dir/fontconfig/local.conf" "/etc/fonts/local.conf"


# パッケージのインストール
echo "Installing packages from pkglist.txt..."
checkSourceExists "$current_dir/pkglist.txt"
sudo pacman -Syu --needed - < "$current_dir/pkglist.txt" || {
    handleError "Failed to install packages from pkglist.txt."
}


# デフォルトシェルをfishに設定
echo "Setting default shell to fish..."
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish || {
        handleError "Failed to change default shell to fish."
    }
fi


# qtileのインストール
echo "Installing qtile using uvtool..."
export PATH="$HOME/.local/bin:$PATH"
uv tool install qtile[widgets] || {
    handleError "Failed to install qtile using uvtool."
}
uv tool update-shell || {
    handleError "Failed to update shell environment using uvtool."
}


# フォントのインストール
echo "Installing fonts..."
# フォントディレクトリの作成
mkdir -p "$HOME/.local/share/fonts"
cd "$HOME/.local/share/fonts" || { 
    handleError "Could not change directory to font directory: $HOME/.local/share/fonts"
}

# Moralerspace font
installFont "https://github.com/yuru7/moralerspace/releases/download/v2.0.0/Moralerspace_v2.0.0.zip" || {
    echo "Failed to install Moralerspace font." >&2
}
# Noto Sans CJK KR and SC fonts
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/08_NotoSerifCJKkr.zip" || {
    echo "Failed to install CJK KR font." >&2
}
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/09_NotoSerifCJKsc.zip" || {
    echo "Failed to install CJK SC font." >&2
}

# フォントキャッシュの更新
fc-cache -fv


# 元のディレクトリに戻る
cd "$current_dir" || {
    handleError "Could not change directory to the original directory: $current_dir"
}


echo "Setup completed successfully!"
echo "You may need to install some packages or perform additional configuration manually."
echo "Please reboot your system to apply all changes."
