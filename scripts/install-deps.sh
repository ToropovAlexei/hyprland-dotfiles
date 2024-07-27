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
    networkmanager-openconnect openssh

yay -S --noconfirm zsh zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc