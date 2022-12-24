#!/usr/bin/env bash

echo "$(curl -s https://pkgs.alpinelinux.org/package/edge/testing/x86_64/kubectl | grep "Flag this package out of date" | sed -e 's/<[^>]*>//g' | sed -e 's/ //g')"

