# hadolint ignore=DL3007
FROM ghcr.io/xstar97/my-proxy-service:v0.0.3@sha256:272f4af7f79fac47de413b9a756d2ca23df27df4fb5af2e41a2c9f8cfe6ce642

ARG VERSION

# Set environment variables
ENV PORT=3000

# Expose the port
EXPOSE $PORT

CMD sh -c "./my-proxy-service"

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
