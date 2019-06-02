#!/usr/bin/env bash

##
# (Re)initializes current project instance.
#
# @param 1 [optional] String instance type. Defaults to 'dev'.
# @param 2 [optional] String HOST_TYPE global value (flags instance as remote).
#   Defaults to 'local'.
# @param 3 [optional] String INSTANCE_DOMAIN global value. Defaults to a
#   fictional local domain generated using PROJECT_DOCROOT's folder name.
# @param 4 [optional] String PROVISION_USING global value. Defaults to
#   'docker-compose'.
#
# @example
#   scripts/init.sh
#

# Defaults (overridable using parameters to this script).
instance_type='dev'
host_type='local'
instance_domain=''
provision_using='docker-compose'

if [[ -n "$1" ]]; then
  instance_type="$1"
fi

if [[ -n "$2" ]]; then
  host_type="$2"
fi

if [[ -n "$3" ]]; then
  instance_domain="$3"
else
  # Generates a default domain name based on current dir name and local host IP.
  . cwt/host/host.inc.sh
  . cwt/instance/instance.inc.sh
  instance_domain=$(u_instance_domain)
fi

if [[ -n "$4" ]]; then
  provision_using="$4"
fi

echo
echo "(Re)initializing $host_type instance (type : $instance_type) using $provision_using ..."

# TODO [wip] separate Git repo for app ?
cwt/instance/init.sh \
  # -a "$PWD/app/web" \
  -a "$PWD/app" \
  -t "$instance_type" \
  -h "$host_type" \
  -p "$provision_using" \
  -d "$instance_domain" \
  # -g 'TODO git repo using sh ?' \
  # -i "$PWD/app" \
  -y

if [[ $? -ne 0 ]]; then
  echo >&2
  echo "Error in $BASH_SOURCE line $LINENO: 'instance init' failed." >&2
  echo "-> Aborting (1)." >&2
  echo >&2
  exit 1
fi

echo "(re)initializing local instance : done."
echo
