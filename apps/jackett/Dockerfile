FROM tccr.io/truecharts/alpine:latest@sha256:51d5ca7b0e2c325b818c661b2482a4c9025871a325c74dde5f3e9cf8661560bf

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
        sqlite-libs \
        gcompat \
        icu-libs \
        krb5-libs \
        libgcc \
        libintl \
        libssl1.1 \
        libstdc++ \
        zlib \
    && wget -qO  - "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" \
        | tar xzf - -C /app --strip-components 1 \
    && rm -rf  \
      /tmp/* \
      /var/cache/apk/* \
      /var/tmp/ \
      /app/JackettUpdater* \
    && chown -R apps:apps /app \
    && chmod -R 775 /app \
    && ls -l /app \
    && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc

USER apps

EXPOSE 9117

COPY ./apps/jackett/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
