if status is-interactive
    # source python virtual environment
    if not set -q VIRTUAL_ENV
        if test -f "$HOME/uv-qtile/.venv/bin/activate.fish"
            source "$HOME/uv-qtile/.venv/bin/activate.fish"
        end
    end
end
