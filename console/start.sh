#!/bin/sh

set -e

if ! (
        [ -r "keys/private.pem" ] &&
        [ -r "keys/public.pem" ]
    ); then
    mkdir -p keys
    openssl genrsa -out keys/private.pem 2048
    openssl rsa -in keys/private.pem -out keys/public.pem -pubout
fi

PRIVATE_KEY=$(cat keys/private.pem) PUBLIC_KEY=$(cat keys/public.pem) npm run start
