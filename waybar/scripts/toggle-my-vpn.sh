#!/bin/bash

# Capture the output of the ssh command
output=$(sshpass -f ./waybar/scripts/test ssh admin@192.168.1.1 -p 2022 "show interface OpenVPN0")

# Check the connection status by parsing the output
if [[ $output == *"connected: yes"* ]]; then
    command="interface OpenVPN0 no up"
else
    command="interface OpenVPN0 up"
fi

# Execute the SSH command once
sshpass -f ./waybar/scripts/test ssh admin@192.168.1.1 -p 2022 "$command"