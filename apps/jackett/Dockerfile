FROM tccr.io/truecharts/alpine:latest@sha256:7503a6ed7092c08eb5a260fc2ebeca72bee811356ec3f562a4466eab978aa8a5

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV XDG_CONFIG_HOME=/config

USER root

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN \
    apk update --no-cache \
    && \
    apk add --no-cache \
        icu-dev \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='AMDx64' ;; \
    esac \
    && \
    wget -qO  - "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.Linux${ARCH}.tar.gz" \
        | tar xzf - -C /app --strip-components 1 \
    && \
    rm -rf \
        /app/JackettUpdater* \
    && \
    && rm -rf /var/cache/apk/* \
    && \
    rm -rf \
        /tmp/* \
    && chown -R apps:apps /app \
    && chmod -R u=rwX,go=rX /app \
    && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

COPY ./apps/jackett/entrypoint.sh /entrypoint.sh

USER apps
CMD ["/entrypoint.sh"]

LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
