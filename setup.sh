#!/bin/bash
# Fuctions
# Install font a given URL
# $1: URL of the font zip file
function installFont() {
    wget "$1" || {
        echo "Failed to download font from $1";
        return 1;
    }
    unzip "${1##*/}" || {
        echo "Failed to unzip font file ${1##*/}";
        return 1;
    }
    rm "${1##*/}"
}

# Create symbolic link for configuration files
# $1: source file
# $2: destination file
function setConfigLink() {
    # Backup existing config if it exists
    if [ -e "$2" ]; then
        mv "$2" "$2-backup"
    fi
    ln -sf "$1" "$2"
}

# Create symbolic link for configuration files with sudo
# $1: source file
# $2: destination file
function setConfigLinkWithSudo() {
    # Backup existing config if it exists
    if [ -e "$2" ]; then
        sudo mv "$2" "$2-backup"
    fi
    sudo ln -sf "$1" "$2"
}

# Start of the script
echo "Starting setup..."
current_dir="$(pwd)"


# Set fish as default shell
echo "Setting fish as the default shell..."
# Check if fish is already the default shell
if [ "$SHELL" != "/usr/bin/fish" ]; then
    chsh -s /usr/bin/fish
fi


# Linking configuration files
echo "Linking configuration files..."
# Create necessary directories
mkdir -p "$HOME/.config"
sudo mkdir -p /etc/fonts

# X11 configs
echo "Linking X11 configuration files..."
setConfigLink "$current_dir/x11/.xinitrc" "$HOME/.xinitrc"
setConfigLink "$current_dir/x11/.Xresources" "$HOME/.Xresources"

# qtile configs
echo "Linking qtile configuration files..."
setConfigLink "$current_dir/qtile" "$HOME/.config/qtile"

# Alacritty configs
echo "Linking Alacritty configuration files..."
setConfigLink "$current_dir/alacritty" "$HOME/.config/alacritty"

# Neovim configs
echo "Linking Neovim configuration files..."
setConfigLink "$current_dir/nvim" "$HOME/.config/nvim"

# Fontconfig(Root permission required)
echo "Linking Fontconfig configuration files..."
setConfigLinkWithSudo "$current_dir/fontconfig/local.conf" "/etc/fonts/local.conf"


# Install necessary packages
echo "Installing necessary packages..."
if [ -f "$current_dir/pkglist.txt" ]; then
    echo "Package list file not found!";
    echo "Please clone the repository including pkglist.txt and try again.";
    exit 1;
fi
cat "$current_dir/pkglist.txt" | sudo pacman -Syu --noconfirm --needed -

# Install qtile
echo "Installing qtile..."
export PATH="$HOME/.local/bin:$PATH"
uv tool install qtile[widgets]
uv tool update-shell # Update shell environment


# Install fonts
echo "Installing fonts..."
# Create fonts directory
mkdir -p "$HOME/.local/share/fonts"
cd "$HOME/.local/share/fonts" || { 
    echo "Failed to change directory to $HOME/.local/share/fonts";
    exit 1;
}

# Moralerspace font
installFont "https://github.com/yuru7/moralerspace/releases/download/v2.0.0/Moralerspace_v2.0.0.zip" || {
    echo "Failed to install Moralerspace font.";
    exit 1;
}
# Noto Sans CJK KR and SC fonts
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/08_NotoSerifCJKkr.zip" || {
    echo "Failed to install Noto Sans CJK KR font.";
    exit 1;
}
installFont "https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/09_NotoSerifCJKsc.zip" || {
    echo "Failed to install Noto Sans CJK SC font.";
    exit 1;
}

# Update font cache
fc-cache -fv

# Return to the original directory
cd "$current_dir" || {
    echo "Failed to return to the original directory.";
    exit 1;
}


echo "Setup completed! Please restart your system to apply all changes."
