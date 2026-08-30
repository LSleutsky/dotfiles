#!/bin/bash
# fprintd holds its USB claim on the Goodix reader across suspend/hibernate,
# because the lock screen opens a verify session before sleeping and keeps it
# open the whole time (user sessions are not frozen here -- see
# SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=0). On resume the device answers with
# "still busy with another operation", ReleaseDevice fails too, and PAM returns
# PAM_AUTHINFO_UNAVAIL. The lock screen then shows a fingerprint prompt that can
# never succeed no matter how long you wait, so unlocking falls back to a
# password.
#
# Dropping the daemon before sleep drops the claim. fprintd is D-Bus activated,
# so the first auth attempt on resume starts a fresh one that opens the device
# cleanly.
#
# This has to happen in "pre". A "post" hook is useless: logind emits
# PrepareForSleep(false) the moment the kernel returns, so the lock screen has
# already made its first (failing) attempt ~200ms before post hooks run.
set -u

[ "${1:-}" = "pre" ] || exit 0

if timeout 5 systemctl stop fprintd.service 2>/dev/null; then
    echo "fingerprint-reset: stopped fprintd before sleep" >&2
else
    systemctl kill -s KILL fprintd.service 2>/dev/null || true
    echo "fingerprint-reset: fprintd would not stop, killed it" >&2
fi
