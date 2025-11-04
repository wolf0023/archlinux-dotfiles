# Qtileのライブラリから必要なものをインポート
from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# external_display.pyから関数をインポート
from external_display import DisplayManager

# modキーの定義
mod = "mod1"
app = "mod4"
terminal = guess_terminal();

# 外部ディスプレイクラスのインスタンス
edisplay = DisplayManager()

# キーバインドのリストの定義
keys_list = [
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # アクティブウィンドウのフォーカス移動
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "i", lazy.layout.next(), desc="Move window focus to other window"),

    # 現在のウィンドウの位置を移動
    Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # ウィンドウのサイズ変更
    Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # 別のスクリーンに移動
    Key(
        [mod, "control"],"i",
        lazy.next_screen(),
        desc="Move focus to next monitor"
    ),

    # ウィンドウの操作
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod, "control"],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    # Qtile自体の捜査
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # コマンドプロンプトの起動
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # 直前のグループに移動
    Key(
        [mod], "Tab",
        lazy.screen.toggle_group(),
        desc="Move to the last visited group"
    ),

    # ターミナルの起動
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # アクティブウィンドウのスクリーンショットを撮る
    Key([mod], "Print",
        lazy.spawn("scrot -u -e 'mkdir -p ~/Screenshots; mv $f ~/Screenshots/.'")
    ),
    # 画面全体のスクリーンショットを撮る
    Key([mod, "control"], "Print",
        lazy.spawn("scrot -e 'mkdir -p ~/Screenshots; mv $f ~/Screenshots/.'")
    ),
    # 選択範囲のスクリーンショットを撮る
    Key([], "Print",
        lazy.spawn("scrot -s -f -e 'mkdir -p ~/Screenshots; mv $f ~/Screenshots/.'")
    ),
    # ブラウザの起動
    Key([mod], "b", lazy.spawn("firefox")),
    # メールソフトの起動
    Key([mod], "m", lazy.spawn("thunderbird")),
    
    # ソフトウェアの起動
    Key([app], "d", lazy.spawn("discord")),
    Key([app], "t", lazy.spawn("Telegram")),
    Key([app], "s", lazy.spawn("spotify-launcher")),

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
