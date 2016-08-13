FROM alpine:3.4

MAINTAINER ramzthecoder@gmail.com

WORKDIR /opt/apk-build

RUN apk update \
    && apk add alpine-sdk \
    && adduser apkbuilder -D \
    && adduser apkbuilder abuild \
    && echo "apkbuilder   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN git clone git://dev.alpinelinux.org/aports

RUN mkdir -p /var/cache/distfiles /opt/packages \
    && chmod a+w /var/cache/distfiles \
    && chgrp abuild /var/cache/distfiles \
    && chmod g+w /var/cache/distfiles

# Configure entrypoint
COPY /docker-entrypoint.sh /usr/local/bin/
COPY /docker-entrypoint.d/* /usr/local/bin/docker-entrypoint.d/

VOLUME ["/opt/apk-build", "/opt/packages"]

USER apkbuilder

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["tail", "-f"]
