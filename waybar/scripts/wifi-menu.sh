#!/bin/bash

if ! command -v rofi &> /dev/null; then
    notify-send "WiFi Menu" "rofi not installed"
    exit 1
fi

if command -v nmcli &> /dev/null; then
    WIFI_STATE=$(nmcli radio wifi)
    if [ "$WIFI_STATE" = "disabled" ]; then
        ENABLE=$(echo -e "Enable WiFi\nCancel" | rofi -dmenu -i -p "WiFi Off")
        [ "$ENABLE" = "Enable WiFi" ] && nmcli radio wifi on && sleep 2 || exit 0
    fi
    
    notify-send "WiFi" "Scanning..." -t 1000
    nmcli device wifi rescan 2>/dev/null; sleep 1
    
    NETWORKS=$(nmcli -f SSID,SIGNAL,SECURITY device wifi list | tail -n +2 | sed 's/^  *//' | sed 's/  */|/g')
    [ -z "$NETWORKS" ] && notify-send "WiFi" "No networks" && exit 0
    
    FORMATTED=$(echo "$NETWORKS" | awk -F'|' '{
        if ($2 >= 80) icon="󰤨"; else if ($2 >= 60) icon="󰤥"; 
        else if ($2 >= 40) icon="󰤢"; else icon="󰤟";
        printf "%s  %s  %s%%\n", icon, $1, $2
    }')
    
    MENU="🔄 Refresh\n🔌 Disconnect\n━━━━━━━━━━\n$FORMATTED"
    CHOSEN=$(echo -e "$MENU" | rofi -dmenu -i -p "WiFi Networks")
    
    [ -z "$CHOSEN" ] && exit 0
    [[ "$CHOSEN" == "🔄 Refresh" ]] && exec "$0"
    [[ "$CHOSEN" == "🔌 Disconnect" ]] && nmcli device disconnect wlan0 && exit 0
    [[ "$CHOSEN" == "━━━━━━━━━━" ]] && exit 0
    
    SSID=$(echo "$CHOSEN" | awk '{print $3}')
    SAVED=$(nmcli -g NAME connection show | grep -x "$SSID")
    
    if [ -n "$SAVED" ]; then
        nmcli connection up "$SSID" && notify-send "WiFi" "Connected to $SSID"
    else
        SECURITY=$(nmcli -f SSID,SECURITY device wifi list | grep "^$SSID" | awk '{print $2}')
        if [ "$SECURITY" = "--" ]; then
            nmcli device wifi connect "$SSID"
        else
            PASSWORD=$(rofi -dmenu -p "Password for $SSID" -password)
            [ -n "$PASSWORD" ] && nmcli device wifi connect "$SSID" password "$PASSWORD"
        fi
    fi
    pkill -RTMIN+8 waybar
    
elif command -v iwctl &> /dev/null; then
    DEVICE=$(iwctl device list | grep -E 'wlan|wlp' | awk '{print $2}' | head -n1)
    MENU="📡 Open iwctl\n🔄 Scan\n🔌 Disconnect"
    CHOSEN=$(echo -e "$MENU" | rofi -dmenu -i -p "WiFi (iwd)")
    
    [ -z "$CHOSEN" ] && exit 0
    [[ "$CHOSEN" == "📡 Open iwctl" ]] && kitty -e iwctl &
    [[ "$CHOSEN" == "🔄 Scan" ]] && iwctl station "$DEVICE" scan
    [[ "$CHOSEN" == "🔌 Disconnect" ]] && iwctl station "$DEVICE" disconnect
fi
