ARG VERSION

FROM ghcr.io/k8s-at-home/ubuntu-jammy:v${VERSION}

ARG TARGETPLATFORM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

RUN \
  mkdir /custom && \
  usermod -l apps kah && \
  groupmod -n apps kah && \
  chown -R apps:apps /custom  && \
  chmod -R 777 /custom && \
  chown -R apps:apps /config

COPY ./base/ubuntu/shim/greeting.sh /shim/greeting.sh
COPY ./base/ubuntu/shim/steppingstone.sh /shim/steppingstone.sh

WORKDIR /app

USER apps

VOLUME [ "/config" ]


COPY ./base/ubuntu/entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/usr/bin/tini", "--" ]

LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"
