#!/bin/bash
set -uo pipefail

# 関数定義
# 与えられたURLからフォントをダウンロードしてインストールする
# $1: フォントのURL
function installFont() {
    local url="$1"

    wget "$url" || {
        echo "Failed to download font file: $url";
        return 1;
    }
    unzip "${url##*/}" || {
        echo "Failed to unzip the zip file: ${url##*/}";
        return 1;
    }
    rm "${url##*/}" || {
        echo "Failed to remove the zip file: ${url##*/}";
        return 1;
    }

    return 0;
}

# ファイルもしくはディレクトリが存在するかチェック
# $1: ファイル
# 存在しない場合はエラーを表示し終了
function checkFileExists() {
    local file="$1"

    if [ ! -e "$file" ]; then
        return 1
    fi
}

# シンボリックリンクを作成する
# $1: ソースファイル
# $2: リンク先ファイル
function setConfigLink() {
    local source_file="$1"
    local target_file="$2"

    # ソースファイルの存在チェック
    checkFileExists "$source_file" || {
        handleError "Source file does not exist: $source_file"
    }

    ln -sf --backup=existing "$source_file" "$target_file" || {
        handleError "Failed to create symbolic link from $source_file to $target_file"
    }
}

# シンボリックリンクをsudo権限で作成する
# $1: ソースファイル
# $2: リンク先ファイル
function setConfigLinkWithSudo() {
    local source_file="$1"
    local target_file="$2"

    # ソースファイルの存在チェック
    checkFileExists "$source_file" || {
        handleError "Source file does not exist: $source_file"
    }

    sudo ln -sf --backup=numbered "$source_file" "$target_file" || {
        handleError "Failed to create symbolic link with sudo from $source_file to $target_file"
    }
}

# エラー処理
# セットアップ中にエラーが発生した場合に呼び出される
# $1: エラーメッセージ
function handleError() {
    local error_message="$1"

    echo "Error occurred: $error_message" >&2
    echo "Aborting setup. Please run again." >&2
    exit 1
}


# メイン処理開始
echo "Starting setup..."
current_dir="$(pwd)"


# localeの設定
echo "Configuring locale settings..."
sudo echo "LANG=C.UTF-8" | sudo tee /etc/locale.conf > /dev/null || {
    handleError "Failed to set LANG in /etc/locale.conf"
}


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

# Fish config
echo "Linking Fish configuration files..."
# ディレクトリがない場合は作成
if [ ! -d "$HOME/.config/fish" ]; then
    mkdir -p "$HOME/.config/fish" || {
        handleError "Failed to create directory: $HOME/.config/fish"
    }
fi
setConfigLink "$current_dir/fish/config.fish" "$HOME/.config/fish/config.fish"

# Fontconfig(root権限必須)
echo "Linking Fontconfig configuration files..."
setConfigLinkWithSudo "$current_dir/fontconfig/local.conf" "/etc/fonts/local.conf"


# multilibを有効化
echo "Enabling multilib repository in pacman.conf..."
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    sudo echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null || {
        handleError "Failed to enable multilib repository in /etc/pacman.conf"
    }
else
    echo "Multilib repository is already enabled."
fi

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
# uvプロジェクトの初期化
cd "$HOME" || {
    handleError "Could not change directory to home: $HOME"
}
uv init -p pypy3 uv-qtile || {
    handleError "Failed to initialize uvtool for qtile."
}

# venv環境を構築し、アクティベート
cd uv-qtile || {
    handleError "Could not change directory to uv-qtile: $HOME/uv-qtile"
}
uv sync || {
    handleError "Failed to sync uvtool packages for qtile."
}
source .venv/bin/activate || {
    handleError "Failed to activate uvtool virtual environment for qtile."
}

# uvtoolを使ってqtileをインストール
uv add qtile[widgets] || {
    handleError "Failed to install qtile using uvtool."
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
