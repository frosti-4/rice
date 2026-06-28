if status is-interactive
    # Starship custom prompt
    starship init fish | source
    end
    alias suka='sudo'
    alias inst='sudo pacman -S'
    alias ainst='yay -S'
# fish_add_path ~/.cargo/bin
set -gx EDITOR nvim
