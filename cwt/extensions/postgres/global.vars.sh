#!/usr/bin/env bash

##
# Global (env) vars for the 'postgres' CWT extension.
#
# This file is used during "instance init" to generate the global environment
# variables specific to current project instance.
#
# @see u_instance_init() in cwt/instance/instance.inc.sh
# @see cwt/utilities/global.sh
# @see cwt/bootstrap.sh
#

global SQL_CHARSET "[default]=utf8 [help]='Some DB operations like import (a db dump) require that we specify the default DB charset, i.e. the --default_character_set argument of the postgres program.'"
