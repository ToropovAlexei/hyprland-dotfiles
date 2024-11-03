#!/bin/bash

if ifconfig | grep -q "tun"; then
    sudo pkill openconnect
    exit 0
fi

# Set the path to the credentials file
credentials_file="$HOME/work/credentials"

# Read the login and password from the credentials file
while IFS= read -r line; do
    case "$line" in
        login*) login="${line#login }";;
        password*) password="${line#password }";;
        server*) server="${line#server }";;
    esac
done < "$credentials_file"

# Check if the login and password are present in the credentials file
if [ -z "$login" ] || [ -z "$password" ] || [ -z "$server" ]; then
    echo "Login or password or server not found in the credentials file"
    exit 1
fi

# Run the openconnect command with the login and password
echo "$password" | sudo -S openconnect --protocol=anyconnect "$server" --user="$login" --authgroup=internal --http-auth=Basic