#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" -eq 0 ]; then
    echo "Please do not run this script as root."
    exit 1
fi

# Get the current user
current_user=$USER

# Copy the hyprland.conf file
echo "Copying hyprland.conf file..."
mkdir -p ~/.config/hypr && cp ./hyprland.conf ~/.config/hypr/ || {
    echo "Failed to copy hyprland.conf file."
    exit 1
}

echo "Copying fonts.conf file..."
mkdir -p ~/.config/fontconfig && cp ./fonts.conf ~/.config/fontconfig/ || {
    echo "Failed to copy fonts.conf file."
    exit 1
}

echo "Copying screen-sharing-fix.sh file..."
mkdir -p ~/scripts && cp ./screen-sharing-fix.sh ~/scripts/ || {
    echo "Failed to copy screen-sharing-fix.sh file."
    exit 1
}

echo "Copying hyprland-portals.conf file..."
mkdir -p ~/.config/xdg-desktop-portal && cp ./hyprland-portals.conf ~/.config/xdg-desktop-portal/ || {
    echo "Failed to copy hyprland-portals.conf file."
    exit 1
}

# Define the directories to copy
directories=("wofi" "waybar" "kitty" "rofi")

# Copy the directories
for directory in "${directories[@]}"; do
    echo "Copying $directory directory..."
    cp -r "$directory" "/home/$current_user/.config" || {
        echo "Failed to copy $directory directory."
        exit 1
    }
done

echo "Copying zshrc file..."
cp ./.zshrc ~/.zshrc || {
    echo "Failed to copy zshrc file."
    exit 1
}

echo "Copying p10k.zsh file..."
cp ./.p10k.zsh ~/.p10k.zsh || {
    echo "Failed to copy p10k.zsh file."
    exit 1
}

echo "Config files copied successfully."