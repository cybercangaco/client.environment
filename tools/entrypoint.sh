#!/bin/sh

if [ ! -d "$(pwd)/node_modules" ]; then
    /usr/local/bin/npm install
    /usr/local/bin/npm cache clean --force
fi

if [ ! -d "$(pwd)/.nuxt" ]; then
    /usr/local/bin/npm run build
fi

if [[ ! -z "$1" ]]; then
    if [[ -z "$(which -- $1)" ]]; then
        /usr/local/bin/npm run "$@"
    else
        exec "$@"
    fi
elif [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm run start
fi