if status is-interactive
    # Key Bindings
    ## Enable Vi key bindings
    fish_vi_key_bindings

    ## p: paste, y: yank (in normal mode)
    bind -M default p fish_clipboard_paste
    bind -M default y fish_clipboard_copy

    ## y: yank (in visual mode)
    bind -M visual y fish_clipboard_copy

    # Abbreviations
    ## Git
    abbr -a gs 'git status'
    abbr -a gsw 'git switch'
    abbr -a gst 'git stash'
    abbr -a gsp 'git stash pop'
    abbr -a ga 'git add'
    abbr -a gaa 'git add .'
    abbr -a gc 'git commit'
    abbr -a --set-cursor gcm 'git commit -m "%"'
    abbr -a gl 'git log'
    abbr -a grs 'git restore --staged'
    abbr -a gp 'git push'
    abbr -a gpl 'git pull'
    abbr -a gd 'git diff'
    abbr -a gds 'git diff --staged'
    abbr -a gb 'git branch'

    ## Directory and file navigation
    abbr -a .. 'cd ..'
    abbr -a ... 'cd ../..'
    abbr -a .... 'cd ../../..'
    abbr -a cl 'clear'
    abbr -a mk 'mkdir -p'
    abbr -a tc 'touch'

    ### fzf with bat preview
    abbr -a ff 'fzf --height 40% --reverse --preview "bat --color=always --style=numbers --line-range=:500 {}"'

    ### ls and tree with icons (using eza)
    abbr -a ls 'eza --icons'
    abbr -a ll 'eza --icons -l'
    abbr -a la 'eza --icons -a'
    abbr -a lla 'eza --icons -la'
    abbr -a lt 'eza --icons --tree'
    abbr -a lta 'eza --icons --tree -a'
    abbr -a ltl 'eza --icons --tree --level'

    ## Package management (pacman) abbr -a pi 'sudo pacman -S'
    abbr -a pu 'sudo pacman -Syu'
    abbr -a ps 'sudo pacman -Ss'
    abbr -a pr 'sudo pacman -Rs'
    abbr -a pl 'sudo pacman -Qe'

    ## System management
    abbr -a sr 'sudo systemctl restart'
    abbr -a st 'sudo systemctl start'
    abbr -a sp 'sudo systemctl stop'
    abbr -a se 'sudo systemctl enable'
    abbr -a sd 'sudo systemctl disable'
    abbr -a ss 'sudo systemctl status'

    ## Development
    abbr -a vi 'nvim'
end
