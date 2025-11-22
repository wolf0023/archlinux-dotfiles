if status is-interactive
    # source python virtual environment
    if not set -q VIRTUAL_ENV
        if test -f "$HOME/uv-qtile/.venv/bin/activate.fish"
            source "$HOME/uv-qtile/.venv/bin/activate.fish"
        end
    end

    # enable fish vi keybindings
    fish_vi_key_bindings
end
