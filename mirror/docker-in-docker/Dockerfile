FROM docker:20.10.17-dind@sha256:a7a9383d0631b5f6b59f0a8138912d20b63c9320127e3fb065cb9ca0257a58b2

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
