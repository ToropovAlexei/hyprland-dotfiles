#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" -eq 0 ]; then
    echo "Please do not run this script as root."
    exit 1
fi

# Get the current user
current_user=$USER

# Copy the hyprland.conf file
cp ./hyprland.conf /home/$current_user/.config/hypr/hyprland.conf || {
    echo "Failed to copy hyprland.conf file."
    exit 1
}

# Copy the wofi directory
cp -r ./wofi /home/$current_user/.config || {
    echo "Failed to copy wofi directory."
    exit 1
}

# Copy the waybar directory
cp -r ./waybar /home/$current_user/.config || {
    echo "Failed to copy waybar directory."
    exit 1
}

# Copy the kitty directory
cp -r ./kitty /home/$current_user/.config || {
    echo "Failed to copy kitty directory."
    exit 1
}