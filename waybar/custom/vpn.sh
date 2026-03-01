#!/bin/bash

ACTIVE=$(nmcli -t -f NAME,TYPE connection show --active)

VPN_CONN=$(echo "$ACTIVE" | grep -i "wireguard" | grep -i "vpn" | head -n1 | cut -d: -f1)
KILLSWITCH=$(echo "$ACTIVE" | grep -i "dummy" | grep -i "killswitch")

if [ -n "$VPN_CONN" ]; then
    COUNTRY=$(echo "$VPN_CONN" | awk '{print $2}')
    if [ -n "$KILLSWITCH" ]; then
        echo "{\"text\": \"$COUNTRY\", \"class\": \"killswitch\", \"alt\": \"locked\"}"
    else
        echo "{\"text\": \"$COUNTRY\", \"class\": \"connected\", \"alt\": \"on\"}"
    fi
else
    echo "{\"text\": \"\", \"class\": \"disconnected\", \"alt\": \"off\"}"
fi