# Qtileのライブラリから必要なものをインポート
from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# external_display.pyから関数をインポート
from external_display import DisplayManager

# modキーの定義
mod = "mod4"
terminal = guess_terminal();

# 外部ディスプレイクラスのインスタンス
edisplay = DisplayManager()

# キーバインドのリストの定義
keys_list = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between different layouts as defined below
    Key(
        [mod, "control"],"Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"
    ),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod, "control"],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # グループの移動
    Key(
        [mod], "Tab",
        lazy.screen.toggle_group(),
        desc="Move to the last visited group"
    ),
    Key(
        [mod, "shift"], "Tab",
        lazy.window.bring_to_front(),
        desc="Bring window above all other windows"
    ),

    # ソフトウェアの起動
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn("firefox")),
    Key([mod], "m", lazy.spawn("thunderbird")),
    Key([mod], "d", lazy.spawn("discord")),
    Key([], "Print",
        lazy.spawn("scrot -s -e 'mkdir -p ~/Screenshots; mv $f ~/Screenshots/.'")
    ),
    
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
