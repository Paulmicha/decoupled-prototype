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

# The node container's "start" command depends on the local instance type.
# Convention : name the command after INSTANCE_TYPE value (i.e. dev, stage, or
# prod).
global NODE_COMMAND "sh -c 'npm install && npm run $INSTANCE_TYPE'"

# Use latest images as of 2019/06/04.
# See https://github.com/wodby/docker4php/blob/master/.env
global POSTGRES_TAG '11-1.6.3'
global NODE_TAG='12-0.16.0'
# global PHP_TAG '5.6-dev-4.11.12'
global PHP_TAG '7.3-dev-4.11.12'
global NGINX_TAG '1.15-5.3.0'
global ADMINER_TAG='4-3.5.12'
# global ATHENAPDF_TAG='2.10.0'
# global RSYSLOG_TAG='latest'
# global WEBGRIND_TAG='1.5-1.9.12'

# Dump DB credentials for local dev.
# TODO [prod-check] Proper DB credentials management.
global DB_HOST='postgres'
global DB_DRIVER='pgsql'
global DB_NAME='app'
global DB_USER='app'
global DB_PASSWORD='app'
global DB_ROOT_PASSWORD='app'
