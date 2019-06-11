#!/usr/bin/env bash

##
# Implements u_hook_most_specific -s 'db' -a 'import' -v 'PROVISION_USING'
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
#   make db-import
#   # Or :
#   cwt/extensions/db/db/import.sh
#

# Prereq check :
# The source file "$db_dump_file" MUST exist and be accessible.
if [[ ! -f "$db_dump_file" ]]; then
  echo >&2
  echo "Error in $BASH_SOURCE line $LINENO: the DB dump file '$db_dump_file' is missing or inaccessible." >&2
  echo "-> Aborting (1)." >&2
  echo >&2
  exit 1
fi

mysql --default_character_set="$SQL_CHARSET" \
  --user="$DB_USERNAME" \
  --password="$DB_PASSWORD" \
  --host="$DB_HOST" \
  --port="$DB_PORT" \
  -B \
  "$DB_NAME" < "$db_dump_file"

if [[ $? -ne 0 ]]; then
  echo >&2
  echo "Error in $BASH_SOURCE line $LINENO: unable to import dump file '$db_dump_file' into DB '$DB_NAME'." >&2
  echo "-> Aborting (3)." >&2
  echo >&2
  exit 3
fi
