#!/bin/bash

is_vpn_connected() {
    if ifconfig | grep -q "tun"; then
        return 0
    else
        return 1
    fi
}

get_vpn_text() {
    if is_vpn_connected; then
        echo "Connected to VPN"
    else
        echo "Not connected to VPN"
    fi
}

echo "{\"text\": \"$(get_vpn_text)\"}"