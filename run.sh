#!/bin/sh

args="$@ -H 0.0.0.0"

if [ -f /data/db.json ]; then
    args="$args db.json"
fi

if [ -f /data/auth.js ]; then
    args="$args --middlewares auth.js"
fi

if [ -f /data/routes.json ]; then
    args="$args --routes routes.json"
fi

json-server $args
