FROM docker:20.10.16-dind@sha256:56ef400f08be1ca817d7e2cfdb43803786ab28d84c8167e8590622d9bab5b415

# hadolint ignore=DL3008,DL3019,DL3018,DL3015,SC2086,SC2155
RUN apk update && apk add nano docker-compose curl bash

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
