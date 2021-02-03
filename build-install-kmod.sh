#!/bin/bash

set -ex

NAME=gtp-builder
SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

docker run --network host --privileged --detach --name $NAME \
    -v /usr/src/kernels:/usr/src/ \
    -v /lib/modules:/lib/modules \
    -v $SCRIPT_DIR/gtp5g:/host/gtp5g \
    -it psethi/gcc-centos:9.2

sed -i -e 's/linux-headers-//g' $SCRIPT_DIR/gtp5g/Makefile
docker exec -it $NAME bash -c "cd /host/gtp5g && make clean && make && make install"

docker stop $NAME
docker rm $NAME
