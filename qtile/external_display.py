import subprocess
import shlex # コマンドを安全に分割するために推奨
import re

from libqtile.log_utils import logger

class DisplayManager:
    def __init__(self):
        self.primary_display: str = ""
        self.external_display: str = ""
        self.external_display_list: list = []
        self.is_active: bool = False
        self._disable_all_external_display()

    def _run_command(self, command_str):
        """
        xrandrのコマンドを実行
        """
        xrandr_command = f"xrandr {command_str}"
        logger.info(f"実行されたコマンド: {xrandr_command}")

        try:
            result = subprocess.run(shlex.split(xrandr_command), capture_output=True, text=True, check=True)

            if result.returncode == 0:
                return result.stdout

            logger.error(f"コマンドの実行に失敗: {result.stderr}")
            return ""

        except subprocess.CalledProcessError as e:
            logger.error(f"xrandr コマンドの実行に失敗しました: {e}")
        except Exception as e:
            logger.error(f"予期しないエラーが発生しました: {e}")

    def _find_display(self):
        """
        現在認識しているディスプレイを探す
        """
        # xrandr --query を実行して接続されているディスプレイを取得
        xrandr_output = self._run_command("--query")

        # 出力を行ごとに分割
        for line in xrandr_output.splitlines():
            # プライマリディスプレイを探す
            if " primary" in line:
                self.primary_display = line.split()[0]
            # 接続されている外部ディスプレイを探す
            elif " connected" in line:
                self.external_display_list.append(line.split()[0])
    
    def _enable_external_display(self):
        """
        外部ディスプレイを有効にする
        """
        if not self.external_display_list:
            logger.info("有効なディスプレイが見つかりませんでした。")
            return
        
        # 外部ディスプレイをプライマリディスプレイの上に配置
        self.external_display = self.external_display_list[0]

        # xrandr コマンドを実行して配置を設定
        command = f"--output {self.external_display} --above {self.primary_display} --auto"
        self._run_command(command)
    
        logger.info(f"外部ディスプレイ {self.external_display} をプライマリディスプレイ {self.primary_display} の上に配置しました")

        # 接続中に変更
        self.is_active = True
 
    def _disable_external_display(self):
        """
        外部ディスプレイを無効にする
        """
        if self.external_display is None:
            return

        # 現在の外部ディスプレイを無効にする
        command = f"--output {self.external_display} --off"
        self._run_command(command)

        logger.info(f"外部ディスプレイ {self.external_display}を無効にしました。")

        # 切断中に変更
        self.is_active = False

    def _disable_all_external_display(self):
        """
        すべての外部ディスプレイを無効にする
        """
        self._find_display()

        for display in self.external_display_list:
            command = f"--output {display} --off"
            self._run_command(command)

        # 切断中に変更
        self.is_active = False

    def _is_external_display_connected(self) -> bool:
        """
        外部ディスプレイが接続されているか判定する
        """
        # xrandr --query を実行して接続されているディスプレイを取得
        xrandr_output = self._run_command("--query")

        if not xrandr_output:
            return False

        for line in xrandr_output.splitlines():
            if not " primary" in line and bool(re.search(r"\sconnected [0-9]+x[0-9]+", line)):
                return True

        return False


    def setup_external_display(self, qtile):
        """
        接続されている外部ディスプレイを探し、プライマリディスプレイの上に配置する
        """
        # すでに接続中なら処理を続行しない
        if self.is_active:
            return

        self._find_display()

        # 有効なディスプレイが見つからない場合
        if not self.primary_display or not self.external_display_list:
            return

        self._enable_external_display()

    def toggle_external_display(self, qtile):
        """
        接続されている最初の外部ディスプレイのON/OFFを切り替える
        """
        # 切断中であれば、ディスプレイを取得する
        if not self.is_active:
            self._find_display()

        if self._is_external_display_connected():
            # ディスプレイが接続されているときは、オフにする
            self._disable_external_display()
        elif self.external_display_list:
            # 接続されていないが、認識している場合、オンにする
            self._enable_external_display()

