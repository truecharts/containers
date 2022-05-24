FROM docker:20.10.16-dind@sha256:d8b7b9468fe6dc26f008f6eadafa2845dc0408a3c5e86fc9e04f6bcc2d98bf13

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
