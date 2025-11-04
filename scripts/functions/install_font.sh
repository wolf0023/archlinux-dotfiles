# 与えられたURLからフォントをダウンロードしてインストールする
# $1: フォントのURL
function installFont {
    local url="$1"

    wget "$url" || {
        echo "Failed to download font file: $url";
        return 1;
    }
    unzip "${url##*/}" || {
        echo "Failed to unzip the zip file: ${url##*/}";
        return 1;
    }
    rm "${url##*/}" || {
        echo "Failed to remove the zip file: ${url##*/}";
        return 1;
    }

    return 0;
}
