#!/bin/bash

cp ./mkinitcpio.conf /etc || {
    echo "Failed to copy mkinitcpio.conf file."
    exit 1
}
echo "mkinitcpio.conf copied successfully."

cp ./nvidia.conf /etc/modprobe.d || {
    echo "Failed to copy nvidia.conf file."
    exit 1
}
echo "nvidia.conf copied successfully."

sudo mkinitcpio -P || {
    echo "Failed to run mkinitcpio."
    exit 1
}

echo "mkinitcpio ran successfully."
