FROM tccr.io/truecharts/alpine:latest@sha256:7503a6ed7092c08eb5a260fc2ebeca72bee811356ec3f562a4466eab978aa8a5

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV XDG_CONFIG_HOME=/config

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN \
    apk update \
    && \
    apk add \
        libicu-dev \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='AMDx64' ;; \
        'linux/arm64') export ARCH='ARM64' ;; \
    esac \
    && \
    wget -O - "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.Linux${ARCH}.tar.gz" \
        | tar -xz -C /app --strip-components 1 \
    && \
    rm -rf \
        /app/JackettUpdater* \
    && \
    apk del \
        libicu-dev \
    && \
    rm -rf \
        /var/cache/apk/* \
    && adduser -S kah \
    && chown -R root:root /app \
    && chmod -R 755 /app \
    && echo "umask ${UMASK}" >> /etc/bash.bashrc

COPY ./apps/jackett/entrypoint.sh /entrypoint.sh

USER kah
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