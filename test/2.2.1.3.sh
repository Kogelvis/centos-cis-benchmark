#!/bin/sh
# ** AUTO GENERATED **

# 2.2.1.3 - Ensure chrony is configured (Scored)
rpm -q ntp | grep -E "^ntp-"
app1=$?
rpm -q chrony | grep -E "^chrony-"
app2=$?

if [[ $app1 -eq 1 && $app2 -eq 1 ]]; then
    # no ntp installed
    exit 1
elif [[ $app1 -eq 0 && $app2 -eq 1 ]]; then
    # ntp installed and not chrony, no use in checking
    exit 0
else
    # chrony installed, check config
    grep -E "^(server|pool)" /etc/chrony.conf || exit $?
    grep -E "^OPTIONS" /etc/sysconfig/chronyd | grep "OPTIONS=\"-u chrony\"" || exit $?
fi
