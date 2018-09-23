#!/bin/sh

args="$@ -H 0.0.0.0"

if [ -f /json-server/data/db.json ]; then
    args="$args db.json"
fi

if [ -f /json-server/data/auth.js ]; then
    args="$args --middlewares auth.js"
fi

if [ -f /json-server/data/routes.json ]; then
    args="$args --routes routes.json"
fi

json-server $args
