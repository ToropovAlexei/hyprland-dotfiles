#!/bin/bash

sudo pacman -Syu --noconfirm
yay -S --noconfirm --needed hyprland-git \
    nerd-fonts noto-fonts \
    nvidia nvidia-utils egl-wayland \
    wofi waybar kitty \
    firefox google-chrome discord \
    zed-git visual-studio-code-bin \
    grim slurp wl-clipboard \
    wireplumber pipewire xdg-desktop-portal-hyprland-git \
    xdg-desktop-portal-gtk \
    networkmanager-openconnect \
    dolphin polkit-kde-agent dunst \
    networkmanager-openconnect openssh \
    zsh zsh-theme-powerlevel10k-git \
    telegram-desktop python-pip python-requests net-tools \
    sshpass wlogout swappy grimblast \
    gimp

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash