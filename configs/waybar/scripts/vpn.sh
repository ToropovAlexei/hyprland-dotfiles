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
        echo '{"text": "<span>NVK \uf427 ‏ VPN</span>", "class": "active"}'
    else
        echo '{"text": "<span>NVK 🖧 VPN</span>"}'
    fi
}

echo $(get_vpn_text)