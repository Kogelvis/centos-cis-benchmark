#!/bin/sh
# ** AUTO GENERATED **

# 1.7.1.4 - Ensure permissions on /etc/motd are configured (Not Scored)

# check user/group
stat -L -c "%u %g" /etc/motd | grep -q "0 0$" || exit $?

# check that /etc/motd is min 444 and max 644 in rights
find /etc/motd -perm -444 ! -perm /133 | grep -q "/etc/motd" || exit $?
