#!/usr/bin/env bash

##
# Implements u_hook_most_specific -s 'db' -a 'clear' -v 'PROVISION_USING'
#
# This file is dynamically included when the "hook" is triggered.
# @see u_db_import() in cwt/extensions/db/db.inc.sh
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
#   - DB_TABLES_SKIP_DATA - defaults to an empty string.
# @see u_db_get_credentials() in cwt/extensions/db/db.inc.sh
#
# @example
#   make db-clear
#   # Or :
#   cwt/extensions/db/db/clear.sh
#

# TODO [wip]