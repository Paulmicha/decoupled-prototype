#!/usr/bin/env bash

##
# Reinitializes current project instance without changing existing settings.
#
# @example
#   scripts/reinit.sh
#
#   # If restarting services is required immediately after :
#   scripts/reinit.sh and-restart
#

. cwt/bootstrap.sh

# Wipe out env vars to avoid pile-ups for 'append' type globals during reinit.
# See https://unix.stackexchange.com/a/49057
env -i \
  # Except common shell env vars some programs use.
  HOME="$HOME" LC_CTYPE="${LC_ALL:-${LC_CTYPE:-$LANG}}" PATH="$PATH" USER="$USER" \
  scripts/init.sh \
    "${INSTANCE_TYPE:=dev}" \
    "${HOST_TYPE:=local}" \
    "${INSTANCE_DOMAIN:=$(u_instance_domain)}" \
    "${PROVISION_USING:=docker-compose}"

# Optionally restart services.
case "$1" in 'and-restart')
  . cwt/instance/stop.sh
  . cwt/instance/start.sh
esac
