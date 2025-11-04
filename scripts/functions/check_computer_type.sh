# laptopかdesktopかを判定する
function checkComputerType {
    # ラップトップの特徴的なデバイスファイルをチェック
    local chassis
    chassis=$(hostnamectl chassis 2>/dev/null)

    if [ "$chassis" == "laptop" ]; then
        echo "laptop"
    else
        echo "desktop"
    fi
}
