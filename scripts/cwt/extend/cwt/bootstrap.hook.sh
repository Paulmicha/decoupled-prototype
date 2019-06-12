#!/usr/bin/env bash

##
# Implements hook -s 'cwt' -a 'bootstrap' -v 'PROVISION_USING'.
#
# Provides custom bash alias specific to current project.
#
# The global variable $DC_TTY contains the "interactive" flag for
# docker-compose exec / run commands.
# @see cwt/extensions/docker-compose/cwt/pre_bootstrap.docker-compose.hook.sh
#

alias node="docker-compose exec $DC_TTY node node"
alias npm="docker-compose exec $DC_TTY node npm"
alias npx="docker-compose exec $DC_TTY node npx"
