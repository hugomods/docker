#!/bin/sh
set -e

# Treat the first argument as the sub-command of Hugo if it contains a "-" or is not a system command.
if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
  set -- hugo "$@"
fi

# Bind the 0.0.0.0 for Hugo server if the --bind is not set.
if [ "$1" = "hugo" ] && [ "$2" = "server" ]; then
  for var in "$@"
  do
    if [ "$var" = "--bind"* ]; then
      HUGO_SERVER_BIND=1
      break
    fi
  done
  if [ -z $HUGO_SERVER_BIND ]; then
    set -- "$@" --bind 0.0.0.0
  fi
fi

exec "$@"
