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

# TODO [wip] narrow down this workaround for permission issues in node app.
global EXECUTABLE_DIRS "[append]=app/frontend"

# TODO [wip] attempt to deal with permission issues in drupalwt CWT extension.
global EXECUTABLE_DIRS "[append]=app/backend/vendor"

# Contenta CMS keys require 660 instead of 444 (currently used on all
# PROTECTED_FILES).
# @see scripts/cwt/extend/instance/fs_perms_set.local.dev.hook.sh
# global PROTECTED_FILES "[append]=app/backend/keys/*"
