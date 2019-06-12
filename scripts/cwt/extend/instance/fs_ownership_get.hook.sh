#!/usr/bin/env bash

##
# Implements hook -s 'app instance' -a 'fs_ownership_get' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'
#
# Provide the user who must be set as owner of dirs and files writeable by php.
# To apply, run :
#   sudo cwt/instance/fix_ownership.sh
#   # Or :
#   sudo make fix-ownership
#
# Here are the variable names that can be set here and their default value :
# FS_OWNER : [optional] owner of all files and dirs.
#   Defaults to current user, even if sudoing.
# FS_GROUP : [optional] group ownership of all files and dirs.
#   Defaults to $FS_OWNER.
# FS_W_OWNER : [optional] owner of Writeable files and dirs.
#   Defaults to $FS_OWNER.
# FS_W_GROUP : [optional] group ownership of Writeable files and dirs.
#   Defaults to $FS_W_OWNER.
#
# This file is dynamically included when the "hook" is triggered.
# @see u_instance_get_ownership() in cwt/instance/instance.inc.sh
#
# To verify which files can be used (and will be sourced) when this hook is
# triggered :
# $ make hook-debug s:app instance a:fs_ownership_get v:PROVISION_USING HOST_TYPE INSTANCE_TYPE
#

# Default container user is wodby:wodby (UID/GID 1000).
# PHP-FPM runs from www-data:www-data user (UID/GID 82) by default.
# User wodby is a part of www-data group.
# See https://github.com/wodby/php#users-and-permissions
# TODO [fail] workaround : make all writeable dirs world writeable.
FS_W_OWNER='82'
