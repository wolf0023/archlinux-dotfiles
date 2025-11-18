# !/bin/sh

# Xresourcesの設定を反映
xrdb -merge $HOME/.Xresources

# DISPLAYとXAUTHORITYの設定
systemctl --user import-environment DISPLAY XAUTHORITY
if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment --systemd DISPLAY XAUTHORITY
fi

# 日本語入力を設定
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx5 -d &

# picom の起動
picom --backend glx &

# qtile
exec qtile start

