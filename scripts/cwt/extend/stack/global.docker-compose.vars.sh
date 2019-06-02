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

# Generate and write the docker-compose.yml file in project docroot.
global DC_MODE 'generate'
global DC_YML_VARIANTS "$INSTANCE_TYPE $HOST_TYPE"
