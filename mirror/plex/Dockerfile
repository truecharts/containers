FROM ghcr.io/k8s-at-home/plex:v1.26.2.5797-5bd057d2b@sha256:c5366c146110889d9d693917d246320d1b7f41d055723f6ae53782b6b1586812
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
