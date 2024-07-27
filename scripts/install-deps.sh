#!/bin/bash

sudo pacman -Syu --noconfirm
yay -S --noconfirm --needed hyprland-git \
    nerd-fonts noto-fonts \
    nvidia nvidia-utils egl-wayland \
    wofi waybar kitty \
    discord google-chrome \
    zed-git visual-studio-code-bin \
    grim slurp wl-clipboard \
    wireplumber pipewire xdg-desktop-portal-hyprland-git \
    networkmanager-openconnect \
    dolphin polkit-kde-agent dunst \
    networkmanager-openconnect openssh \
    zsh zsh-theme-powerlevel10k-git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc