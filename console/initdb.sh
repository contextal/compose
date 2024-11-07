#!/bin/bash

function setup() {
if [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_DB" ] || [ -z "$PG_USER" ] || [ -z "$PG_PASSWORD" ]; then
    echo ERROR: environment was not properly set
    return 1
fi

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOF
	CREATE USER $PG_USER WITH PASSWORD '$PG_PASSWORD';
	CREATE DATABASE $PG_DATABASE OWNER $PG_USER;
EOF
}

if ! setup; then
    rm -rf /var/lib/postgresql/data/*
    echo ERROR: init failed
    sleep 5
fi
