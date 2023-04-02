#!/bin/bash

notify_push_version="$(
	git ls-remote --tags https://github.com/nextcloud/notify_push.git \
		| cut -d/ -f3 \
		| grep -vE -- '-rc|-b' \
		| tr -d '^{}' \
		| sed -E 's/^v//' \
		| sort -V \
		| tail -1
)"

echo "updating notify_push $notify_push_version"

curr_dir=$(pwd)
sed -re 's/^ENV NOTIFY_PUSH_VERSION .*$/ENV NOTIFY_PUSH_VERSION '"$notify_push_version"'/;' -i "$curr_dir/Dockerfile"
