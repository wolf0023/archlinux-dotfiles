if status is-interactive
    # source python virtual environment
    if not set -q VIRTUAL_ENV
        if test -f "$HOME/.venv/bin/activate.fish"
            source "$HOME/.venv/bin/activate.fish"
        end
    end
end
