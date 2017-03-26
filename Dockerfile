FROM alpine:latest

MAINTAINER ramzthecoder@gmail.com

WORKDIR /opt/apk-build

RUN apk update \
    && apk add alpine-sdk su-exec 

RUN mkdir -p /var/cache/distfiles /opt/packages \
    && chmod a+w /var/cache/distfiles \
    && chgrp abuild /var/cache/distfiles \
    && chmod g+w /var/cache/distfiles

# Configure entrypoint
COPY /docker-entrypoint.sh /usr/local/bin/
COPY /docker-entrypoint.d/* /usr/local/bin/docker-entrypoint.d/

VOLUME ["/opt/apk-build", "/opt/packages"]

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
