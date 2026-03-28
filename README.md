# Arch Linux Dotfiles

Personal configuration files for Arch Linux with Hyprland, a Wayland compositor.

## Overview

This repository contains dotfiles and setup scripts for a minimal Arch Linux desktop environment. The setup uses Hyprland as the window manager, Fish as the default shell, and includes various tools for development and daily use.

## Screenshots

Desktop with terminal and Neovim.

<img width="2560" height="1440" alt="Image" src="https://github.com/user-attachments/assets/afc4e2bd-3d36-4b82-934c-004d9c3a84e6" />

Wallpaper by [ゲームまてりあるず](https://game-materials.com/).

<img width="2560" height="1440" alt="Image" src="https://github.com/user-attachments/assets/d782532b-47e7-4766-a820-b3d793e266bc" />

## Directory Structure

```
.
├── configs/                 Application configuration files
├── scripts/                 Setup helpers used by setup.sh
├── pkglist.txt              Packages installed with pacman
└── setup.sh                 Main bootstrap script
```

## Included Configurations

- **hypr** - Hyprland window manager and Hyprpaper wallpaper daemon
- **waybar** - Status bar for Wayland compositors
- **fish** - Fish shell configuration
- **foot** - Wayland terminal emulator
- **nvim** - Neovim text editor
- **vim** - Vim text editor
- **rofi** - Application launcher
- **dunst** - Notification daemon
- **fontconfig** - Font configuration

## Packages

The `pkglist.txt` file contains all packages to be installed, organised into categories:

### Essential

- Display server: Wayland, XWayland
- Window manager: Hyprland, Hyprpaper, Waybar
- Utilities: Rofi, Foot, wl-clipboard, grim, slurp

### Audio

- PipeWire with WirePlumber session manager

### Development

- Neovim, Node.js, Python, GCC

### Applications

- Firefox, Thunderbird, Telegram, Discord, Spotify, Steam

### Fonts

- Monaspace, Noto CJK, Noto Emoji

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
- Install additional fonts
- Enable PipeWire audio services

Existing configuration files will be backed up to `~/.archlinux-dotfiles-backup` before being replaced.

## Post-Installation

After running the setup script, you may need to:

1. Restart your system to apply all changes
2. Configure additional settings manually (e.g., network, displays)
3. Set up input methods if required (fcitx5 is included)

## Keybindings

The main modifier key is **Alt**. Application shortcuts use **Super** (Windows key).

### General

| Keybinding | Action |
|------------|--------|
| Alt + Ctrl + Q | Close active window |
| Alt + Ctrl + Z | Exit Hyprland |
| Alt + F | Toggle floating mode |
| Alt + Shift + F | Toggle fullscreen |
| Alt + I | Focus previous window |
| Alt + Ctrl + I | Switch to previous workspace |
| Alt + O | Toggle split orientation |

### Applications

| Keybinding | Action |
|------------|--------|
| Alt + Return | Open terminal (Foot) |
| Alt + R | Open application launcher (Rofi) |
| Alt + B | Open browser (Firefox) |
| Alt + M | Open mail client (Thunderbird) |
| Super + D | Open Discord |
| Super + S | Open Spotify |
| Super + T | Open Telegram |

### Window Navigation

| Keybinding | Action |
|------------|--------|
| Alt + H | Focus left |
| Alt + J | Focus down |
| Alt + K | Focus up |
| Alt + L | Focus right |

### Window Management

| Keybinding | Action |
|------------|--------|
| Alt + Shift + H | Resize window left |
| Alt + Shift + J | Resize window down |
| Alt + Shift + K | Resize window up |
| Alt + Shift + L | Resize window right |
| Alt + Ctrl + H | Swap window left |
| Alt + Ctrl + J | Swap window down |
| Alt + Ctrl + K | Swap window up |
| Alt + Ctrl + L | Swap window right |
| Alt + Left Mouse | Move window |
| Alt + Right Mouse | Resize window |

### Workspaces

| Keybinding | Action |
|------------|--------|
| Alt + 1-0 | Switch to workspace 1-10 |
| Alt + Ctrl + 1-0 | Move active window to workspace 1-10 |

### Media and Hardware

| Keybinding | Action |
|------------|--------|
| XF86AudioRaiseVolume | Increase volume |
| XF86AudioLowerVolume | Decrease volume |
| XF86AudioMute | Toggle mute |
| XF86AudioMicMute | Toggle microphone mute |
| XF86MonBrightnessUp | Increase brightness |
| XF86MonBrightnessDown | Decrease brightness |
| XF86AudioPlay/Pause | Play/pause media |
| XF86AudioNext | Next track |
| XF86AudioPrev | Previous track |

### Screenshot

| Keybinding | Action |
|------------|--------|
| Print | Take screenshot of selected area (saved to ~/Screenshots and copied to clipboard) |

## Licence

This project is provided as-is for personal use. Feel free to use and modify these configurations for your own setup.
