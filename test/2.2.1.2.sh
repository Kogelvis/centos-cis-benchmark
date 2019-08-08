#!/bin/sh
# ** AUTO GENERATED **

# 2.2.1.2 - Ensure ntp is configured (Scored)
rpm -q ntp | grep -E "^ntp-"
app1=$?
rpm -q chrony | grep -E "^chrony-"
app2=$?

if [[ $app1 -eq 1 && $app2 -eq 1 ]]; then
    # no ntp solution installed
    exit 1
elif [[ $app1 -eq 1 && $app2 -eq 0 ]]; then
    # chrony installed, no use checking ntp config
    exit 0
else
    # check ntp config
    grep "^restrict -6 default kod nomodify notrap nopeer noquery" /etc/ntp.conf || exit $1

    grep -E "^(server|pool)" /etc/ntp.conf || exit $1
fi
