#!/usr/bin/env bash

##
# Implements hook -a 'fs_perms_set' -s 'app instance' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'.
#
# (Re)sets the corresponding permissions to any list of paths optionally
# defined in the following globals (env vars) :
# - PROTECTED_FILES : e.g. path to sensitive settings file(s).
# - EXECUTABLE_FILES : e.g. custom app-related scripts.
# - EXECUTABLE_DIRS : same but applies to entire dir (+ sub-dirs).
# - WRITEABLE_DIRS : e.g. path to folders (files, tmp, private) that must be
#     writeable by the application.
# - WRITEABLE_FILES : additional files (outside of WRITEABLE_DIRS) that must be
#     writeable by the application.
#
# This file is dynamically included when the "hook" is triggered.
# @see u_instance_set_permissions() in cwt/instance/instance.inc.sh
#
# To verify which files can be used (and will be sourced) when this hook is
# triggered :
# $ make hook-debug s:app instance a:fs_perms_set v:PROVISION_USING HOST_TYPE INSTANCE_TYPE
#

if [[ -n "$WRITEABLE_FILES" ]]; then
  for writeable_file in $WRITEABLE_FILES; do
    if [[ ! -f "$writeable_file" ]]; then
      continue
    fi
    echo "Setting writeable file permissions $FS_W_FILES to '$writeable_file'"
    chmod "$FS_W_FILES" "$writeable_file"
    check_chmod=$?
    if [ $check_chmod -ne 0 ]; then
      echo >&2
      echo "Error in $BASH_SOURCE line $LINENO: chmod exited with non-zero status ($check_chmod)." >&2
      echo "-> Aborting (1)." >&2
      echo >&2
      exit 1
    fi
  done
fi

if [[ -n "$WRITEABLE_DIRS" ]]; then
  for writeable_dir in $WRITEABLE_DIRS; do
    if [[ ! -d "$writeable_dir" ]]; then
      continue
    fi
    # HACK : docker-compose projects may have subdirs where this returns many
    # errors we don't care about, so we prevent errors from polluting output.
    # (See docker-compose ownership issues).
    (\
      echo "Setting writeable file permissions $FS_W_FILES to files inside '$writeable_dir'" \
      & find "$writeable_dir" -type f -exec chmod "$FS_W_FILES" {} + \
      & echo "Setting writeable dir permissions $FS_W_DIRS to '$writeable_dir'" \
      & find "$writeable_dir" -type d -exec chmod "$FS_W_DIRS" {} + \
    ) 2> /dev/null
  done
fi

if [[ -n "$PROTECTED_FILES" ]]; then
  for protected_file in $PROTECTED_FILES; do
    if [[ ! -f "$protected_file" ]]; then
      continue
    fi
    echo "Setting protected file permissions $FS_P_FILES to '$protected_file'"
    chmod "$FS_P_FILES" "$protected_file"
    check_chmod=$?
    if [ $check_chmod -ne 0 ]; then
      echo >&2
      echo "Error in $BASH_SOURCE line $LINENO: chmod exited with non-zero status ($check_chmod)." >&2
      echo "-> Aborting (2)." >&2
      echo >&2
      exit 2
    fi
  done
fi

if [[ -n "$EXECUTABLE_FILES" ]]; then
  for executable_file in $EXECUTABLE_FILES; do
    if [[ ! -f "$executable_file" ]]; then
      continue
    fi
    echo "Setting executable file permissions $FS_E_FILES to '$executable_file'"
    chmod "$FS_E_FILES" "$executable_file"
    check_chmod=$?
    if [ $check_chmod -ne 0 ]; then
      echo >&2
      echo "Error in $BASH_SOURCE line $LINENO: chmod exited with non-zero status ($check_chmod)." >&2
      echo "-> Aborting (3)." >&2
      echo >&2
      exit 3
    fi
  done
fi

if [[ -n "$EXECUTABLE_DIRS" ]]; then
  for executable_dir in $EXECUTABLE_DIRS; do
    if [[ ! -d "$executable_dir" ]]; then
      continue
    fi
    # HACK : docker-compose projects may have subdirs where this returns many
    # errors we don't care about, so we prevent errors from polluting output.
    # (See docker-compose ownership issues).
    (\
      echo "Setting executable file permissions $FS_E_FILES to files inside '$executable_dir'" \
      & find "$executable_dir" -type f -exec chmod "$FS_E_FILES" {} + \
      & echo "Setting executable dir permissions $FS_NW_DIRS to '$executable_dir'" \
      & find "$executable_dir" -type d -exec chmod "$FS_NW_DIRS" {} + \
    ) 2> /dev/null
  done
fi
