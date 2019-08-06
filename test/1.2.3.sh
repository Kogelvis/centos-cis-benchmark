#!/bin/sh
# ** AUTO GENERATED **

# 1.2.3 - Ensure gpgcheck is globally activated (Scored)

# Extract reposdir if present otherwise fallback to default
reposdir=$(grep reposdir= /etc/yum.conf || echo "reposdir=/etc/yum.repos.d")
reposdir=$(echo ${reposdir} | cut -d"=" -f2)

if [[ $(ls -A ${reposdir}) ]] ; then
        grep ^gpgcheck /etc/yum.conf ${reposdir}/* | grep -E "gpgcheck=1" || exit $?
else
        grep ^gpgcheck /etc/yum.conf | grep -E "gpgcheck=1" || exit $?
fi
