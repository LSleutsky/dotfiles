#!/bin/bash
DELAY=1200
FLAG=/run/hibernate-delay-armed

case "$1" in
  pre)
    [ "$2" = "hibernate" ] && exit 0
    echo 0 > /sys/class/rtc/rtc0/wakealarm
    ALARM=$(( $(date +%s) + DELAY ))
    echo "$ALARM" > "$FLAG"
    echo "$ALARM" > /sys/class/rtc/rtc0/wakealarm
    echo "hibernate-delay: armed for +${DELAY}s" >&2
    ;;
  post)
    [ "$2" = "hibernate" ] && exit 0
    echo 0 > /sys/class/rtc/rtc0/wakealarm
    if [ -f "$FLAG" ]; then
      ALARM=$(cat "$FLAG")
      NOW=$(date +%s)
      rm -f "$FLAG"
      if [ "$NOW" -ge "$(( ALARM - 10 ))" ]; then
        echo "hibernate-delay: timer elapsed, hibernating" >&2
        systemd-run --no-block systemctl hibernate
      else
        echo "hibernate-delay: woken early, $(( ALARM - NOW ))s remaining, staying awake" >&2
      fi
    fi
    ;;
esac
