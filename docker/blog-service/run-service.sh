#!/bin/sh

while true; do

cd /go/blog-service/blog/src/cmd && dlv debug -l ":2345" --continue --api-version 2 --headless --log --accept-multiclient --output "/tmp/__blog_debug_bin" --build-flags "-buildvcs=false" &

PID=$!

inotifywait -e modify -e create -e delete -e move -e attrib -r --exclude "\.(css|js|html|git|scss)" /go/blog-service/blog

kill -9 $PID
pkill -f "/tmp/__blog_debug_bin"
done