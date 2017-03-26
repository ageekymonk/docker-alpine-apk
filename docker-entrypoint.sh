#!/bin/sh

DIR=/usr/local/bin/docker-entrypoint.d/

for file in `ls $DIR`
do
    sh $DIR/$file
done

su-exec apkbuilder "$@"
