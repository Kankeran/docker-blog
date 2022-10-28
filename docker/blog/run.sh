#!/bin/sh

while true; do

cd /go/blog && dlv debug -l ":2345" --continue --api-version 2 --headless --log --accept-multiclient --output "/tmp/__debug_bin" --build-flags "-buildvcs=false" &

PID = $!

inotifywait -e modify -e create -e delete -e move -e attrib -r --exclude "\.(css|js|html|git)" /go/blog

kill -9 $PID
pkill -f "/tmp/__debug_bin"
done