#!/bin/bash

# 関数定義
# 与えられたURLからフォントをダウンロードしてインストールする
# $1: フォントのURL
function installFont() {
    wget "$1" || {
        echo "フォントファイルのダウンロードに失敗しました: $1";
        return 1;
    }
    unzip "${1##*/}" || {
        echo "zipファイルの解凍に失敗しました: ${1##*/}";
        return 1;
    }
    rm "${1##*/}"
}

# シンボリックリンク元のファイルもしくはディレクトリが存在するかチェック
# $1: ソースファイル
# 存在しない場合はエラーを表示し終了
function checkSourceExists() {
    if [ ! -e "$1" ]; then
        echo "シンボリックリンク元のファイルもしくはディレクトリが存在しません: $1"
        echo "セットアップを中止します。クローンし直してから、再度実行してください。"
        exit 1
    fi
}

# シンボリックリンクを作成する
# $1: ソースファイル
# $2: リンク先ファイル
function setConfigLink() {
    checkSourceExists "$1"
    # もし既存の設定ファイルが存在する場合はバックアップを作成
    if [ -e "$2" ]; then
        echo "既存の設定ファイルが存在するため、バックアップを作成します。"
        mv "$2" "$2-backup-$(date +%Y%m%d%H%M%S)"
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
        echo "既存の設定ファイルが存在するため、バックアップを作成します。"
        sudo mv "$2" "$2-backup-$(date +%Y%m%d%H%M%S)"
    fi
    sudo ln -sf "$1" "$2"
}


# メイン処理開始
echo "セットアップを開始します..."
current_dir="$(pwd)"


# シンボリックリンクの作成
echo "シンボリックリンクの作成を開始します..."
# 必要なディレクトリの作成
mkdir -p "$HOME/.config"
sudo mkdir -p /etc/fonts

# X11 configs
echo "x11の設定ファイルをリンクしています..."
setConfigLink "$current_dir/x11/.xinitrc" "$HOME/.xinitrc"
setConfigLink "$current_dir/x11/.Xresources" "$HOME/.Xresources"

# qtile configs
echo "qtileの設定ファイルをリンクしています..."
setConfigLink "$current_dir/qtile" "$HOME/.config/qtile"

# Alacritty configs
echo "alacrittyの設定ファイルをリンクしています..."
setConfigLink "$current_dir/alacritty" "$HOME/.config/alacritty"

# Neovim configs
echo "nvimの設定ファイルをリンクしています..."
setConfigLink "$current_dir/nvim" "$HOME/.config/nvim"

# Fontconfig(root権限必須)
echo "fontconfigの設定ファイルをリンクしています..."
setConfigLinkWithSudo "$current_dir/fontconfig/local.conf" "/etc/fonts/local.conf"


# パッケージのインストール
echo "pkglist.txtに基づいてパッケージをインストールしています..."
checkSourceExists "$current_dir/pkglist.txt"
cat "$current_dir/pkglist.txt" | sudo pacman -Syu --needed -


# デフォルトシェルをfishに設定
echo "デフォルトシェルをfishに設定しています..."
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish
fi


# qtileのインストール
echo "qtileのインストールを開始します..."
export PATH="$HOME/.local/bin:$PATH"
uv tool install qtile[widgets]
uv tool update-shell # Update shell environment


# フォントのインストール
echo "フォントのインストールを開始します..."
# フォントディレクトリの作成
mkdir -p "$HOME/.local/share/fonts"
cd "$HOME/.local/share/fonts" || { 
    echo "ディレクトリの移動に失敗しました: $HOME/.local/share/fonts";
    echo "再度セットアップを実行してください。"
    exit 1;
}

# Moralerspace font
installFont "https://github.com/yuru7/moralerspace/releases/download/v2.0.0/Moralerspace_v2.0.0.zip" || {
    echo "Moralerspace fontのインストールに失敗しました。";
}
# Noto Sans CJK KR and SC fonts
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/08_NotoSerifCJKkr.zip" || {
    echo "CJK KR fontのインストールに失敗しました。";
}
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/09_NotoSerifCJKsc.zip" || {
    echo "CJK SC fontのインストールに失敗しました。";
}

# フォントキャッシュの更新
fc-cache -fv


# 元のディレクトリに戻る
cd "$current_dir" || {
    echo "最初のディレクトリに戻れませんでした: $current_dir";
    exit 1;
}


echo "セットアップが完了しました！"
echo "一部のパッケージのインストールや追加の設定を行う必要がある場合があります。"
echo "システムを再起動して、変更を適用してください。"
