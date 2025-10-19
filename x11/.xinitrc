# !/bin/sh

# Xresourcesの設定を反映
xrdb -merge $HOME/.Xresources
# キーボードの設定(CapsLockをCtrlに変更)
setxkbmap -option ctrl:nocaps
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

