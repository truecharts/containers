FROM ghcr.io/k8s-at-home/plex:v1.27.1.5916-6b0e31a64@sha256:f69a98096f64ef56567be5f362735a66068c3a321ab52f90bc20489203f061f6
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
