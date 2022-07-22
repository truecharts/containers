ARG VERSION
FROM alpine:${VERSION}

USER root

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

RUN apk update && apk add --no-cache ca-certificates tini curl nano wget bash unzip jq \
  && \
  addgroup apps -g 568 \
  && \
  adduser apps -u 568 -g 568 -D -S -H \
  && \
  mkdir -p /config \
  && chown -R apps:apps /config \
  && chmod -R 775 /config

WORKDIR /app
USER apps

VOLUME [ "/config" ]

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["echo", "'No can haz support yet. Chek bak l8r!'", "exit", "1337" ]

LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"


ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses=BSD-3-Clause
LABEL org.opencontainers.image.title=${CONTAINER_NAME}
LABEL org.opencontainers.image.url=https://truecharts.org/docs/charts/${CONTAINER_NAME}
LABEL org.opencontainers.image.version=${CONTAINER_VER}
LABEL org.opencontainers.image.description=Container for ${CONTAINER_NAME} by TrueCharts
LABEL org.opencontainers.image.authors=TrueCharts
LABEL org.opencontainers.image.documentation=https://truecharts.org/docs/charts/${CONTAINER_NAME}

