FROM docker:20.10.16-dind@sha256:77f672e987d599eb494988a41623aac7c36da2e28f577c8156a56c02d2bfa8cd

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
