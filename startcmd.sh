#!/bin/bash

if [ -z "$1" ] ; then
    port=8000
else
    port=$1
fi

docker build -t demo-xsendfile-websockets .
docker run -it --rm -p $port:80 --name tt -v $(pwd):/app:ro demo-xsendfile-websockets
