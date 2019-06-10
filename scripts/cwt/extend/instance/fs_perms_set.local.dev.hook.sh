#!/usr/bin/env bash

##
# Implements hook -s 'app instance' -a 'fs_perms_set' -v 'PROVISION_USING HOST_TYPE INSTANCE_TYPE'.
#
# (Re)sets filesystem permissions *for local dev instances* to workaround some
# issues with code editors extensions like Php IntelliSense for VSC.
# See https://github.com/felixfbecker/php-language-server/issues/462#issuecomment-472305825
#
# This file is dynamically included when the "hook" is triggered.
# @see u_instance_set_permissions() in cwt/instance/instance.inc.sh
#

# Make the DB files world readable.
# TODO [wip] sudoers config.
# sudo chmod -R o+rx data/db
