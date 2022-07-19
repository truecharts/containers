FROM docker:20.10.17-dind@sha256:70cd116f750841065b75efc37f92051894dd66d2893af0ac2b78c60eb9abe0e7

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
