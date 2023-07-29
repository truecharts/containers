FROM traefik:v2.10.4@sha256:bbdacc7c3bec50bd2a4430e8a967df44376419634b733185a80ed79388134bdb


FROM alpine:3.18.2 as plugins

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache --update git

# Theme Park
ARG TC_PLUGIN_THEME_PARK=github.com/packruler/traefik-themepark
ARG VERSION_TC_PLUGIN_THEME_PARK_VERSION=v1.3.0
# GeoBlock
ARG TC_PLUGIN_GEOBLOCK=github.com/PascalMinder/geoblock
ARG VERSION_TC_PLUGIN_GEOBLOCK_VERSION=v0.2.6
# RealIP - FIXME: Project is archived
ARG TC_PLUGIN_REALIP=github.com/soulbalz/traefik-real-ip
ARG VERSION_TC_PLUGIN_REALIP_VERSION=v1.0.3

# Script args
ARG PLUGIN_PREFIX=TC_PLUGIN_
ARG VERSION_PREFIX=VERSION_

ADD clone-plugins.sh /clone-plugins.sh
RUN chmod +x /clone-plugins.sh && /clone-plugins.sh

FROM traefik:v2.10.4@sha256:bbdacc7c3bec50bd2a4430e8a967df44376419634b733185a80ed79388134bdb
# Copy the plugins from the previous stage
COPY --from=plugins /plugins-local /plugins-local

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
