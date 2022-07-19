FROM docker:20.10.17-dind@sha256:1dae0a94309e28ad8cf584ebfa7896589c62556c035f11a5e5a9e564b80fdb1a

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
