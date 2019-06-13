#!/usr/bin/env bash

##
# App-related custom CWT globals.
#
# This file is used during "instance init" to generate the global environment
# variables specific to current project instance.
#
# @see u_instance_init() in cwt/instance/instance.inc.sh
# @see cwt/utilities/global.sh
# @see cwt/bootstrap.sh
#

# Note : for "normal" projects, use config_ignore + config_split + the path
# commented out below instead of the contenta_jsonapi install profile dir.
# global DRUPAL_CONFIG_SYNC_DIR 'app/backend/config/sync'
# global DRUPAL_CONFIG_SYNC_DIR_C '/var/www/html/config/sync'
global DRUPAL_CONFIG_SYNC_DIR 'app/backend/web/profiles/contrib/contenta_jsonapi/config/sync'
global DRUPAL_CONFIG_SYNC_DIR_C 'profiles/contrib/contenta_jsonapi/config/sync'
