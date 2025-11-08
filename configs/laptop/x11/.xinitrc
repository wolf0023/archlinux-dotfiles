# !/bin/sh

# Xresourcesの設定を反映
xrdb -merge $HOME/.Xresources

# 日本語入力を設定
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx5 -d &

# picom の起動
picom --backend glx &

# qtile
exec qtile start

