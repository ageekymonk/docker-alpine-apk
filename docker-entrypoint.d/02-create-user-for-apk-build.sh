#!/bin/sh
USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
adduser -u $USER_ID apkbuilder -D
adduser apkbuilder abuild

echo "apkbuilder   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

