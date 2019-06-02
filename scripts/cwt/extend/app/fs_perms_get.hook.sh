#!/usr/bin/env bash

##
# Implements hook -a 'fs_perms_get' -s 'app instance' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'.
#
# Gets filesystem ownership and permissions settings.
#
# By convention, these are specified using the following (mutable) variables in
# calling scope :
#
# FS_NW_FILES : [optional] permissions to apply to Non-Writeable files.
#   Defaults to 0644.
# FS_NW_DIRS : [optional] permissions to apply to Non-Writeable folders.
#   Defaults to 0755.
# FS_P_FILES : [optional] permissions to apply to Protected files.
#   Defaults to 0444.
# FS_E_FILES : [optional] permissions to apply to Exectuable files.
#   Defaults to 0755.
# FS_W_FILES : [optional] permissions to apply to Writeable files.
#   Defaults to 0774.
# FS_W_DIRS: [optional] permissions to apply to Writeable folders.
#   Defaults to 1771.
#
# To verify which files can be used (and will be sourced) to declare these vars :
# $ make hook-debug s:app instance a:fs_perms_get v:PROVISION_USING HOST_TYPE INSTANCE_TYPE
#
# @see u_instance_get_permissions()
#

FS_W_DIRS='775'
FS_W_FILES='775'
