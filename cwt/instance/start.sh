#!/usr/bin/env bash

##
# [abstract] Starts this project instance's necessary services on host.
#
# This script provides an entry point for triggering a specific hook. "Abstract"
# means that CWT core itself doesn't provide any actual implementation for this
# functionality. In order for this script to have any effect, it is necessary
# to use an extension that does.
#
# The 'start' action triggers a 'pre'-prefixed hook before triggering the
# normal (unprefixed) hook. Same after ('post'-prefixed hook).
#
# To list all the possible paths that can be used among which existing files
# will be sourced when the hook is triggered, run (in this order) :
# $ make hook-debug s:instance p:pre a:start v:PROVISION_USING HOST_TYPE INSTANCE_TYPE
# $ make hook-debug s:instance a:start v:PROVISION_USING HOST_TYPE INSTANCE_TYPE
# $ make hook-debug s:instance p:post a:start v:PROVISION_USING HOST_TYPE INSTANCE_TYPE
#
# @example
#   make start
#   # Or :
#   cwt/instance/start.sh
#

. cwt/bootstrap.sh

hook -s 'instance' -p 'pre' -a 'start' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'
hook -s 'instance' -a 'start' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'
hook -s 'instance' -p 'post' -a 'start' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'
