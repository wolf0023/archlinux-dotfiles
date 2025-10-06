# !/bin/sh

# 日本語入力を設定する
fcitx5 &

# キーバインドの設定
xmodmap ~/.Xmodmap &

# picom の起動
picom --backend glx &

# qtile
exec qtile start

