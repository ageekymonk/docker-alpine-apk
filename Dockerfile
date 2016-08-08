FROM alpine:3.4

MAINTAINER ramzthecoder@gmail.com

WORKDIR /opt/apk-build

RUN apk update \
    && apk add alpine-sdk

RUN git clone git://dev.alpinelinux.org/aports

# # Configure entrypoint
# COPY /docker-entrypoint.sh /usr/local/bin/
# COPY /docker-entrypoint.d/* /usr/local/bin/docker-entrypoint.d/
# ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
# CMD ["puppetserver", "foreground"]
