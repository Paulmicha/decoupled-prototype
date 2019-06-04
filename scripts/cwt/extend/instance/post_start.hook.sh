#!/usr/bin/env bash

##
# Implements hook -s 'instance' -p 'post' -a 'start' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'
#
# Uses a post-process hook to make sure this runs after :
# cwt/extensions/docker-compose/instance/start.docker-compose.hook.sh
#
# @see cwt/instance/start.sh
#

case "$INSTANCE_TYPE" in dev)
  npm run dev
esac
