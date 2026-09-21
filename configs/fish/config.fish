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
    abbr -a l 'eza --icons=auto'
    abbr -a ll 'eza --icons -l'
    abbr -a la 'eza --icons -a'
    abbr -a lla 'eza --icons -la'
    abbr -a t 'eza --icons -lT'
    abbr -a ta 'eza --icons -laT'
    abbr -a tll 'eza --icons -lTL'

    ## Package management (pacman)
    abbr -a p 'pacman'
    abbr -a pss 'pacman -Ss'
    abbr -a pqs 'pacman -Qs'
    abbr -a sp 'sudo pacman'
    abbr -a spu 'sudo pacman -Syu'
    abbr -a spr 'sudo pacman -Rs'

    ## System management
    abbr -a ssc 'sudo systemctl'
    abbr -a sc 'systemctl'
    abbr -a scu 'systemctl --user'

    ## Development
    abbr -a vi 'nvim'
    abbr -a za 'zathura --fork'

    # Others
    zoxide init fish | source
end
