if status is-interactive
    # python virtual environment を source
    if not set -q VIRTUAL_ENV
        if test -f "$HOME/uv-qtile/.venv/bin/activate.fish"
            source "$HOME/uv-qtile/.venv/bin/activate.fish"
        end
    end

    # vi mode を有効化
    fish_vi_key_bindings

    # normalモードでの貼り付け・コピー
    bind -M default p fish_clipboard_paste
    bind -M default y fish_clipboard_copy

    # visualモードでの選択範囲のコピー
    bind -M visual y fish_clipboard_copy
end
