# !/bin/sh

# Xresourcesの設定を反映
xrdb -merge $HOME/.Xresources

# キーボードのリピートレートを設定
xset r rate 200 30

# ディスプレイの設定
systemctl --user import-environment DISPLAY

# 日本語入力を設定
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx5 -d &

# picom の起動
picom --backend glx &

# qtile
exec qtile start

