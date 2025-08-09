# Qtileライブラリから必要なものをインポート
# 一部アイコンにはNerd Fontのアイコンを使用している
from libqtile import bar, widget
from libqtile.config import Screen
# メインモニタ
primary_screen = Screen(
    wallpaper='~/archlinux-dotfiles/wallpaper.jpg',
    wallpaper_mode='stretch',  # 画像の表示方法を指定
    top=bar.Bar(
        [
            widget.TextBox(
                text='󰣇',
                fontsize=20,
                font='sans',
                padding=6,
                foreground='74c7ec'
            ),
            widget.TextBox(
                text='|',
                padding=6,
                foreground='6c7086'
            ),
            widget.Prompt(),
            # widget.CurrentLayout(),
            widget.GroupBox(
                active='94e2d5',
                inactive='a6adc8',
                highlight_method='block',
                use_mouse_wheel=False
            ),
            widget.TextBox(
                text='|',
                padding=6,
                foreground='6c7086'
            ),
            widget.WindowName(),
            widget.TextBox(
                text='|',
                padding=6,
                foreground='6c7086'
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
                format='  ↓{down:.1f}{down_suffix} ↑{up:.1f}{up_suffix}',
                padding=12,
            ),
            widget.Battery(
                charge_char='',
                discharge_char='󰁹',
                empty_char='󱉞',
                full_char='󱟢',
                not_charging_char='󰁹',
                unknown_char='󱃍',
                format='{char} {percent:2.0%} ({hour:d}時間{min:02d}分 - {watt:.2f} W)',
                low_foreground='ffffff',
                update_interval=2,
                show_short_text=False,
                padding=8,
            ),
            widget.PulseVolume(
                limit_max_volume=True,
                mute_format='  0%',
                unmute_format='  {volume}%',
                padding=8,
            ),
            widget.Backlight(
                brightness_file='/sys/class/backlight/intel_backlight/brightness',
                max_brightness_file='/sys/class/backlight/intel_backlight/max_brightness',
                format='󰉄 {percent:2.0%}',
                padding=8,
            ),
            widget.Clock(
                format=" %m/%d(%a) %p %I:%M",
                padding=12,
            ),
            widget.TextBox(
                text='|',
                padding=6,
                foreground='6c7086'
            ),
            widget.Systray(padding=8, icon_size=20),
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
    wallpaper='~/Downloads/wallpaper/wall.png',
    wallpaper_mode='stretch',  # 画像の表示方法を指定
    top=bar.Bar(
        [
            widget.TextBox(
                text='󰣇',
                fontsize=20,
                font='sans',
                padding=6,
                foreground='74c7ec'
            ),
            widget.TextBox(
                text='|',
                padding=6,
                foreground='6c7086'
            ),
            widget.GroupBox(
                active='f8f8f2',
                inactive='666666',
                highlight_method='block',
                use_mouse_wheel=False
            ),
            widget.TextBox(
                text='|',
                padding=6,
            ),
            widget.WindowName(),
            widget.TextBox(
                text='|',
                padding=6,
            ),
            widget.Net(
                format='  ↓{down:.1f}{down_suffix} ↑{up:.1f}{up_suffix}',
                padding=12,
            ),
            widget.Battery(
                charge_char='',
                discharge_char='󰁹',
                empty_char='󱉞',
                full_char='󱟢',
                not_charging_char='󰁹',
                unknown_char='󱃍',
                format='{char} {percent:2.0%} ({hour:d}時間{min:02d}分)',
                low_foreground='ffffff',
                update_interval=2,
                show_short_text=False,
                padding=8,
            ),
            widget.PulseVolume(
                limit_max_volume=True,
                mute_format='  0%',
                unmute_format='  {volume}%',
                padding=8,
            ),
            widget.Clock(
                format=" %m/%d(%a) %p %I:%M",
                padding=12,
            ),
            widget.TextBox(
                text='|',
                padding=6,
                foreground='6c7086'
            )
        ],
        24,
    ),
)
