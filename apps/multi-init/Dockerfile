# hadolint ignore=DL3007
FROM ghcr.io/truecharts/ubuntu:latest@sha256:9a6f471ddbf0eef2756447985a66fa7b7c125db5d6760e94233545245e678f22


ARG TARGETPLATFORM
ARG VERSION

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN \
  apt-get -qq update \
  && \
  apt-get -qq install -y \
    libicu66 \
    jq \
    gnupg \
    redis-server \
    postgresql-client \
    mariadb-client \
    nfs4-acl-tools \
    wget \
  && \
  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - \
  && \
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list \
  && \
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='linux-x64' ;; \
  esac \
  && \
  apt-get -qq update \
  && \
  apt-get -qq install -y \
    mongodb-org \
  && apt-get remove -y \
    jq \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && chmod -R u=rwX,go=rX /app \
  && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc \
  && update-ca-certificates

COPY ./apps/multi-init/entrypoint.sh /entrypoint.sh
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
