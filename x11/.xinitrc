# !/bin/sh

# Xresourcesの設定を反映
xrdb -merge $HOME/.Xresources

# 日本語入力を設定する
fcitx5 &

# picom の起動
picom --backend glx &

# qtile
exec qtile start

