#!/usr/bin/env bash
version=$(cat ./apps/traefik/Dockerfile | grep "FROM traefik:" | cut -d ':' -f2 | cut -d '@' -f1 | cut -d '-' -f1 | cut -d 'v' -f2)
printf "%s" "${version}"
