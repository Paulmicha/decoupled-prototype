#!/usr/bin/env bash

##
# Stack-specific custom CWT globals for instances using docker-compose.
#
# This file is used during "instance init" to generate the global environment
# variables specific to current project instance.
#
# @see u_instance_init() in cwt/instance/instance.inc.sh
# @see cwt/utilities/global.sh
# @see cwt/bootstrap.sh
#

# Do not convert local app Git hooks to CWT hooks by default.
global APP_GIT_INIT_HOOK 'no'
