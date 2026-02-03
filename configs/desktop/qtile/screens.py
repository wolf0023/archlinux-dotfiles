# Qtileライブラリから必要なものをインポート
# 一部アイコンにはNerd Fontのアイコンを使用している
from libqtile import bar, widget
from libqtile.config import Screen

from widgets.custom_battery import CustomBattery
from palette import Mocha 

# メインモニタ
primary_screen = Screen(
    wallpaper='~/.config/qtile/wallpaper.jpg',
    wallpaper_mode='stretch',  # 画像の表示方法を指定
    top=bar.Bar(
        [
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            widget.GroupBox(
                active=Mocha.Green,
                inactive=Mocha.Overlay0,
                this_current_screen_border=Mocha.Peach,
                other_current_screen_border=Mocha.Subtext0,
                this_screen_border=Mocha.Green,
                other_screen_border=Mocha.Subtext0,
                disable_drag=True,
                use_mouse_wheel=False,
                highlight_method='line',
                highlight_color=Mocha.Surface0,
                urgent_border=Mocha.Red,
                urgent_text=Mocha.Green,
                borderwidth=4,
            ),
            widget.WindowName(
                padding=8,
            ),
            widget.CPU(
                format='  {freq_current:4.2f}GHz {load_percent:<3.0f}%',
                padding=8,
            ),
            widget.Memory(
                format='  {MemUsed:4.1f}{mm}/{MemTotal:4.1f}{mm}',
                measure_mem='G',
                padding=8,
            ),
            widget.Net(
                format='  ↓{down:5.1f}{down_suffix:<2} ↑{up:5.1f}{up_suffix:<2}',
                padding=8,
            ),
           widget.PulseVolume(
                limit_max_volume=True,
                mute_format='  0%',
                unmute_format='  {volume:3.0f}%',
                padding=8,
            ),
           widget.Clock(
                format=" %m/%d(%a) %H:%M",
                padding=8,
            ),
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            widget.Systray(padding=4, icon_size=20),
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
        ],
        24,
    ),
)

secondary_screen = Screen(
    wallpaper='~/.config/qtile/wallpaper.jpg',
    wallpaper_mode='stretch',  # 画像の表示方法を指定
    top=bar.Bar(
        [
           widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            widget.GroupBox(
                active=Mocha.Green,
                inactive=Mocha.Overlay0,
                this_current_screen_border=Mocha.Peach,
                other_current_screen_border=Mocha.Subtext0,
                this_screen_border=Mocha.Green,
                other_screen_border=Mocha.Subtext0,
                disable_drag=True,
                use_mouse_wheel=False,
                highlight_method='line',
                highlight_color=Mocha.Surface0,
                urgent_border=Mocha.Red,
                urgent_text=Mocha.Green,
                borderwidth=4,
            ),
            widget.WindowName(
                padding=8,
            ),
            widget.CPU(
                format='  {freq_current:4.2f}GHz {load_percent:<3.0f}%',
                padding=8,
            ),
            widget.Memory(
                format='  {MemUsed:4.1f}{mm}/{MemTotal:4.1f}{mm}',
                measure_mem='G',
                padding=8,
            ),
            widget.Net(
                format='  ↓{down:5.1f}{down_suffix:<2} ↑{up:5.1f}{up_suffix:<2}',
                padding=8,
            ),
           widget.PulseVolume(
                limit_max_volume=True,
                mute_format='  0%',
                unmute_format='  {volume:3.0f}%',
                padding=8,
            ),
            widget.Clock(
                format=" %m/%d(%a) %H:%M",
                padding=8,
            ),
           widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
        ],
        24,
    ),
)
