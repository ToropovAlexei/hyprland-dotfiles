#!/bin/bash

# Get the username
username=$(whoami)

# Check if the username is already in the sudoers file
if grep -q "^$username" /etc/sudoers; then
    echo "Username already has NOPASSWD permission for openconnect"
else
    # Add the entry to the sudoers file
    echo "$username ALL=(ALL) NOPASSWD: /usr/bin/openconnect" | sudo tee -a /etc/sudoers
    echo "$username ALL=(ALL) NOPASSWD: /usr/bin/pkill openconnect" | sudo tee -a /etc/sudoers
    echo "Added NOPASSWD permission for openconnect for $username"
fi