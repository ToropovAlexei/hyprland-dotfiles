#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -S --noconfirm --needed hyprland \
    nerd-fonts noto-fonts \
    nvidia nvidia-utils egl-wayland \
    rofi-lbonn-wayland-git waybar kitty \
    firefox google-chrome discord \
    zed visual-studio-code-bin \
    grim slurp wl-clipboard \
    wireplumber pipewire xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    networkmanager-openconnect \
    dolphin polkit-kde-agent dunst \
    networkmanager-openconnect openssh \
    zsh zsh-theme-powerlevel10k-git \
    telegram-desktop python-pip python-requests net-tools \
    sshpass wlogout swappy grimblast \
    gimp imv archlinux-xdg-menu btop tracy nodejs rsync \
    fastfetch onefetch clang binutils libxkbcommon wayland-protocols \
    extra-cmake-modules llvm noto-fonts-emoji notes hyprpicker \
    tesseract

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
