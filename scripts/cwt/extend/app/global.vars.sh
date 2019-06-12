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

# TODO [hack] narrow down.
global EXECUTABLE_DIRS "[append]=app/frontend"

# TODO [wip] use drupalwt CWT extension.
# @see cwt/extensions/drupalwt
