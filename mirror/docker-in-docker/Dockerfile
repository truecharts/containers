FROM docker:20.10.17-dind@sha256:6dd895238f055a79a6d044f7d97b668bef0f9a840e5eed06fa01f1a6b7aed17e

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
