# Qtileのライブラリから必要なものをインポート
from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# modキーの定義
mod = "mod1"
app = "mod4"
terminal = guess_terminal();

# キーバインドのリストの定義
keys_list = [
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # アクティブウィンドウのフォーカス移動
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "i", lazy.layout.next(), desc="Move window focus to other window"),

    # ウィンドウのフローティング切り替え
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    # 現在のウィンドウの位置を移動
    Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # 別のスクリーンに移動
    Key(
        [mod, "control"], "i",
        lazy.next_screen(),
        desc="Move focus to next monitor"
    ),

    # ウィンドウの操作
    Key([mod, "control"], "q", lazy.window.kill(), desc="Kill focused window"),

    # Qtile自体の捜査
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "z", lazy.shutdown(), desc="Shutdown Qtile"),

    # 直前のグループに移動
    Key(
        [mod], "o",
        lazy.screen.toggle_group(),
        desc="Move to the last visited group"
    ),

    # ウィンドウのサイズ変更
    Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "shift"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # フルスクリーン切り替え
    Key(
        [mod, "shift"],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),

    # アプリケーションランチャーの起動
    Key([mod], "r", lazy.spawn("rofi -show combi"), desc="Spawn a app launcher"),

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
]
