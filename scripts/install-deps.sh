#!/bin/bash

sudo pacman -Syu --noconfirm
yay -S --noconfirm --needed hyprland-git \
    nerd-fonts \
    nvidia nvidia-utils egl-wayland \
    wofi waybar kitty \
    discord google-chrome \
    zed-git visual-studio-code-bin \
    grim slurp wl-clipboard \