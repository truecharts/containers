FROM tccr.io/truecharts/alpine:latest@sha256:345143bb810820b0fd300b67d57780b25729a3cccc3036da18c9603e5e805dc8

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

USER root

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN \
    apk update --no-cache \
    && apk add --no-cache \
        icu-dev \
    && wget -qO  - "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" \
        | tar xzf - -C /app --strip-components 1 \
    && rm -rf  \
      /tmp/* \
      /var/cache/apk/* \
      /var/tmp/ \
      /app/JackettUpdater* \
    && chown -R apps:apps /app \
    && chmod -R 775 /app \
    && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

COPY ./apps/jackett/entrypoint.sh /entrypoint.sh

USER apps
CMD ["/entrypoint.sh"]

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
