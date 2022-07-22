FROM docker:20.10.17-dind@sha256:c10de736621bc2d4a3a44297346640b62309db58f46822b87679d9419a6b321c

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
