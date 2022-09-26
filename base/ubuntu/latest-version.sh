#!/usr/bin/env bash

TOKEN=$(curl https://ghcr.io/token\?scope\="repository:onedr0p/ubuntu:pull" | jq --raw-output '.[]')
version=$(curl -H "Authorization: Bearer ${TOKEN}" https://ghcr.io/v2/onedr0p/ubuntu/tags/list | jq --raw-output '.tags[]' | grep -v latest | grep -v buildcache | tail -n1)
version="${version#*v}"
version="${version#*release-}"
echo "${version}"
