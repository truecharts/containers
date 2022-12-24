FROM alpine:3.17.0

ARG CONTAINER_NAME
ARG CONTAINER_VER

USER root

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

WORKDIR /app

# hadolint ignore=DL3018
RUN \
     apk update && apk add --no-cache ca-certificates \
  && addgroup apps -g 568 \
  && adduser apps -u 568 -g 568 -D -S -H \
  && mkdir -p /config \
  && chown -R apps:apps /config \
  && chmod -R 775 /config \
  && chown -R apps:apps /app \
  && chmod -R 775 /app \
  && update-ca-certificates

VOLUME [ "/config" ]

USER apps

COPY ./base/ubuntu/entrypoint.sh /entrypoint.sh
COPY ./base/ubuntu/shim /etc/profile.d

# iX NFS4_XDR WINACL ripped from toolkit ripped from TrueNAS SCALE 22.02.04
COPY ./base/ubuntu/nfs4xdr/* /usr/sbin/

LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
