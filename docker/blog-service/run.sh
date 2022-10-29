#!/bin/sh

# sass -s compressed --no-source-map --verbose -w blog/src/sass/style.scss blog/static/style.css &
sass --no-source-map --verbose -w blog/src/sass/style.scss blog/static/style.css &
sh /run-service.sh &

wait