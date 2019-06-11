#!/usr/bin/env bash

##
# Implements u_hook_most_specific -s 'db' -a 'create' -v 'PROVISION_USING'.
#
# This file is dynamically included when the "hook" is triggered.
# @see u_db_create() in cwt/extensions/db/db.inc.sh
#
# The following variables are available here :
#   - DB_ID - defaults to 'default'.
#   - DB_DRIVER - defaults to 'mysql'.
#   - DB_HOST - defaults to 'localhost'.
#   - DB_PORT - defaults to '3306' or '5432' if DB_DRIVER is 'postgres'.
#   - DB_NAME - defaults to "$DB_ID".
#   - DB_USERNAME - defaults to first 16 characters of DB_ID.
#   - DB_PASSWORD - defaults to 14 random characters.
#   - DB_ADMIN_USERNAME - defaults to DB_USERNAME.
#   - DB_ADMIN_PASSWORD - defaults to DB_PASSWORD.
#
# @example
#   make db-create
#   # Or :
#   cwt/extensions/db/db/create.sh
#

# Limit user name to 32 characters.
# Warning : this creates naming collision risks (considered edge case).
postgres_db_username="${DB_USERNAME:0:32}"

echo "Creating database '$DB_NAME' ..."

PGPASSWORD="${DB_PASSWORD}" \
  createdb \
    -U"${DB_USERNAME}" \
    -h"${DB_HOST}" \
    -p"${DB_PORT}" \
    "${DB_NAME}"

echo "Creating database '$DB_NAME' : done."
