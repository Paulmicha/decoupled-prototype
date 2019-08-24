#!/usr/bin/env bash

##
# Implements hook -s 'app' -a 'install' -v 'PROVISION_USING INSTANCE_TYPE'
#
# Setup new project instance. Should only be launched once, upon creation of a
# new local project instance.
#
# This file is dynamically included when the "hook" is triggered.
#
# Debug lookup paths (make sure this file gets picked up) :
# $ make hook-debug s:app a:install v:PROVISION_USING INSTANCE_TYPE
#
# @example
#   make app-install
#   # Or :
#   cwt/app/install.sh
#

. cwt/bootstrap.sh

composer install

# TODO [evol] allow parameters and/or per instance type defaults variants.
drush site-install contenta_jsonapi --verbose --yes \
  --root='/var/www/html/web' \
  --db-url="$DB_DRIVER://$DB_USER:$DB_PASS@$DB_HOST:$DB_PORT/$DB_NAME" \
  --site-mail='site@decoupled-prototype.io' \
  --account-mail='admin@decoupled-prototype.io' \
  --site-name='Decoupled prototype' \
  --account-name='admin' \
  --account-pass='admin'
