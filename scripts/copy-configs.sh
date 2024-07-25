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

# Define the directories to copy
directories=("wofi" "waybar" "kitty")

# Copy the directories
for directory in "${directories[@]}"; do
    cp -r "$directory" "/home/$current_user/.config" || {
        echo "Failed to copy $directory directory."
        exit 1
    }
done