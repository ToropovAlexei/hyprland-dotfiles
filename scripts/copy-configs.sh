#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" -eq 0 ]; then
    echo "Please do not run this script as root."
    exit 1
fi

# Get the current user
current_user=$USER

echo "Copying screen-sharing-fix.sh file..."
mkdir -p ~/scripts && cp ./screen-sharing-fix.sh ~/scripts/ || {
    echo "Failed to copy screen-sharing-fix.sh file."
    exit 1
}

# Путь к источнику и месту назначения
SOURCE="./configs"
DESTINATION="$HOME/.config"

# Проверяем, существует ли источник
if [ ! -d "$SOURCE" ]; then
    echo "Директория $SOURCE не найдена."
    exit 1
fi

# Копируем файлы и папки, сохраняем структуру
rsync -av --ignore-existing "$SOURCE/" "$DESTINATION/"

# Заменяем файлы, если они совпадают
rsync -av --remove-source-files "$SOURCE/" "$DESTINATION/"

echo "Copying zshrc file..."
cp ./zsh/.zshrc ~/.zshrc || {
    echo "Failed to copy zshrc file."
    exit 1
}

echo "Copying p10k.zsh file..."
cp ./zsh/.p10k.zsh ~/.p10k.zsh || {
    echo "Failed to copy p10k.zsh file."
    exit 1
}

echo "Copying zprofile file..."
cp ./zsh/.zprofile ~/.zprofile || {
    echo "Failed to copy zprofile file."
    exit 1
}

# echo "Copying override.conf file..."
# sudo mkdir -p /etc/systemd/system/getty@tty1.service.d && cp ./override.conf /etc/systemd/system/getty@tty1.service.d/override.conf || {
#     echo "Failed to copy override.conf file."
#     exit 1
# }

echo "Config files copied successfully."