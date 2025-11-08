from libqtile import hook
from subprocess import run

# qtileの起動ごとに実行される
@hook.subscribe.startup
def autostart():
    # Xorg関連
    xorg = [
        ["setxkbmap", "-option", "ctrl:nocaps"], # CapsLockをCtrlに変更
        ["xset", "r", "rate", "200", "40"], # キーボードのリピートレートを設定
    ]

    # コマンドの実行
    for cmd in xorg:
        run(cmd)

