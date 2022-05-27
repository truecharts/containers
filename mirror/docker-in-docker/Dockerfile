FROM docker:20.10.16-dind@sha256:88bc41871a4f89d258042f8e7ae1d34de7fd2604eaeedc9fd955121eedfe1cf6

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
