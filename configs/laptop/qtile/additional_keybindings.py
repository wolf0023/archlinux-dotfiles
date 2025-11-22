# Qtileのライブラリから必要なものをインポート
from libqtile.config import Key
from libqtile.lazy import lazy

# external_display.pyから関数をインポート
from external_display import DisplayManager

# 外部ディスプレイクラスのインスタンス
edisplay = DisplayManager()

additional_keys = [
    # Thinkpadのfnキーを有効化
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("pamixer --increase 5"),
        desc="Volume Up"
    ),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("pamixer --decrease 5"),
        desc="Volume Down"
    ),
    Key([], "XF86AudioMute",
        lazy.spawn("pamixer --toggle-mute"),
        desc="Toogle Mute"
    ),
    Key([], "XF86AudioMicMute",
        lazy.spawn("pamixer --default-source --toggle-mute"),
        desc="Toogle Mic Mute"
    ),
    Key([], "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl set 2%+"),
        desc="Brightness Up"
    ),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl set 2%-"),
        desc="Brightness Down"
    ),
    Key([], "XF86Display",
        lazy.function(edisplay.toggle_external_display),
        desc="Connect Secondary Display"
    ),
]
