#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"
file /app/jackett
#shellcheck disable=SC2086
exec \
    /app/jackett \
        --NoUpdates \
        "$@"
