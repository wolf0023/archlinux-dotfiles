from libqtile.widget import base
from libqtile.widget.battery import load_battery
from libqtile.widget.battery import _Battery, BatteryStatus, BatteryState

class CustomBattery(base.ThreadPoolText):
    """
    バッテリウィジェットのカスタムクラス
    バッテリ残量に応じてアイコンを変更する
    """
    defaults = [
        ("update_interval", 4, "更新時間(秒)"),
        ("format", "{icon} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f}W", "表示フォーマット"),
        ("low_percentage", 20, "バッテリ残量が低いとみなす閾値"),
        ("low_foreground", "ff5555", "バッテリ残量が低いときの文字色"),
        ("empty_icon", "󱉞", "バッテリが空のときのアイコン"),
        ("full_icon", "󰁹", "バッテリが満タンのときのアイコン"),
        ("charging_icon", "", "バッテリが充電中のときのアイコン"),
        ("full_charging_icon", "󱟢", "バッテリが満タンで充電中のときのアイコン"),
        ("ten_icon", "󰁺", "バッテリ残量が10%以下のときのアイコン"),
        ("twenty_icon", "󰁻", "バッテリ残量が20%以下のときのアイコン"),
        ("thirty_icon", "󰁼", "バッテリ残量が30%以下のときのアイコン"),
        ("forty_icon", "󰁽", "バッテリ残量が40%以下のときのアイコン"),
        ("fifty_icon", "󰁾", "バッテリ残量が50%以下のときのアイコン"),
        ("sixty_icon", "󰁿", "バッテリ残量が60%以下のときのアイコン"),
        ("seventy_icon", "󰂀", "バッテリ残量が70%以下のときのアイコン"),
        ("eighty_icon", "󰂁", "バッテリ残量が80%以下のときのアイコン"),
        ("ninety_icon", "󰂂", "バッテリ残量が90%以下のときのアイコン"),
    ]

    def __init__(self, **config):
        base.ThreadPoolText.__init__(self, "", **config)
        self.add_defaults(self.defaults)
        self._battery: _Battery = load_battery()
        self._icons: tuple = self._set_icon()

    def _set_icon(self) -> tuple:
        return (
            self.empty_icon,
            self.ten_icon,
            self.twenty_icon,
            self.thirty_icon,
            self.forty_icon,
            self.fifty_icon,
            self.sixty_icon,
            self.seventy_icon,
            self.eighty_icon,
            self.ninety_icon,
            self.full_icon,
        )

    def _get_power_plugged(self, state: BatteryState) -> bool:
        """バッテリが充電中かどうかを返す"""
        return state == BatteryState.CHARGING or state == BatteryState.FULL

    def _get_icon(self, percent: int, is_power_plugged: bool) -> str:
        """バッテリ状態に応じてアイコンを返す"""
        char = ""

        # バッテリー状態からアイコンを設定
        if is_power_plugged:
            if percent == 100:
                char = self.full_charging_icon
            else:
                char = self.charging_icon
        else:
            char = self._icons[min(percent // 10, 10)]

        return char
    
    def poll(self) -> str:
        """
        バッテリの状態を取得し、アイコンを返す
        """
        try:
            status: BatteryStatus = self._battery.update_status()
        except RuntimeError as e:
            return ""

        # バッテリ残量を取得
        percent: int = int(status.percent * 100)

        # 充電中かどうかを取得
        is_power_plugged: bool = self._get_power_plugged(status.state)


        # バッテリ残量に応じて文字の色を変える
        if self.layout is not None:
            if not is_power_plugged and percent <= self.low_percentage:
                self.layout.colour = self.low_foreground
            else:
                self.layout.colour = self.foreground

        # アイコンを取得
        icon: str = self._get_icon(percent, is_power_plugged)

        # 時間の取得
        hour: int = status.time // 3600
        min: int = (status.time % 3600) // 60

        # メッセージをフォーマット
        message: str = self.format.format(
            icon=icon, percent=status.percent, hour=hour, min=min, watt=status.power
        )

        return message

