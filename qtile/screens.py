# Qtileライブラリから必要なものをインポート
# 一部アイコンにはNerd Fontのアイコンを使用している
from libqtile import bar, widget
from libqtile.config import Screen

from widgets.custom_battery import CustomBattery
from palette import Mocha 

# メインモニタ
primary_screen = Screen(
    wallpaper='~/archlinux-dotfiles/wallpaper.jpg',
    wallpaper_mode='stretch',  # 画像の表示方法を指定
    top=bar.Bar(
        [
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            # widget.CurrentLayout(),
            widget.GroupBox(
                active=Mocha.Green,
                inactive=Mocha.Overlay0,
                this_current_screen_border=Mocha.Peach,
                other_current_screen_border=Mocha.Subtext0,
                this_screen_border=Mocha.Green,
                other_screen_border=Mocha.Subtext0,
                use_mouse_wheel=False,
                highlight_method='line',
                highlight_color=Mocha.Surface0
            ),
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            widget.Prompt(
                prompt=' :'
            ),
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            widget.WindowName(),
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            # widget.Chord(
            #     chords_colors={
            #         "launch": ("#ff0000", "#ffffff"),
            #     },
            #     name_transform=lambda name: name.upper(),
            # ),
            # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
            # widget.StatusNotifier(),
            widget.Net(
                format='  ↓{down:5.1f}{down_suffix:>2} ↑{up:5.1f}{up_suffix:>2}',
                padding=8,
            ),
            CustomBattery(
                format='{icon} {hour:2d}h {min:02d}min',
                padding=8,
                update_interval=2,
                low_foreground=Mocha.Peach,
                low_percentage=20,
            ),
            widget.PulseVolume(
                limit_max_volume=True,
                mute_format='  0%',
                unmute_format='  {volume:3.0f}%',
                padding=8,
            ),
            widget.Backlight(
                brightness_file='/sys/class/backlight/intel_backlight/brightness',
                max_brightness_file='/sys/class/backlight/intel_backlight/max_brightness',
                format='󰉄 {percent:4.0%}',
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
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    ),
    # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
    # By default we handle these events delayed to already improve performance, however your system might still be struggling
    # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
    # x11_drag_polling_rate = 60,
)

secondary_screen = Screen(
    wallpaper='~/archlinux-dotfiles/wallpaper.jpg',
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
                use_mouse_wheel=False,
                highlight_method='line',
                highlight_color=Mocha.Surface0
            ),
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            widget.WindowName(),
            widget.TextBox(
                text=' ',
                padding=2,
                foreground=Mocha.Text
            ),
            widget.Net(
                format='  ↓{down:5.1f}{down_suffix:<2} ↑{up:5.1f}{up_suffix:<2}',
                padding=8,
            ),
            widget.Battery(
                charge_char='',
                discharge_char='󰁹',
                empty_char='󱉞',
                full_char='󱟢',
                not_charging_char='󰁹',
                unknown_char='󱃍',
                format='{char}{hour:3d}h {min:2d}min - {watt:5.2f} W',
                low_foreground=Mocha.Peach,
                low_percentage=0.2,
                update_interval=2,
                show_short_text=False,
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
