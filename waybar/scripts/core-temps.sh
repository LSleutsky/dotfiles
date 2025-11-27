#!/bin/bash

tooltip=""

# CPU
pkg_temp=$(cat /sys/class/hwmon/hwmon*/temp1_input 2>/dev/null | head -1)
if [ -n "$pkg_temp" ]; then
  tooltip+="CPU: $((pkg_temp / 1000))°C\\n"
fi

# Battery
for hwmon in /sys/class/hwmon/hwmon*; do
  name=$(cat "$hwmon/name" 2>/dev/null)
  if [[ "$name" == "acpitz" ]]; then
    temp_val=$(cat "$hwmon/temp1_input" 2>/dev/null)
    [ -n "$temp_val" ] && tooltip+="Battery: $((temp_val / 1000))°C\\n"
  fi
done

# SSD
for hwmon in /sys/class/hwmon/hwmon*; do
  name=$(cat "$hwmon/name" 2>/dev/null)
  if [[ "$name" == "nvme" ]]; then
    temp_val=$(cat "$hwmon/temp1_input" 2>/dev/null)
    [ -n "$temp_val" ] && tooltip+="SSD: $((temp_val / 1000))°C\\n"
  fi
done

# WiFi
for hwmon in /sys/class/hwmon/hwmon*; do
  name=$(cat "$hwmon/name" 2>/dev/null)
  if [[ "$name" == *iwlwifi* ]]; then
    temp_val=$(cat "$hwmon/temp1_input" 2>/dev/null)
    [ -n "$temp_val" ] && tooltip+="WiFi: $((temp_val / 1000))°C\\n"
  fi
done

tooltip=${tooltip%\\n}

printf '{"text":"","tooltip":"%s"}\n' "$tooltip"
