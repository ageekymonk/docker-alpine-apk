#!/bin/sh

su apkbuilder -c "abuild-keygen -a -n"
su apkbuilder -c "sudo cp ~/.abuild/*.pub /etc/apk/keys"
