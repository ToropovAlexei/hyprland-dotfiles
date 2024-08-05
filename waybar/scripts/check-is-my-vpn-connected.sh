#!/bin/bash

output=$(sshpass -f ./waybar/scripts/test ssh admin@192.168.1.1 -p 2022 "show interface OpenVPN0 | grep '^connected:'")

# Parse the output and check the connection status
if [[ $output == *"connected: yes"* ]]; then
    echo "Connected"
else
    echo "Not Connected"
fi