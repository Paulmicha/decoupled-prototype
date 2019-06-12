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

# TODO [wip] narrow down this workaround for permission issues in node app.
global EXECUTABLE_DIRS "[append]=app/frontend"

global PROTECTED_FILES "[append]=app/backend/keys/*"
# global DRUPAL_CONFIG_SYNC_DIR "app/backend/config/sync"
global DRUPAL_CONFIG_SYNC_DIR "profiles/contrib/contenta_jsonapi/config/sync"
