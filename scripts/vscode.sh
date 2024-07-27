#!/bin/bash

echo "Copying vscode settings.json file..."
mkdir -p ~/.config/Code/User && cp ./vscode/settings.json ~/.config/Code/User/settings.json || {
    echo "Failed to copy vscode settings.json file."
    exit 1
}

echo "vscode settings.json file copied successfully."

code --install-extension eamodio.gitlens # GitLens
code --install-extension Codeium.codeium # Codeium
code --install-extension vscode-icons-team.vscode-icons # Icons
code --install-extension codeandstuff.package-json-upgrade # Upgrade package.json
code --install-extension ritwickdey.LiveServer # LiveServer
code --install-extension esbenp.prettier-vscode # Prettier
code --install-extension dbaeumer.vscode-eslint # ESLint
code --install-extension ms-azuretools.vscode-docker # Docker
code --install-extension twxs.cmake # CMake
code --install-extension ms-vscode.cmake-tools # CMake tools
code --install-extension naumovs.color-highlight # Color Highlight
code --install-extension rvest.vs-code-prettier-eslint # Prettier ESLint