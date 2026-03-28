if status is-interactive
    # vi mode を有効化
    fish_vi_key_bindings

    # normalモードでの貼り付け・コピー
    bind -M default p fish_clipboard_paste
    bind -M default y fish_clipboard_copy

    # visualモードでの選択範囲のコピー
    bind -M visual y fish_clipboard_copy
end
