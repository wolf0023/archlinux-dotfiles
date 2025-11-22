from libqtile import hook, qtile
from subprocess import run

from external_display import DisplayManager

display_manager: DisplayManager = DisplayManager()

# qtileの起動ごとに実行される
@hook.subscribe.startup
def autostart():
    # サブモニターの有効化
    display_manager.setup_external_display(qtile, "right-of")

    # Xorg関連
    xorg = [
        ["setxkbmap", "-option", "ctrl:nocaps"], # CapsLockをCtrlに変更
        ["xset", "r", "rate", "200", "40"], # キーボードのリピートレートを設定
        ["xset", "s", "off", "-dpms"], # DPMSを無効にし、画面が暗くなるのを防ぐ
    ]

    # コマンドの実行
    for cmd in xorg:
        run(cmd)

