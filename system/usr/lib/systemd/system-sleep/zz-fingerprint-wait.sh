#!/bin/bash
# Close a race on resume. The Goodix reader (27c6:609c) is re-enumerated on the
# USB bus when the machine wakes, but DankMaterialShell's lock screen opens its
# fprintd PAM session ~10ms after this service exits -- before the device has
# registered. PAM returns PAM_AUTHINFO_UNAVAIL and DMS backs off exponentially
# (1.5s, 3s, 6s, ... capped at 30s), so the lock screen sits there showing a
# fingerprint icon that nothing is actually listening to.
#
# Blocking here delays the resume signal that wakes DMS, so by the time the lock
# screen asks for a finger the reader is present. Named zz- so it sorts after
# hibernate-delay.sh and never holds up a re-hibernation.
set -u

[ "${1:-}" = "post" ] || exit 0

VENDOR=27c6
PRODUCT=609c
TIMEOUT=50   # tenths of a second

reader_ready() {
    for d in /sys/bus/usb/devices/*/; do
        [ "$(cat "$d/idVendor" 2>/dev/null)" = "$VENDOR" ] || continue
        [ "$(cat "$d/idProduct" 2>/dev/null)" = "$PRODUCT" ] || continue
        # 90-fingerprint-no-autosuspend.rules flips this from "auto" to "on", so
        # seeing "on" also proves udev has finished processing the device.
        [ "$(cat "$d/power/control" 2>/dev/null)" = "on" ] || continue
        return 0
    done
    return 1
}

i=0
while [ "$i" -lt "$TIMEOUT" ]; do
    if reader_ready; then
        echo "fingerprint-wait: reader ready after $(( i * 100 ))ms" >&2
        exit 0
    fi
    sleep 0.1
    i=$(( i + 1 ))
done

echo "fingerprint-wait: reader not ready after $(( TIMEOUT * 100 ))ms, giving up" >&2
