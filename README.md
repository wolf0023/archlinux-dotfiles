# Arch Linux Dotfiles

Personal configuration files for Arch Linux with Hyprland, a Wayland compositor.

## Overview

This repository contains dotfiles and setup scripts for a minimal Arch Linux desktop environment. The setup uses Hyprland as the window manager, Fish as the default shell, and includes various tools for development and daily use.

## Screenshots

Desktop with fastfetch, btop and Neovim.

<img width="1920" height="1200" alt="Image" src="https://github.com/user-attachments/assets/15625966-47c8-4dfa-9494-cad6a2dd0e19" />

Wallpaper by Gemini 3 Pro Image (Nano Banana Pro).

<img width="1920" height="1200" alt="Image" src="https://github.com/user-attachments/assets/01446cbd-23cc-480f-8217-10e23e0e05ad" />

## Directory Structure

```
.
├── configs/                 Application configuration files
├── scripts/                 Setup helpers used by setup.sh
├── pkglist.txt              Packages installed with pacman
└── setup.sh                 Main bootstrap script
```

## Included Configurations

- **hypr** - Hyprland window manager, Hyprlock screen locker, and Hyprpaper wallpaper daemon
- **waybar** - Status bar for Wayland compositors
- **fish** - Fish shell configuration
- **alacritty** - Terminal emulator
- **nvim** - Neovim text editor
- **rofi** - Application launcher
- **dunst** - Notification daemon
- **fontconfig** - Font configuration

## Packages

The `pkglist.txt` file contains all packages to be installed, organised into categories:

### Essential

- Display server: wayland, xorg-xwayland
- Window manager: hyprland, hyprlock, hyprpaper, waybar
- Utilities: rofi, alacritty, wl-clipboard, grim, slurp, brightnessctl, playerctl, dunst
- Setup tools: git, github-cli, sudo, unzip, wget, fish

### Audio

- PipeWire stack (pipewire, pipewire-audio, pipewire-pulse)
- Session manager: wireplumber

### Development

- Editor: neovim
- Runtimes: nodejs, npm, python
- CLI tools: gcc, fzf, ripgrep, fd, bat, tree-sitter-cli, eza, zoxide

### Applications

- Browser and Mail: firefox, thunderbird
- Social and Media: telegram-desktop, discord, spotify-player, mpv, imv
- Gaming: steam
- Document: zathura, zathura-pdf-mupdf

### System and Utilities

- Monitoring: btop, fastfetch
- Networking: net-tools, networkmanager, ufw
- Others: rclone, fcitx5-im, fcitx5-skk

### Fonts

- otf-monaspace-nerd, ttf-mplus-nerd, adobe-source-han-sans-otc-fonts, noto-fonts-emoji

## Requirements

- Arch Linux (or an Arch-based distribution)
- Git
- Sudo privileges

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/wolf0023/archlinux-dotfiles.git
   cd archlinux-dotfiles
   ```

2. Run the setup script:

   ```bash
   ./setup.sh
   ```

The setup script will:

- Create symbolic links for all configuration files
- Configure locale settings
- Install packages from `pkglist.txt`
- Set Fish as the default shell
- Enable PipeWire audio services

Existing configuration files will be backed up to `~/.archlinux-dotfiles-backup` before being replaced.

## Post-Installation

After running the setup script, you may need to:

1. Restart your system to apply all changes
2. Configure additional settings manually (e.g., network, displays)
3. Set up input methods if required (fcitx5 is included)

## Keybindings

The main modifier key is **Alt**. Application shortcuts use **Super** or **Alt**.

### General

| Keybinding | Action |
|------------|--------|
| Alt + Shift + Q | Close active window |
| Super + Shift + Z | Exit Hyprland |
| Alt + Shift + F | Toggle floating mode |
| Alt + F | Toggle full screen |
| Alt + M | Maximize active window |
| Alt + I | Focus next window, including floating windows |
| Alt + S | Toggle split orientation |
| Alt + O | Move focus to next monitor |
| Alt + P | Pin active window (floating only) |

### Applications

| Keybinding | Action |
|------------|--------|
| Alt + Shift + Return | Open terminal (Alacritty) |
| Alt + Shift + M | Open application launcher (Rofi) |
| Super + B | Open browser (Firefox) |
| Super + M | Open mail client (Thunderbird) |
| Super + D | Open Discord |
| Super + T | Open Telegram |
| Super + Shift + L | Lock screen (Hyprlock) |

### Navigation and Window Movement

| Keybinding | Action |
|------------|--------|
| Alt + H / J / K / L | Move focus left / down / up / right |
| Alt + Shift + H / J / K / L | Move active window left / down / up / right |
| Alt + Shift + 1-0 | Move active window to workspace 1-10 |
| Alt + Left Mouse Drag | Move window |
| Alt + Right Mouse Drag | Resize window |

### Resize Mode (Submap)

| Keybinding | Action |
|------------|--------|
| Alt + R | Enter resize mode |
| H / J / K / L | Resize window (in resize mode) |
| Esc / Ctrl + [ | Exit resize mode |

### Workspaces

| Keybinding | Action |
|------------|--------|
| Alt + 1-0 | Switch to workspace 1-10 |
| Alt + Shift + I | Switch to previous workspace |
| Alt + Shift + O | Move active workspace to next monitor 
| Alt + Shift + N | Focus the next workspace on the monitor |
| Alt + Shift + P | Focus the previous workspace on the monitor |

### Media and Hardware

| Keybinding | Action |
|------------|--------|
| XF86AudioRaiseVolume | Increase volume (+2%) |
| XF86AudioLowerVolume | Decrease volume (-2%) |
| XF86AudioMute | Toggle audio mute |
| XF86AudioMicMute | Toggle microphone mute |
| XF86MonBrightnessUp | Increase LCD brightness (+2%) |
| XF86MonBrightnessDown | Decrease LCD brightness (-2%) |
| XF86AudioPlay / Pause | Play / Pause media |
| XF86AudioNext | Next track |
| XF86AudioPrev | Previous track |

### Screenshot

| Keybinding | Action |
|------------|--------|
| Print | Take screenshot of selected area (saved to ~/Screenshots and copied to clipboard) |

## Licence

This project is provided as-is for personal use. Feel free to use and modify these configurations for your own setup.
