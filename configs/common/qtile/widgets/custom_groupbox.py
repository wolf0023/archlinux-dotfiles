from libqtile.widget import base
from libqtile.widget.groupbox import _GroupBase

class CustomGroupBox(_GroupBase):
    """
    GroupBox ウィジェットのカスタムクラス
    """
    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [
        ("active", "FFFFFF", "window(アプリなど) が一つでもあるグループの色"),
        ("inactive", "404040", "window(アプリなど) が一つもないグループの色"),
        (
            "this_current_screen_text",
            "215578",
            "今このバーが描画されている画面に表示中のグループ、かつ、その画面にフォーカスがあるときのグループの色"
        ),
        (
            "other_screen_text",
            "404040",
            "別の画面に表示中のグループ、かつ、その画面にフォーカスがないときのグループの色",
        ),
        (
            "this_screen_text",
            "215578",
            "今このバーが描画されている画面に表示中のグループ、かつ、その画面にフォーカスがないときのグループの色"
        ),
        (
            "other_current_screen_text",
            "404040",
            "別の画面に表示中のグループ、かつ、その画面にフォーカスがあるときのグループの色"
        ),
        ("urgent_text", "FF0000", "window からの通知があるときグループの色"),
    ]

    def __init__(self, **config):
        super().__init__(**config)
        self.add_defaults(CustomGroupBox.defaults)

    @property
    def groups(self):
        """
        グループのリストを取得
        """
        groups = filter(lambda g: g.label, self.qtile.groups)
        return list(groups)

    def calculate_length(self):
        width = self.margin_x * 2 + (len(self.groups) - 1) * self.margin_x
        for g in self.groups:
            width += self.box_width([g])
        return width

    def group_has_urgent(self, group):
        return any(w.urgent for w in group.windows)

    def draw(self):
        self.drawer.clear(self.background or self.bar.background)

        offset = self.margin_x
        for _, g in enumerate(self.groups):

            bw = self.box_width([g])

            if self.group_has_urgent(g):
                # 通知がある場合
                text_color = self.urgent_text
            elif g.windows:
                # window が一つでもある場合
                text_color = self.active
            else:
                # window が一つもない場合
                text_color = self.inactive

            if g.screen:
                # draw しようとしているバー(このウィジェットが乗っているバー)で表示している画面のグループと、そうでないグループを分ける
                if self.bar.screen.group.name == g.name: # 表示中のグループ
                    # 現在フォーカス中の画面かどうか？
                    if self.qtile.current_screen == g.screen: # フォーカス中
                        text_color = self.this_current_screen_text
                    else: # 非フォーカス
                        text_color = self.this_screen_text
                else: # 非表示のグループ
                    # 現在フォーカス中の画面かどうか？
                    if self.qtile.current_screen == g.screen: # フォーカス中
                        text_color = self.other_current_screen_text
                    else: # 非フォーカス
                        text_color = self.other_screen_text

            self.drawbox(
                offset=offset,
                text=g.label,
                bordercolor=None,
                textcolor=text_color,
                width=bw,
            )
            offset += bw + self.margin_x
        self.draw_at_default_position()
