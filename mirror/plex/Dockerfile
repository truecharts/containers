FROM ghcr.io/k8s-at-home/plex:v1.27.2.5929-a806c5905@sha256:df1768fa98033e6b09fb604e7050f7c80a13ed499d40a1d8f487ad3e8968197e
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"


USER root

# hadolint ignore=DL3008,DL3015,SC2039,SC2086
RUN \
  apt-get -qq update \
  && \
  apt-get -qq install -y \
    gnupg2 ocl-icd-libopencl1 beignet-opencl-icd \
  && \
  apt-get remove -y aria2 gnupg2 jq \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /etc/default/plexmediaserver \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && chown -R kah:kah "${PLEX_MEDIA_SERVER_HOME}" \
  && chmod -R u=rwX,go=rX "${PLEX_MEDIA_SERVER_HOME}" \
  && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc
  
  USER kah

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses=BSD-3-Clause
LABEL org.opencontainers.image.title=${CONTAINER_NAME}
LABEL org.opencontainers.image.url=https://truecharts.org/docs/charts/${CONTAINER_NAME}
LABEL org.opencontainers.image.version=${CONTAINER_VER}
LABEL org.opencontainers.image.description=Container for ${CONTAINER_NAME} by TrueCharts
LABEL org.opencontainers.image.authors=TrueCharts
LABEL org.opencontainers.image.documentation=https://truecharts.org/docs/charts/${CONTAINER_NAME}

