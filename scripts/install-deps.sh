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
    zsh zsh-theme-powerlevel10k-git \
    telegram-desktop python-pip python-requests net-tools

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc