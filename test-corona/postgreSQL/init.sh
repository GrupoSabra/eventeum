#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"
DB_NAME="CovidDB"
echo "Creating database: ${DB_NAME}"

$POSTGRES <<EOSQL
CREATE DATABASE ${DB_NAME} OWNER ${POSTGRES_USER};
EOSQL

echo "Creating countries..."
psql -d ${DB_NAME} -a -U${POSTGRES_USER} -f /countries-bin.sql

echo "Creating states..."
psql -d ${DB_NAME} -a  -U${POSTGRES_USER} -f /states-bin.sql