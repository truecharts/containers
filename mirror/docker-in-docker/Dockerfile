FROM docker:20.10.16-dind@sha256:4e6110013c1d73f65f0635a2c498c3e59105efc092c1a930bbc480391b6e0f24

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
