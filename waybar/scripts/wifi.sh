#!/bin/bash

if command -v iwctl &> /dev/null; then
    DEVICE=$(iwctl device list | grep -E 'wlan|wlp' | awk '{print $2}' | head -n1)
    
    if [ -n "$DEVICE" ]; then
        STATION_INFO=$(iwctl station "$DEVICE" show 2>/dev/null)
        STATE=$(echo "$STATION_INFO" | grep "State" | awk '{print $2}')
        
        if [ "$STATE" = "connected" ]; then
            # Get everything after "Connected network" and trim whitespace
            SSID=$(echo "$STATION_INFO" | grep "Connected network" | sed 's/.*Connected network[[:space:]]*//' | xargs)
            echo "{\"text\":\"󰤨 $SSID\",\"tooltip\":\"$SSID\"}"
        else
            echo "{\"text\":\"󰤭\",\"tooltip\":\"Disconnected\"}"
        fi
    else
        echo "{\"text\":\"󰤭\",\"tooltip\":\"No Device\"}"
    fi
else
    echo "{\"text\":\"󰤭\",\"tooltip\":\"iwctl not found\"}"
fi
