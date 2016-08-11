#!/bin/sh

sed -i "s/^#PACKAGER.*/PACKAGER=\"${GIT_USER_FULLNAME} <${GIT_USER_EMAIL}>\"/g" /etc/abuild.conf
