FROM alpine as plugins

RUN apk add --update git

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

RUN \
  for plugin in $(env | grep "$PLUGIN_PREFIX"); \
    var_name=$(echo ${plugin} | cut -d '=' -f1); \
    plugin_repo=$(echo ${plugin} | cut -d '=' -f2); \
    version=$(echo "$VERSION_PREFIX$var_name" | cut -d '=' -f2); \
    echo "Cloning ${plugin_repo} at ${version} into /plugins-local/src/${plugin_repo}"; \
    git clone https://${plugin_repo} /plugins-local/src/${plugin_repo} \
      --depth 1 -branch ${version} --single-branch; \
  done

FROM traefik:v2.10.4@sha256:bbdacc7c3bec50bd2a4430e8a967df44376419634b733185a80ed79388134bdb
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
