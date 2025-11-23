#!/bin/bash
if command -v nmcli &> /dev/null; then
    WIFI_STATE=$(nmcli radio wifi)
    if [ "$WIFI_STATE" = "enabled" ]; then
        SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
        SIGNAL=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d':' -f2)
        if [ -n "$SSID" ]; then
            if [ "$SIGNAL" -ge 80 ]; then ICON="󰤨"
            elif [ "$SIGNAL" -ge 60 ]; then ICON="󰤥"
            elif [ "$SIGNAL" -ge 40 ]; then ICON="󰤢"
            else ICON="󰤟"; fi
            echo "{\"text\":\"$ICON $SSID\",\"tooltip\":\"$SSID: $SIGNAL%\"}"
        else
            echo "{\"text\":\"󰤭 Disconnected\",\"tooltip\":\"No connection\"}"
        fi
    else
        echo "{\"text\":\"󰤭 Off\",\"tooltip\":\"WiFi disabled\"}"
    fi
elif command -v iwctl &> /dev/null; then
    DEVICE=$(iwctl device list | grep -E 'wlan|wlp' | awk '{print $2}' | head -n1)
    if [ -n "$DEVICE" ]; then
        STATE=$(iwctl station "$DEVICE" show 2>/dev/null | grep "State" | awk '{print $2}')
        if [ "$STATE" = "connected" ]; then
            SSID=$(iwctl station "$DEVICE" show 2>/dev/null | grep "Connected network" | awk '{print $3}')
            echo "{\"text\":\"󰤨 $SSID\",\"tooltip\":\"Connected: $SSID\"}"
        else
            echo "{\"text\":\"󰤭 Disconnected\",\"tooltip\":\"Not connected\"}"
        fi
    fi
else
    echo "{\"text\":\"󰤭 N/A\",\"tooltip\":\"No network manager\"}"
fi
